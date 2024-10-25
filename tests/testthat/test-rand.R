test_that("rand_hands works", {
  availables <- c(
    "pinghe",
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
  )
  expect_length(
    unlist(lapply(availables, function(x) {
      rand_hands(hupai = x)(1)
    }), use.names = FALSE),
    length(availables)
  )
  expect_equal(
    length(unique(rand_hands()(50))),
    50
  )
})
