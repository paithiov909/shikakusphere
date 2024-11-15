#' Calculate xiangting number of hands
#'
#' @param pai A character vector.
#' @returns A tibble.
#' @export
#' @examples
#' calc_xiangting(c("m345567p234s3378", "p222345z1234567"))
calc_xiangting <- function(pai) {
  ret <- skksph_get_xiangting(pai, index_s, index_h) # nolint
  tibble::tibble(
    num = ret[["num"]] - 1L,
    mode = factor(ret[["mode"]],
      levels = seq_len(7),
      labels = c("yiban", "qidui", "yiban-qidui", "guoshi", "yiban-guoshi", "qidui-guoshi", "yiban-qidui-guoshi")
    )
  )
}
