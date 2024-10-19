#' Calculate score of hand
#'
#' @param pai String.
#' Note that this param is not vectorized.
#' @param baopai Character vector. "Dora" indicators.
#' @param libaopai Character vector. "Ura-dora" indicators.
#' Leave with single NA if there is no libaopai.
#' @param rongpai String.
#' Leave with single NA if there is no rongpai.
#' @param rule List; a rule set.
#' @param zhuangfeng String; "ba-kaze" pai.
#' @param menfeng String; "ji-kaze" pai.
#' @param lizhi String; One of "none", "lizhi", or "double-lizhi".
#' @param yifa Logical; flag for "ippatsu".
#' @param qianggang Logical; flag for "chankan".
#' @param lingshang Logical; flag for "rinshan-kaihou".
#' @param haidi String; One of "none", "haidimoyue", or "hedilaoyu".
#' @param tianhu String; One of "none", "tianhe", or "dihe".
#' @param changbang Integer;
#' Number of counter sticks that indicates "honba".
#' @param lizhibang Integer;
#' Number of 1,000-point sticks on the table.
#' @returns Dataframe.
#' @export
calc_defen <- function(
  pai, # not vectorized!
  baopai,
  libaopai = NA,
  rongpai = NA,
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

  libaopai[is.na(libaopai)] <- ""
  rongpai[is.na(rongpai)] <- ""

  skksph_get_defen(
    pai,
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
#' @param pai Character vector.
#' @returns Integer vector.
#' @export
calc_xiangting <- function(pai) {
  skksph_get_xiangting(pai)
}

#' Collect tingpais of hands
#'
#' Collect all pais that can decrease the xiangting number of hands
#' if they are drawn.
#'
#' @param pai Character vector.
#' @returns List of character vectors.
#' @export
collect_tingpai <- function(pai) {
  skksph_get_tingpai(pai)
}
