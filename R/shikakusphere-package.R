## usethis namespace: start
#' @import Rcpp
#' @useDynLib shikakusphere, .registration = TRUE
#' @keywords internal
## usethis namespace: end
"_PACKAGE"

#' List of hupai
#'
#' @details
#' A dataframe that contains the list of hupai.
#'
#' The list includes the following columns:
#' * `id`: The id of the hupai.
#' * `en`: The English name of the hupai.
#' * `jp`: The Japanese name of the hupai.
"hupai"

#' @importFrom utils globalVariables
utils::globalVariables("hupai")

#' Line up tiles
#'
#' @param x A data frame with columns `id`, `tile`, and `n`.
#' @returns Character vector (or factor).
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
  unname(tapply(x, x$id, function(d) {
    rep(d$tile, d$n)
  }))
}

#' Compose hands from character vectors
#'
#' Compose hands from character vectors
#' while ignoring invalid pais.
#'
#' This function accepts less or more than 14 pais per hand,
#' however, cannot handle 5th+ pai of each tiles.
#' If there are any 5th+ pais, arises an error.
#'
#' @param x Character vector or a list of character vectors.
#' @returns Character vector.
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
#' @param str Character vector.
#' @param lang String.
#' @returns List of factors.
#' @export
parse_hupai <- function(str, lang = c("en", "jp")) {
  lang <- rlang::arg_match(lang)
  sp <- stringi::stri_split_fixed(str, ",")
  factor(
    unlist(sp, use.names = FALSE),
    levels = hupai[["id"]],
    labels = hupai[[lang]]
  ) |>
    vctrs::vec_chop(sizes = vctrs::list_sizes(sp))
}

#' Convert integers to tiles
#'
#' @param x Integer vector.
#' @param origin String. "zero" or "one".
#' @returns Factor.
#' @export
#' @examples
#' int2tile(c(0, 1, 25, 37))
int2tile <- function(x = seq_len(38) - 1, origin = c("zero", "one")) {
  origin <- rlang::arg_match(origin)
  levels <- c(
    0, 1, 2, 3, 4, 5, 6, 7, 8, 9,
    10, 11, 12, 13, 14, 15, 16, 17, 18, 19,
    20, 21, 22, 23, 24, 25, 26, 27, 28, 29,
    # 30, # "z0" is missing
    31, 32, 33, 34, 35, 36, 37
  ) + if (origin == "one") 1 else 0
  factor(x,
    levels = levels,
    labels = c(
      paste0("m", 0:9),
      paste0("p", 0:9),
      paste0("s", 0:9),
      paste0("z", 1:7)
    )
  )
}

#' Plot a player's hand as an image
#'
#' This function is a short hand for `plot(paistr(pai))`
#'
#' @param pai Character vector.
#' @param ... Passed to `plot()`.
#' @export
hand2img <- function(pai, ...) {
  paistr(pai) |>
    plot(...)
}
