#' Internal function to create a `skksph_paistr` vector
#'
#' The user-facing wrapper of this function is `paistr()`.
#'
#' @name skksph-paistr
#' @param x A character vector.
#' @returns An object of class `skksph_paistr`.
#' @import vctrs
#' @keywords internal
new_paistr <- function(x = character()) {
  if (!is.character(x)) {
    rlang::abort("`x` must be a character vector.")
  }
  x |>
    stringi::stri_replace_all_regex("[^mpsz_,\\*\\+\\=\\-\\d]", "") |>
    vctrs::new_vctr(class = "skksph_paistr")
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
#' even though "z0" is not a tile that actually exists.
#' These `paistr` are simply ignored by the 'cmajiang' function wrapper.
#'
#' The number of tiles displayed when `print()` is not always accurate,
#' so if you need to count the actual number of tiles, use `tidy()`.
#'
#' @param x
#' * For `paistr()`: A character vector.
#' * For `is_paistr()`: An object to test.
#' * For `calculate()`: An object to summarize.
#' * For `plot()`: An object to plot as an image.
#' * For `tidy()`: An object to tidy up.
#' @param y
#' * For `plot()`: Not used.
#' @param ... Other arguments for `calculate()`, `plot()` or `tidy()`.
#' @returns
#' * For `paistr()`: An object of class `skksph_paistr`.
#' * For `is_paistr()`: A logical scalar.
#' * For `calculate()`: A tibble.
#' * For `plot()`: A bitmap image that internally converted
#' by `magick::image_read_svg()` is invisibly returned.
#' * For `tidy()`: A tibble.
#' @export
#' @examples
#' pai <- paistr(c("m055z7z7,m78-9,z5555,z666=", "m123s789z1117*,p5550"))
#' print(pai)
#' is_paistr(pai)
#' calculate(pai)
#' tidy(pai)
paistr <- function(x = character()) {
  x <- vctrs::vec_cast(x, character()) |>
    stringi::stri_replace_na("")
  check <-
    stringi::stri_detect_regex(x, "[mpsz]", negate = TRUE)
  if (any(check)) {
    rlang::warn(
      sprintf(
        "`%s` do not contains any suits. Replacing with empty string.",
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
  dat <- vctrs::vec_data(x)
  counts <- stringi::stri_count_regex(dat, "\\d")
  paste0("<", counts, ">\'", dat, "\'")
}

#' @importFrom generics calculate
#' @export
generics::calculate

#' @rdname paistr
#' @export
calculate.skksph_paistr <- function(x, ...) {
  dat <- vctrs::vec_data(x)
  bingpai <-
    skksph_bingpai_to_table(dat) |>
    unlist(use.names = FALSE) |>
    matrix(length(x), 34)
  tibble::tibble(
    id = seq_along(x),
    n_fulou = skksph_get_n_fulou(dat),
    bingpai
  )
}

#' @rdname paistr
#' @export
#' @importFrom grDevices as.raster
plot.skksph_paistr <- function(x, y, ...) {
  if (!rlang::is_installed("rsvg")) {
    rlang::abort("Please install `rsvg` to use this function.")
  }
  dots <- rlang::list2(...)
  img <-
    skksph_hand_to_svg(x) |>
    magick::image_read_svg(width = dots[["width"]], height = dots[["height"]])
  plot(as.raster(img), ...)
  invisible(img)
}

#' @importFrom generics tidy
#' @export
generics::tidy

#' @rdname paistr
#' @export
tidy.skksph_paistr <- function(x, ...) {
  n_tiles <- vctrs::vec_data(x) |>
    stringi::stri_replace_all_fixed(",", "") |> # treat any fulou as bingpai
    skksph_tidy_impl()
  df <-
    data.frame(
      id = rep(seq_along(n_tiles), each = 38),
      tile = rep(seq_len(38) - 1, length(n_tiles)),
      n = unlist(n_tiles, use.names = FALSE)
    ) |>
    rlang::as_function(~ {
      vctrs::vec_slice(., .[["tile"]] != 30) # ignoring "z0"
    })()

  df[["tile"]] <- int2tile(df[["tile"]], origin = "zero")
  tibble::as_tibble(vctrs::vec_slice(df, which(df[["n"]] > 0)))
}

#' @export
vec_ptype_abbr.skksph_paistr <- function(x, ...) "paistr"

#' @export
vec_ptype2.skksph_paistr.skksph_paistr <- function(x, y, ...) new_paistr()

#' @export
vec_ptype2.character.skksph_paistr <- function(x, y, ...) character()

#' @export
vec_cast.skksph_paistr.skksph_paistr <- function(x, to, ...) x

#' @export
vec_cast.skksph_paistr.character <- function(x, to, ...) paistr(x)

#' @export
vec_cast.character.skksph_paistr <- function(x, to, ...) vctrs::vec_data(x)
