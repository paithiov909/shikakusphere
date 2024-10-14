## usethis namespace: start
#' @useDynLib shikakusphere, .registration = TRUE
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
hand2img <- function(pai, width = NULL, height = NULL) {
  img <-
    to_svg_string(pai) |>
    magick::image_read_svg(width = width, height = height)
  plot(as.raster(img))
  invisible(img)
}
