utils::globalVariables(c("hupai", "tiles"))

#' Plot a player's hand as an image
#'
#' This function is a short hand for `paistr(pai) |> plot()`
#'
#' @param pai A character vector.
#' @param ... Other arguments passed to `plot()`.
#' @seealso \code{\link{paistr}}
#' @export
hand2img <- function(pai, ...) {
  paistr(pai) |>
    plot(...)
}

#' Convert integers to tiles
#'
#' @param x An integer vector.
#' @param origin A string scalar. Either "zero" or "one".
#' @returns A factor.
#' @export
#' @examples
#' int2tile(c(0, 1, 25, 37))
int2tile <- function(x = seq_len(38) - 1, origin = c("zero", "one")) {
  origin <- rlang::arg_match(origin)
  levels <- tiles[["id"]] + if (origin == "one") 1 else 0 # nolint
  factor(x,
    levels = levels,
    labels = tiles[["cmajiang"]] # nolint
  )
}

#' Check if each element is a valid tile
#'
#' @param x A character vector to be checked.
#' @returns A logical vector.
#' @export
is_valid_tile <- function(x) {
  stringi::stri_detect_regex(x, "(^(?:[mps][0-9]|z[1-7])_?\\*?[\\+\\=\\-]?$)")
}

#' Line up tiles
#'
#' Arrange all tiles from a data frame.
#'
#' @param x A data frame with columns `id`, `tile`, and `n`.
#' @returns An object of `x$tile` class.
#' @export
#' @examples
#' rand_hands()(3) |>
#'   paistr() |>
#'   tidy() |>
#'   lineup()
lineup <- function(x) {
  if (!is.data.frame(x) || !all(c("id", "tile", "n") %in% colnames(x))) {
    rlang::abort("`x` must be a data frame with columns `id`, `tile`, and `n`.")
  }
  unname(tapply(x, x[["id"]], function(d) {
    rep(d[["tile"]], d[["n"]])
  }))
}

#' Compose hands from character vectors
#'
#' Compose hands from character vectors
#' while ignoring invalid tiles.
#' This function can handle any number of tiles in each hand,
#' but cannot more than 5 identical tiles.
#' If there are more than 5 identical tiles, arises an error.
#'
#' @param x A list of character vectors or a character vector.
#' @returns A character vector.
#' @export
#' @examples
#' lipai(list(c("m1", "m2", "m3"), c("p1", "p2", "p3")))
lipai <- function(x) {
  if (!is.list(x)) {
    x <- x[!is.na(x)]
    lipai(list(x))
  } else {
    l <- unlist(x, use.names = FALSE) |>
      as.character() |>
      stringi::stri_replace_na("") |>
      vctrs::vec_chop(sizes = vctrs::list_sizes(x))
    skksph_lipai_impl(l)
  }
}

#' Parse chains of hupai ids
#'
#' Parse comma separated chains of hupai ids
#' into a list of factors.
#'
#' @param str A character vector.
#' @param lang A string scalar. Either "en" or "jp".
#' @returns A list of factors.
#' @export
parse_hupai <- function(str, lang = c("en", "jp")) {
  lang <- rlang::arg_match(lang)
  sp <- stringi::stri_split_fixed(str, ",")
  factor(
    unlist(sp, use.names = FALSE),
    levels = hupai[["id"]], # nolint
    labels = hupai[[lang]] # nolint
  ) |>
    vctrs::vec_chop(sizes = vctrs::list_sizes(sp))
}

#' Translate tiles from one format to another
#'
#' @param x A vector of tiles to be translated.
#' @param from A string scalar. Either "mjai", "tenhou_int", "id", or "cmajiang".
#' @param to A string scalar. Either "cmajiang", "mjai", "tenhou_int", or "id".
#' @returns
#' * For `to = "cmajiang"` and `to = "mjai"`: A character vector.
#' * For `to = "tenhou_int"`: An integer vector.
#' @export
#' @examples
#' trans_tile(c("m0", "p1", "z1", "_"), from = "cmajiang", to = "mjai")
#' trans_tile(c("5mr", "1p", "E", "?"), from = "mjai", to = "cmajiang")
#' trans_tile(c(51, 21, 41, 0), from = "tenhou_int", to = "mjai")
trans_tile <- function(x,
                       from = c("mjai", "tenhou_int", "id", "cmajiang"),
                       to = c("cmajiang", "mjai", "tenhou_int", "id")) {
  from <- rlang::arg_match(from)
  to <- rlang::arg_match(to)
  mapping <- rlang::set_names(tiles[[to]], as.character(tiles[[from]])) # nolint
  unname(mapping[as.character(x)])
}
