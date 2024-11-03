.onUnload <- function(libpath) {
  library.dynam.unload("shikakusphere", libpath)
}

# NOTE: This snippet is copied from ropensci/parzer.
# See https://github.com/ropensci/parzer/issues/31
# -----
# Because of a std::regex's bug, all Rcpp functions hangs on Windows with MBCS
# locale (#31). As a workaround for this, we can wrap the functions with
# `withr::with_locale()` and force C locale temporarily. To ensure all the Rcpp
# functions are wrapped with this, override `.Call()` inside the package.
.Call <- function(...) { # nolint
  if (identical(tolower(Sys.info()[["sysname"]]), "windows")) {
    withr::with_locale(c("LC_COLLATE" = "C"), {
      base::.Call(...)
    })
  } else {
    base::.Call(...)
  }
}
