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
})

test_that("calculate for paistr works", {
  pai <- paistr("p0222345z234567")
  expect_snapshot_value(calculate(pai), style = "json2", cran = FALSE)
})

test_that("tidy for paistr works", {
  pai <- paistr("p0222345z234567")
  expect_snapshot_value(tidy(pai), style = "json2", cran = FALSE)
})
