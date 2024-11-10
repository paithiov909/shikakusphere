#' Check if each element is a valid tile
#'
#' @param x A character vector to be checked.
#' @returns A logical vector.
#' @export
is_valid_tile <- function(x) {
  stringi::stri_detect_regex(x, "(^(?:[mps]\\d|z[1-7])_?\\*?[\\+\\=\\-]?$)")
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

#' Detect the suit or rank of tiles
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
  stringi::stri_detect_regex(x, "[\\-\\=\\+]")
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
  ret <- ret & switch(suzhi,
    "23" = tile2rank(x) %in% c("1", "4"),
    "34" = tile2rank(x) %in% c("2", "5", "0"),
    "45" = tile2rank(x) %in% c("3", "6"),
    "56" = tile2rank(x) %in% c("4", "7"),
    "67" = tile2rank(x) %in% c("5", "8", "0"),
    "78" = tile2rank(x) %in% c("6", "9")
  )
  ret
}
