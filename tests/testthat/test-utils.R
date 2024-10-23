test_that("lineup works", {
  pai <- paistr("p0222345z234567")
  expect_snapshot_value(lineup(tidy(pai)), style = "json2", cran = FALSE)
  expect_error(lineup(data.frame(id = 1, n = 1)))
})

test_that("lipai works", {
  pai <- c("m0", "m1", "m9", "p0", "p1", "p9", "s0", "s1", "s9", "z1", "z2", "z6", "z7")
  expect_equal(lipai(pai), "m109p109s109z1267")
  expect_equal(lipai(c(pai, NA, "")), "m109p109s109z1267")
  expect_equal(lipai(list(pai, NA, NULL)), c("m109p109s109z1267", "", ""))
})
