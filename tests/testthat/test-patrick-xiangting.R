# skip_if(TRUE)
skip_on_cran()
skip_on_ci()

patrick::with_parameters_test_that("calc_xiangting works",
  {
    expect_equal(calc_xiangting(q), n)
  },
  .cases = test_xiangting
)
