## usethis namespace: start
#' @importFrom Rcpp sourceCpp
#' @importFrom tibble tibble
#' @importFrom methods setOldClass
#' @importFrom utils globalVariables
#' @useDynLib shikakusphere, .registration = TRUE
#' @keywords internal
## usethis namespace: end
"_PACKAGE"

utils::globalVariables("hupai")

#' Check if the pai is a valid tile
#'
#' @param x A character vector to be checked.
#' @returns A logical vector.
#' @keywords internal
is_valid_pai <- function(x) {
  stringi::stri_detect_regex(x, "(^(?:[mps]\\d|z[1-7])_?\\*?[\\+\\=\\-]?$)")
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
    labels = hupai[[lang]]  # nolint
  ) |>
    vctrs::vec_chop(sizes = vctrs::list_sizes(sp))
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
