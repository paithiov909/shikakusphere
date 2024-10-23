test_that("calc_defen fails", {
  expect_error(calc_defen("m123p456s789z11122", baopai = "z0"))
  expect_error(calc_defen("m123p456s789z11122", baopai = "z1", libaopai = "z0"))
  expect_error(calc_defen("m123p456s789z1112", baopai = "z1", rongpai = "z2"))
})

# TODO: more tests
