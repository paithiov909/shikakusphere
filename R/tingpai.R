#' Collect tingpais for hands
#'
#' Collect tiles that can decrease the xiangting number of hands
#' if they are drawn.
#' In case there are no tingpais for the hand, the function warns about it
#' and returns an empty character vector.
#'
#' @param pai A character vector.
#' @returns A list of character vectors.
#' @export
#' @examples
#' collect_tingpai(c("m345567p234s3378", "p222345z1234567"))
collect_tingpai <- function(pai) {
  skksph_get_tingpai(pai, index_s, index_h) # nolint
}
