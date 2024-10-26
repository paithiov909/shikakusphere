test_that("calc_xiangting works", {
  # テンパイ
  expect_equal(calc_xiangting("m123p406s789z1122"), 0L)
  # 和了
  expect_equal(calc_xiangting("m123p456s789z11222"), -1L)
  # 雀頭なし
  expect_equal(calc_xiangting("m12389p456s12789z1"), 1L)
  # 搭子過多
  expect_equal(calc_xiangting("m12389p456s1289z11"), 1L)
  # 搭子不足
  expect_equal(calc_xiangting("m133345568z23677"), 2L)
  # 少牌: 雀頭なし4面子
  expect_equal(calc_xiangting("p234s567,m222=,p0-67"), 1L)
  # 刻子＋順子
  expect_equal(calc_xiangting("p222345z1234567"), 4L)
  # 順子＋孤立牌＋順子
  expect_equal(calc_xiangting("p2344456z123456"), 4L)
  # 対子＋刻子＋順子
  expect_equal(calc_xiangting("p11222345z12345"), 3L)
  # 対子＋順子＋順子＋対子
  expect_equal(calc_xiangting("p2234556788z123"), 2L)
  # 副露直後の牌姿が和了形
  expect_equal(calc_xiangting("m11122,p123-,s12-3,z111=,"), 0L)
  # 赤牌（紅牌, hongpai）あり
  expect_equal(calc_xiangting("m055z7z7,m78-9,z5555,z666="), -1L)
})

# https://github.com/paithiov909/shikakusphere/issues/1
test_that("calc_xiangting works in additional cases", {
  # p1111234444s999s9
  expect_equal(calc_xiangting("p1111234444s999s9"), 1L)
  expect_equal(calc_xiangting("p1111234444s999"), 1L)
  # z1111222233344z4
  expect_equal(calc_xiangting("z1111222233344z4"), 1L)
  # s123456789z1111
  expect_equal(calc_xiangting("s123456789z1111"), 1L)
  expect_equal(calc_xiangting("s123456789z1111z4"), 0L)
})
