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
#' rand_hands()(5) |>
#'  paistr() |>
#'  tidy() |>
#'  lineup()
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
#' however, cannot handle 5th pai of each tiles.
#' If there are any 5th pais, arises an error.
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

#' Plot a player's hand as an image
#'
#' @param pai String that represents a player's hand.
#' @param width Integer scalar.
#' @param height Integer scalar.
#' @returns A bitmap image that internally converted by `magick::image_read_svg`
#' is invisibly returned.
#' @export
#' @importFrom grDevices as.raster
hand2img <- function(pai, width = NULL, height = NULL) {
  if (!rlang::is_installed("rsvg")) {
    rlang::abort("Please install `rsvg` to use this function.")
  }
  img <-
    skksph_shoupai_to_svg(pai) |>
    magick::image_read_svg(width = width, height = height)
  plot(as.raster(img))
  invisible(img)
}
