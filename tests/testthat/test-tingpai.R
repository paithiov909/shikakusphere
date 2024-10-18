test_that("get_tingpai works", {
  tingpai <- \(paistr) unlist(get_tingpai(paistr), use.names = FALSE)

  # 打牌可能な状態のとき、エラー
  expect_error(get_tingpai("m123p456s789z12345"))
  expect_error(get_tingpai("m123p456z12345,s789-,"))

  # 副露なし
  expect_equal(
    tingpai("m123p456s789z1234"),
    c("z1", "z2", "z3", "z4")
  )
  # 副露あり
  expect_equal(
    tingpai("m123p456z1234,s789-"),
    c("z1", "z2", "z3", "z4")
  )
  # 国士無双13面待ち
  expect_equal(
    tingpai("m19p19s19z1234567"),
    c("m1", "m9", "p1", "p9", "s1", "s9", "z1", "z2", "z3", "z4", "z5", "z6", "z7")
  )
  # 打牌可能な手牌に4枚ある牌は待ち牌としない
  expect_equal(
    tingpai("m1234444p456s789"),
    "m1"
  )
  # 暗刻の牌は待ち牌にできる
  expect_equal(
    tingpai("m13p456s789z11,m2222"),
    "m2"
  )
  # 七対子と面子手で同じ向聴数
  expect_equal(
    tingpai("m11155p2278s66z17"),
    c("m5", "p2", "p6", "p7", "p8", "p9", "s6", "z1", "z7")
  )
})
