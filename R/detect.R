#' Detect specific tiles
#'
#' @rdname detect
#' @name detect-tiles
#' @param x A character vector.
#' @param suit A string scalar. Either "m", "p", "s", or "z".
#' @param negate A logical scalar.
#' @param suzhi A string scalar. Either "23", "34", "45", "56", "67", or "78".
#' @returns
#' * For `tile2suit` and `tile2rank`: a character vector.
#' * For other functions: a logical vector.
NULL

#' @rdname detect
#' @export
tile2suit <- function(x) {
  stringi::stri_sub(x, 1, 1)
}

#' @rdname detect
#' @export
tile2rank <- function(x) {
  stringi::stri_sub(x, 2, 2)
}

#' @rdname detect
#' @export
is_fulou <- function(x) {
  stringi::stri_detect_regex(x, "(\\d(?=[\\-\\=\\+]))|\\d{4}")
}

#' @rdname detect
#' @export
is_tsumogiri <- function(x) {
  stringi::stri_detect_regex(x, ".+_")
}

#' @rdname detect
#' @export
is_lizhi <- function(x) {
  stringi::stri_detect_regex(x, ".+\\*")
}

#' @rdname detect
#' @export
is_suit <- function(x, suit = c("m", "p", "s", "z")) {
  suit <- rlang::arg_match(suit)
  stringi::stri_detect_fixed(x, suit)
}

#' @rdname detect
#' @export
is_yaojiu <- function(x, negate = FALSE) {
  ret <- (tile2rank(x) %in% c("1", "9")) | is_suit(x, "z")
  if (negate) {
    return(!ret)
  }
  ret
}

#' @rdname detect
#' @export
is_zhongzhang <- function(x) {
  is_yaojiu(x, negate = TRUE)
}

#' @rdname detect
#' @export
is_suzhi <- function(x, suzhi = c("23", "34", "45", "56", "67", "78")) {
  suzhi <- rlang::arg_match(suzhi)
  ret <- tile2suit(x) != "z" # 字牌はFALSE
  ret & switch(suzhi,
    "23" = tile2rank(x) %in% c("1", "4"),
    "34" = tile2rank(x) %in% c("2", "5", "0"),
    "45" = tile2rank(x) %in% c("3", "6"),
    "56" = tile2rank(x) %in% c("4", "7"),
    "67" = tile2rank(x) %in% c("5", "8", "0"),
    "78" = tile2rank(x) %in% c("6", "9")
  )
}
