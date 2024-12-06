#' Proceed state of hands
#'
#' @param qipai A list of character vectors
#' where each element represents a player's qipai.
#' @param zimo A list of character vectors
#' where each element represents a players's zimo.
#' @param dapai A list of character vectors
#' where each element represents a players's dapai.
#' @param accumulate Logical. If true, returns accumulated result.
#' @returns A (list of) `paistr` vector(s).
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
proceed <- function(qipai, zimo, dapai, accumulate = FALSE) {
  if (any(vctrs::list_sizes(qipai) != 13, rlang::is_empty(zimo), rlang::is_empty(dapai))) {
    rlang::abort("qipai must have 13 elements.")
  }
  hands <- skksph_proceed_impl(qipai, zimo, dapai, accumulate)
  if (!accumulate) {
    return(paistr(hands))
  } else {
    vctrs::vec_chop(
      paistr(hands),
      sizes = table(names(hands)) |> as.integer()
    )
  }
}
