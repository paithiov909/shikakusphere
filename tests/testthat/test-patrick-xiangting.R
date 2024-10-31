skip_if(TRUE, "Skipping parameterized tests for xiangting.")
skip_on_cran()
skip_on_ci()

patrick::with_parameters_test_that("calc_xiangting works",
  {
    expect_equal(calc_xiangting(q)[["num"]], n)
  },
  .cases = withr::with_seed(1234, {
    # 1: 一般手, 2: 混一手, 3: 清一手, 4: 国士手
    testdat_xiangting |>
      # dplyr::filter(type %in% c(1, 2, 3, 4)) |>
      dplyr::slice_sample(n = 1000)
  })
)
