#' Convert symbols from 'mjai' format
#'
#' Converts symbols from 'mjai' format into 'cmajiang' format.
#' To read 'mjai' format logs, use `convlog::read_tenhou6()`.
#'
#' @rdname mjai
#' @name convert-from-mjai
#' @param perspective An integer vector
#' that indicates the plyaer's perspective.
#' @param target An integer vector
#' that represents the target of 'mjai' events.
#' @param type A character vector that represents the type of 'mjai' events.
#' @param pai A character vector of tiles to be converted
#' from 'mjai' format into 'cmajiang' format.
#' @param consumed A list of character vectors
#' that represent the 'consumed' tiles in 'mjai' format.
#' @returns A character vector.
#' @examples
#' if (requireNamespace("dplyr", quietly = TRUE)) {
#'   data("ranked_game")
#'   ranked_game[["paifu"]] |>
#'     dplyr::filter(
#'       type %in% c("tsumo", "dahai", "chi", "pon", "daiminkan", "kakan", "ankan")
#'     ) |>
#'     dplyr::mutate(
#'       target = mjai_target(actor, target),
#'       pai = trans_tile(pai)
#'     ) |>
#'     dplyr::group_by(game_id, round_id, actor) |>
#'     dplyr::mutate(pai = mjai_conv(type, pai, consumed, target)) |>
#'     dplyr::ungroup()
#' }
NULL

#' @rdname mjai
#' @export
mjai_target <- function(perspective, target) {
  # fill NAs in perspective with corresponding target
  perspective[is.na(perspective)] <- target[is.na(perspective)]
  # then, fill NAs in target with corresponding perspective
  target[is.na(target)] <- perspective[is.na(target)]

  purrr::map2_chr(perspective, target, function(p, t) {
    shifted <- c(0:3 + p) %% 4
    mapping <-
      rlang::set_names(
        rep(c(NA_character_, "+", "=", "-")),
        as.character(shifted)
      )
    unname(mapping[as.character(t)])
  })
}

#' @rdname mjai
#' @export
mjai_conv <- function(type, pai, consumed, target) {
  if (any(type == "chi")) {
    pai[type == "chi"] <-
      mjai_chi(pai[type == "chi"], consumed[type == "chi"], target = "-")
  }
  if (any(type == "pon")) {
    pai[type == "pon"] <-
      mjai_peng(pai[type == "pon"], consumed[type == "pon"], target[type == "pon"])
  }
  if (any(type == "daiminkan")) {
    pai[type == "daiminkan"] <-
      mjai_damingang(pai[type == "daiminkan"], consumed[type == "daiminkan"], target[type == "daiminkan"])
  }
  if (any(type == "ankan")) {
    pai[type == "ankan"] <-
      mjai_angang(consumed[type == "ankan"])
  }
  if (any(type == "kakan")) {
    pai <-
      mjai_jiagang(pai, type)
  }
  pai
}

mjai_chi <- function(pai, consumed, target = "-") {
  if (!all(pai %in% tiles[["cmajiang"]])) {
    rlang::abort("Use `cmajiang` style tiles in `pai`.")
  }
  purrr::imap_chr(consumed, function(other_tiles, i) {
    other_tiles <- trans_tile(other_tiles, from = "mjai", to = "cmajiang")
    # any chi must have 2 different 'consumed' tiles, if not, returns NA.
    if (length(unique(other_tiles)) != 2 ||
      all(other_tiles %in% c("m0", "p0", "s0", "m5", "p5", "s5"))) {
      return(NA_character_)
    }
    target_tile <- trans_tile(pai[i], from = "cmajiang", to = "id")
    pos <- which(
      sort(
        c(target_tile, trans_tile(other_tiles, from = "cmajiang", to = "id"))
      ) == target_tile
    )
    switch(as.character(pos),
      "1" = paste0(
        pai[i], target,
        paste0(tile2rank(other_tiles), collapse = ""),
        collapse = ""
      ),
      "2" = paste0(
        other_tiles[1],
        tile2rank(pai[i]), target, tile2rank(other_tiles[2]),
        collapse = ""
      ),
      "3" = paste0(
        other_tiles[1],
        paste0(tile2rank(c(other_tiles[2], pai[i])), collapse = ""), target,
        collapse = ""
      )
    )
  })
}

mjai_peng <- function(pai, consumed, target) {
  if (any(!pai %in% tiles[["cmajiang"]])) {
    rlang::abort("Use `cmajiang` style tiles in `pai`.")
  }
  purrr::imap_chr(consumed, function(other_tiles, i) {
    other_tiles <- trans_tile(other_tiles, from = "mjai", to = "cmajiang")
    paste0(
      other_tiles[1],
      paste0(tile2rank(c(other_tiles[-1], pai[i])), collapse = ""), target[i],
      collapse = ""
    )
  })
}

mjai_damingang <- function(pai, consumed, target) {
  # same as peng
  mjai_peng(pai, consumed, target)
}

mjai_jiagang <- function(pai, type) {
  # filling kakan is a bit tricky
  # because we cannot get the corresponding pon-mianzi directly
  # from the 'consumed' vectors in mjai format.
  # so, they have to be filled in previous step.
  memo <- pai[type == "pon"]
  if (rlang::is_empty(memo)) {
    return(pai)
  }
  consumed <- purrr::map_chr(pai[type == "kakan"], function(p) {
    p <- if (p %in% c("m0", "p0", "s0", "m5", "p5", "s5")) "(?=[mpsz][05])" else p
    memo[stringi::stri_detect_regex(stringi::stri_sub(memo, 1, 2), p)]
  })
  pai[type == "kakan"] <-
    paste0(consumed, tile2rank(pai[type == "kakan"]))
  pai
}

mjai_angang <- function(consumed) {
  purrr::map_chr(consumed, function(tiles) {
    tiles <- trans_tile(tiles, from = "mjai", to = "cmajiang")
    paste0(
      tiles[1],
      paste0(tile2rank(tiles[-1]), collapse = ""),
      collapse = ""
    )
  })
}
