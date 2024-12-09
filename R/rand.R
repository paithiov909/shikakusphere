#' Generate hands at random
#'
#' @param nrow An integer scalar.
#' @param rule A list; a rule set. Defaults to `default_rule()`.
#' @param seed An integer scalar.
#' Used for initializing the random number generator.
#' @returns A tibble that consists of 4 columns of `paistr` vector.
#' @export
#' @examples
#' rand_qipai(3)
rand_qipai <- function(nrow, rule = default_rule(), seed = sample.int(1e4, 1)) {
  if (!is_valid_rule(rule)) {
    rlang::abort("The rule set is invalid.")
  }
  qipai <-
    skksph_rand_qipai_impl(nrow, seed, rule, rule[["rankPoints"]], rule[["hongpai"]]) |>
    purrr::list_transpose()
  tibble::tibble(
    l1 = paistr(qipai[[1]]),
    l2 = paistr(qipai[[2]]),
    l3 = paistr(qipai[[3]]),
    l4 = paistr(qipai[[4]])
  )
}

#' Create a function to randomly generate hands
#'
#' @param hupai A string scalar.
#' @param zhuangfeng A string scalar; "ba-kaze" tile.
#' @param menfeng A string scalar; "ji-kaze" tile.
#' @param rule A list; a rule set. Defaults to `default_rule()`.
#' @param seed An integer scalar.
#' Used for initializing the random number generator.
#' @returns
#' A function inheriting class `purrr_function_compose`
#' that takes single arguments `n`: number of hands to be generated.
#' @export
#' @importFrom purrr partial
#' @examples
#' rand_hands()(3)
rand_hands <- function(
    hupai = c(
      "pinghe", # defaults to pinghe
      "zhuangfeng",
      "menfeng",
      "fanpai",
      "duanyaojiu",
      "yibeikou",
      "sansetongshun",
      "yiqitongguan",
      "hunquandaiyaojiu",
      "qiduizi",
      "duiduihu",
      "sananke",
      "sangangzi",
      "sansetongke",
      "hunlaotou",
      "xiaosanyuan",
      "hunyise",
      "chunquandaiyaojiu",
      "erbeikou",
      "qingyise",
      "guoshiwushuang",
      "sianke",
      "dasanyuan",
      "xiaosixi",
      "dasixi",
      "ziyise",
      "lvyise",
      "qinglaotou",
      "sigangzi",
      "jiulianbaodeng"
    ),
    zhuangfeng = c("z1", "z2", "z3", "z4"),
    menfeng = c("z2", "z3", "z4", "z1"),
    rule = default_rule(),
    seed = sample.int(1e4, 1)) {
  if (!is_valid_rule(rule)) {
    rlang::abort("The rule set is invalid.")
  }
  hupai <- rlang::arg_match(hupai)
  zhuangfeng <- rlang::arg_match(zhuangfeng)
  menfeng <- rlang::arg_match(menfeng)

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

  # nolint start
  func <-
    switch(hupai,
      "zhuangfeng" = partial(
        random_zhuangfeng,
        zhuangfeng = zhuangfeng,
        seed = seed,
        list = rule,
        rankPoints = rule[["rankPoints"]],
        hongpai = rule[["hongpai"]]
      ),
      "menfeng" = partial(
        random_menfeng,
        menfeng = menfeng,
        seed = seed,
        list = rule,
        rankPoints = rule[["rankPoints"]],
        hongpai = rule[["hongpai"]]
      ),
      "fanpai" = partial(
        random_fanpai,
        seed = seed,
        list = rule,
        rankPoints = rule[["rankPoints"]],
        hongpai = rule[["hongpai"]]
      ),
      "pinghe" = partial(
        random_pinghe,
        zhuangfeng = zhuangfeng,
        menfeng = menfeng,
        seed = seed,
        list = rule,
        rankPoints = rule[["rankPoints"]],
        hongpai = rule[["hongpai"]]
      ),
      "duanyaojiu" = partial(
        random_duanyaojiu,
        seed = seed,
        list = rule,
        rankPoints = rule[["rankPoints"]],
        hongpai = rule[["hongpai"]]
      ),
      "yibeikou" = partial(
        random_yibeikou,
        seed = seed,
        list = rule,
        rankPoints = rule[["rankPoints"]],
        hongpai = rule[["hongpai"]]
      ),
      "sansetongshun" = partial(
        random_sansetongshun,
        seed = seed,
        list = rule,
        rankPoints = rule[["rankPoints"]],
        hongpai = rule[["hongpai"]]
      ),
      "yiqitongguan" = partial(
        random_yiqitongguan,
        seed = seed,
        list = rule,
        rankPoints = rule[["rankPoints"]],
        hongpai = rule[["hongpai"]]
      ),
      "hunquandaiyaojiu" = partial(
        random_hunquandaiyaojiu,
        seed = seed,
        list = rule,
        rankPoints = rule[["rankPoints"]],
        hongpai = rule[["hongpai"]]
      ),
      "qiduizi" = partial(
        random_qiduizi,
        seed = seed,
        list = rule,
        rankPoints = rule[["rankPoints"]],
        hongpai = rule[["hongpai"]]
      ),
      "duiduihu" = partial(
        random_duiduihu,
        seed = seed,
        list = rule,
        rankPoints = rule[["rankPoints"]],
        hongpai = rule[["hongpai"]]
      ),
      "sananke" = partial(
        random_sananke,
        seed = seed,
        list = rule,
        rankPoints = rule[["rankPoints"]],
        hongpai = rule[["hongpai"]]
      ),
      "sangangzi" = partial(
        random_sangangzi,
        seed = seed,
        list = rule,
        rankPoints = rule[["rankPoints"]],
        hongpai = rule[["hongpai"]]
      ),
      "sansetongke" = partial(
        random_sansetongke,
        seed = seed,
        list = rule,
        rankPoints = rule[["rankPoints"]],
        hongpai = rule[["hongpai"]]
      ),
      "hunlaotou" = partial(
        random_hunlaotou,
        seed = seed,
        list = rule,
        rankPoints = rule[["rankPoints"]],
        hongpai = rule[["hongpai"]]
      ),
      "xiaosanyuan" = partial(
        random_xiaosanyuan,
        seed = seed,
        list = rule,
        rankPoints = rule[["rankPoints"]],
        hongpai = rule[["hongpai"]]
      ),
      "hunyise" = partial(
        random_hunyise,
        seed = seed,
        list = rule,
        rankPoints = rule[["rankPoints"]],
        hongpai = rule[["hongpai"]]
      ),
      "chunquandaiyaojiu" = partial(
        random_chunquandaiyaojiu,
        seed = seed,
        list = rule,
        rankPoints = rule[["rankPoints"]],
        hongpai = rule[["hongpai"]]
      ),
      "erbeikou" = partial(
        random_erbeikou,
        seed = seed,
        list = rule,
        rankPoints = rule[["rankPoints"]],
        hongpai = rule[["hongpai"]]
      ),
      "qingyise" = partial(
        random_qingyise,
        seed = seed,
        list = rule,
        rankPoints = rule[["rankPoints"]],
        hongpai = rule[["hongpai"]]
      ),
      "guoshiwushuang" = partial(
        random_guoshiwushuang,
        seed = seed,
        list = rule,
        rankPoints = rule[["rankPoints"]],
        hongpai = rule[["hongpai"]]
      ),
      "sianke" = partial(
        random_sianke,
        seed = seed,
        list = rule,
        rankPoints = rule[["rankPoints"]],
        hongpai = rule[["hongpai"]]
      ),
      "dasanyuan" = partial(
        random_dasanyuan,
        seed = seed,
        list = rule,
        rankPoints = rule[["rankPoints"]],
        hongpai = rule[["hongpai"]]
      ),
      "xiaosixi" = partial(
        random_xiaosixi,
        seed = seed,
        list = rule,
        rankPoints = rule[["rankPoints"]],
        hongpai = rule[["hongpai"]]
      ),
      "dasixi" = partial(
        random_dasixi,
        seed = seed,
        list = rule,
        rankPoints = rule[["rankPoints"]],
        hongpai = rule[["hongpai"]]
      ),
      "ziyise" = partial(
        random_ziyise,
        seed = seed,
        list = rule,
        rankPoints = rule[["rankPoints"]],
        hongpai = rule[["hongpai"]]
      ),
      "lvyise" = partial(
        random_lvyise,
        seed = seed,
        list = rule,
        rankPoints = rule[["rankPoints"]],
        hongpai = rule[["hongpai"]]
      ),
      "qinglaotou" = partial(
        random_qinglaotou,
        seed = seed,
        list = rule,
        rankPoints = rule[["rankPoints"]],
        hongpai = rule[["hongpai"]]
      ),
      "sigangzi" = partial(
        random_sigangzi,
        seed = seed,
        list = rule,
        rankPoints = rule[["rankPoints"]],
        hongpai = rule[["hongpai"]]
      ),
      "jiulianbaodeng" = partial(
        random_jiulianbaodeng,
        seed = seed,
        list = rule,
        rankPoints = rule[["rankPoints"]],
        hongpai = rule[["hongpai"]]
      )
    )
  # nolint end
  purrr::compose(paistr, func)
}
