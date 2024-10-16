test_that("rand_hands works", {
  expect_type(
    rand_hands("fanpai")(1),
    "character"
  )
})
