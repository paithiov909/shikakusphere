#' Calculate score of hand
#'
#' @param pai A string scalar. This param is not vectorized.
#' @param baopai A character vector. "Dora" indicators.
#' @param libaopai A character vector. "Ura-dora" indicators.
#' Leave empty if there is no libaopai.
#' @param rongpai A string scalar such as `"m1="`.
#' Leave empty if there is no rongpai.
#' @param rule A list; a rule set. Defaults to \code{default_rule()}.
#' @param zhuangfeng A string scalar; "ba-kaze" tile.
#' @param menfeng A string scalar; "ji-kaze" tile.
#' @param lizhi A string scalar. Either "none", "lizhi", or "double-lizhi".
#' @param yifa A logical scalar; flag for "ippatsu".
#' @param qianggang A logical scalar; flag for "chankan".
#' @param lingshang A logical scalar; flag for "rinshan-kaihou".
#' @param haidi A string scalar. Either "none", "haidimoyue", or "hedilaoyu".
#' @param tianhe A string scalar; Either "none", "tianhe", or "dihe".
#' @param changbang An integer scalar;
#' the number of counter sticks that indicates "honba".
#' @param lizhibang An integer scalar;
#' the number of 1,000-point sticks on the table.
#' @returns A data frame.
#' @export
#' @examples
#' calc_defen("m345567p234s3378", baopai = "z1", rongpai = "s9=")
calc_defen <- function(
  pai,
  baopai,
  libaopai = "",
  rongpai = "",
  rule = default_rule(),
  zhuangfeng = c("z1", "z2", "z3", "z4"),
  menfeng = c("z2", "z3", "z4", "z1"),
  lizhi = c("none", "lizhi", "double-lizhi"),
  yifa = FALSE,
  qianggang = FALSE,
  lingshang = FALSE,
  haidi = c("none", "haidimoyue", "hedilaoyu"),
  tianhe = c("none", "tianhe", "dihe"),
  changbang = 0L,
  lizhibang = 0L
) {
  rongpai <- rongpai[1]
  libaopai[is.na(libaopai)] <- ""
  rongpai[is.na(rongpai)] <- ""

  if (any(!is_valid_pai(baopai))) {
    rlang::abort("baopai contains invalid tiles.")
  }
  if (all(!stringi::stri_isempty(libaopai)) && any(!is_valid_pai(libaopai))) {
    rlang::abort("libaopai contains invalid tiles.")
  }
  if (all(!stringi::stri_isempty(rongpai)) &&
      (!is_valid_pai(rongpai) && !stringi::stri_detect_regex(rongpai, "\\=$"))) { #nolint
    rlang::abort("rongpai is invalid.")
  }
  zhuangfeng <- rlang::arg_match(zhuangfeng)
  menfeng <- rlang::arg_match(menfeng)
  lizhi <- rlang::arg_match(lizhi)
  haidi <- rlang::arg_match(haidi)
  tianhe <- rlang::arg_match(tianhe)

  zhuangfeng <-
    switch(zhuangfeng,
      "z1" = 0L,
      "z2" = 1L,
      "z3" = 2L,
      "z4" = 3L
    )
  menfeng <-
    switch(menfeng,
      "z2" = 1L,
      "z3" = 2L,
      "z4" = 3L,
      "z1" = 0L
    )
  lizhi <-
    switch(lizhi,
      "none" = 0L,
      "lizhi" = 1L,
      "double-lizhi" = 2L
    )
  haidi <-
    switch(haidi,
      "none" = 0L,
      "haidimoyue" = 1L,
      "hedilaoyu" = 2L
    )
  tianhe <-
    switch(tianhe,
      "none" = 0L,
      "tianhe" = 1L,
      "dihe" = 2L
    )

  skksph_get_defen(
    paistr(pai),
    baopai,
    libaopai,
    rule,
    rule[["rankPoints"]],
    rule[["hongpai"]],
    rongpai,
    zhuangfeng,
    menfeng,
    lizhi,
    yifa,
    qianggang,
    lingshang,
    haidi,
    tianhe, # `tianhu` in C++ side
    changbang,
    lizhibang
  )
}

#' Calculate xiangting number of hands
#'
#' @param pai A character vector.
#' @returns An integer vector.
#' @export
#' @examples
#' calc_xiangting(c("m345567p234s3378", "p222345z1234567"))
calc_xiangting <- function(pai) {
  skksph_get_xiangting(pai)
}

#' Collect tingpais for hands
#'
#' Collect tiles that can decrease the xiangting number of hands
#' if they are drawn.
#' In case of already winning hands, corresponding vectors will be `NA`.
#'
#' @param pai A character vector.
#' @returns A list of character vectors.
#' @export
#' @examples
#' collect_tingpai(c("m345567p234s3378", "p222345z1234567"))
collect_tingpai <- function(pai) {
  n_xiangting <- skksph_get_xiangting(pai)
  pai[n_xiangting < 0] <- ""
  ret <- skksph_get_tingpai(pai)
  ret[n_xiangting < 0] <- NA_character_
  ret
}
