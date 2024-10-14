#' Calculate score of hand
#'
#' @param pai String.
#' Note that this param is not vectorized.
#' @param baopai Character vector. "Dora" indicators.
#' @param libaopai Character vector. "Ura-dora" indicators.
#' @param rongpai String. Leave empty if there is no rongpai.
#' @param rule List; a rule set.
#' @param zhuangfeng Integer (0-3); "ba-kaze" pai.
#' @param menfeng Integer (0-3); "ji-kaze" pai.
#' @param lizhi Integer (0-2);
#' 0: no lizhi, 1: lizhi, 2: double-lizhi.
#' @param yifa Logical; flag for "ippatsu".
#' @param qianggang Logical; flag for "chankan".
#' @param lingshang Logical; flag for "rinshan-kaihou".
#' @param haidi Integer (0-2);
#' 0: normal, 1: haidimoyue, 2: hedilaoyu.
#' @param tianhu Integer (0-2);
#' 0: normal, 1: tianhu, 2: dihe.
#' @param changbang Integer;
#' Number of counter sticks that indicates "honba".
#' @param lizhibang Integer;
#' Number of 1,000-point sticks on the table.
#' @returns Dataframe.
#' @export
calc_defen <- function(
  pai, # not vectorized!
  baopai,
  libaopai,
  rongpai = "",
  rule = default_rule(),
  zhuangfeng = 0L,
  menfeng = 1L,
  lizhi = 0L,
  yifa = FALSE,
  qianggang = FALSE,
  lingshang = FALSE,
  haidi = 0L,
  tianhu = 0L,
  changbang = 0L,
  lizhibang = 0L
) {
  rongpai[is.na(rongpai)] <- ""
  get_defen(
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
    tianhu,
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
  get_xiangting(pai)
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
  get_tingpai(pai)
}
