test_that("lipai works", {
  pai <- c("m0", "m1", "m9", "p0", "p1", "p9", "s0", "s1", "s9", "z1", "z2", "z6", "z7")
  expect_equal(lipai(pai), "m109p109s109z1267")
  expect_equal(lipai(c(pai, NA, "")), "m109p109s109z1267")
  expect_equal(lipai(list(pai, NA, NULL)), c("m109p109s109z1267", "", ""))
})

test_that("paistr warns when input is invalid", {
  expect_warning(paistr(""))
  expect_warning(paistr(NA))
  expect_warning(paistr(c("123", "z1")))
})

test_that("paistr works", {
  pai <- paistr("p0222345z234567")
  expect_s3_class(pai, "skksph_paistr")
  expect_equal(is_paistr(pai), TRUE)
  expect_equal(is_paistr("p0222345z234567"), FALSE)
  expect_snapshot_value(tidy(pai), style = "json2", cran = FALSE)
})
