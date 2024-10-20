#' Internal function to create a `skksph_paistr`
#'
#' The user-facing wrapper of this function is `paistr()`.
#'
#' @name skksph-paistr
#' @param x Character vector.
#' @returns An object of class `skksph_paistr`.
#' @import vctrs
#' @keywords internal
new_paistr <- function(x = character()) {
  if (!is.character(x)) {
    rlang::abort("`x` must be a character vector.")
  }
  new_vctr(x, class = "skksph_paistr")
}

# for compatibility with the S4 system
#' @importFrom methods setOldClass
methods::setOldClass(c("skksph_paistr", "vctrs_vctr"))

#' `paistr` vector
#'
#' Create a `paistr` vector from a character vector
#' that represents player's hands.
#'
#' @details
#' Note that the validation of this function is not so strict.
#' For example, `paistr("z0")` still produces a valid `paistr` vector
#' even though "z0" is not an existing tile.
#'
#' Those `paistr` are simply ignored in wrappers for 'cmajiang' functions,
#' so they are not harmful.
#'
#' @param x
#' * For `paistr()`: Character vector.
#' * For `is_paistr()`: An object to test.
#' * For `tidy()`: An object to tidy up.
#' @param ... Other arguments for `tidy()`.
#' @returns
#' * For `paistr()`: An object of class `skksph_paistr`.
#' * For `is_paistr()`: A logical vector.
#' * For `tidy()`: A data frame.
#' @export
#' @examples
#' pai <- paistr(c("m055z7z7,m78-9,z5555,z666=", "m123s789z1117*,p5550"))
#' print(pai)
#' is_paistr(pai)
#' tidy(pai)
paistr <- function(x = character()) {
  x <- vec_cast(x, character()) |>
    stringi::stri_replace_na("")
  check <-
    stringi::stri_detect_regex(x, "[mpsz]", negate = TRUE)
  if (any(check)) {
    rlang::warn(
      sprintf(
        "`%s` never contains any suits. Replacing with empty string.",
        paste(x[check], collapse = ", ")
      )
    )
    x[check] <- ""
  }
  new_paistr(x)
}

#' @rdname paistr
#' @export
is_paistr <- function(x) {
  inherits(x, "skksph_paistr")
}

#' @export
format.skksph_paistr <- function(x, ...) {
  dat <- vec_data(x)
  out <- paste0("<", stringi::stri_count_regex(dat, "[0-9_]"), ">\'", dat, "\'")
  out
}

#' @importFrom generics tidy
#' @export
generics::tidy

#' @rdname paistr
#' @export
tidy.skksph_paistr <- function(x, ...) {
  n_tiles <- vec_data(x) |>
    skksph_tidy_impl()
  df <-
    data.frame(
      id = rep(seq_along(n_tiles), each = 38),
      tile = rep(seq_len(38) - 1, length(n_tiles)),
      n = unlist(n_tiles, use.names = FALSE)
    )

  df <- vec_slice(df, df[["tile"]] != 30) # ignoring "z0"
  df[["tile"]] <-
    factor(
      df[["tile"]],
      levels = c(
        1, 2, 3, 4, 5, 6, 7, 8, 9, 10,
        11, 12, 13, 14, 15, 16, 17, 18, 19, 20,
        21, 22, 23, 24, 25, 26, 27, 28, 29, 30,
        32, 33, 34, 35, 36, 37, 38
      ) - 1,
      labels = c(
        paste0("m", 0:9),
        paste0("p", 0:9),
        paste0("s", 0:9),
        paste0("z", 1:7)
      )
    )
  vec_slice(df, which(df[["n"]] > 0))
}

#' @export
vec_ptype_abbr.skksph_paistr <- function(x, ...) {
  "paistr"
}

#' @export
vec_ptype2.skksph_paistr.skksph_paistr <- function(x, y, ...) new_paistr()

#' @export
vec_ptype2.character.skksph_paistr <- function(x, y, ...) character()

#' @export
vec_cast.skksph_paistr.skksph_paistr <- function(x, to, ...) x

#' @export
vec_cast.skksph_paistr.character <- function(x, to, ...) paistr(x)

#' @export
vec_cast.character.skksph_paistr <- function(x, to, ...) vec_data(x)
