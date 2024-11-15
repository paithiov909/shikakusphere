#' Proceed state of hands
#'
#' @param qipai A list of character vectors
#' where each element represents a player's qipai.
#' @param zimo A list of character vectors
#' where each element represents a players's zimo.
#' @param dapai A list of character vectors
#' where each element represents a players's dapai.
#' @returns A `paistr` vector.
#' @export
#' @examples
#' if (requireNamespace("dplyr", quietly = TRUE)) {
#'   qipai <-
#'     paistr("m123456789p1s1z11") |>
#'     tidy() |>
#'     dplyr::mutate(tile = as.character(tile)) |>
#'     lineup()
#'   zimo <- list(c("p2", "p3"))
#'   dapai <- list(c("z1", "z1"))
#'   proceed(qipai, zimo, dapai)
#' }
proceed <- function(qipai, zimo, dapai) {
  if (vctrs::list_sizes(qipai) != 13) {
    rlang::abort("qipai must have 13 elements.")
  }
  if (any(!(vctrs::list_sizes(zimo) - vctrs::list_sizes(dapai) %in% c(0, 1)))) {
    rlang::abort("zimo length must be dapai length plus 0 or 1.")
  }
  paistr(skksph_proceed_impl(qipai, zimo, dapai))
}
