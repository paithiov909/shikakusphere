test_that("proceed works", {
  hands <- c(
    "m11p234s555z11122",
    "p1122334455667"
  ) |>
    paistr() |>
    tidy() |>
    dplyr::mutate(tile = as.character(tile)) |>
    lineup()

  expect_true(
    proceed(hands, list(c("z2", "z2"), c("z2", "z2")), list(c("z2", "m1"), c("p1", "p1"))) |> is_paistr(),
    TRUE
  )
  expect_equal(
    proceed(hands, list(c("z2", "z2"), c("z2", "z2")), list(c("z2", "m1"), c("p1", "p1")), accumulate = TRUE) |>
      lengths(),
    c(2, 2)
  )
  expect_true(
    proceed(hands, list(c("z2", "p1-23"), c("z2", "z2")), list(c("z1", "m1"), c("p1", "p1"))) |> is_paistr(),
    TRUE
  )
  expect_true(
    proceed(hands, list(c("z3", "z222="), c("z2", "z2")), list(c("z1", "m1"), c("p1", "p1"))) |> is_paistr(),
    TRUE
  )
  expect_true(
    proceed(hands, list(c("z1", "z2"), c("z2", "z2")), list(c("z1111", "m1"), c("p1", "p1"))) |> is_paistr(),
    TRUE
  )
})

test_that("proceed fails", {
  hands <- c(
    "m11p234s555z11122",
    "p1122334455667"
  ) |>
    paistr() |>
    tidy() |>
    dplyr::mutate(tile = as.character(tile)) |>
    lineup()

  # incompatible type
  expect_error(proceed(hands, list(), list(c("m1", "m1"), c("p1", "p1"))))
  expect_error(proceed(hands, list(c("z2", "z2"), c("z2", "z2")), list()))
  expect_error(proceed(hands, list(NA, NA), list(c("m1", "m1"), c("p1", "p1"))))
  # incompatible tiles
  expect_error(
    proceed(hands, list(c("2z", "2z"), c("z2", "z2")), list(c("m1", "m1"), c("p1", "p1")))
  )
  expect_error(
    proceed(hands, list(c(NA_character_, "z2"), c("z2", "z2")), list(c("m1", "m1"), c("p1", "p1")))
  )
  # ツモ・打牌不可
  expect_error(
    proceed(hands, list(c("z2", "z2"), c("z2", "z2")), list(c("z3", "m1"), c("p1", "p1")))
  )
  expect_error(
    proceed(hands, list(c("z2", "s3-45"), c("z2", "z2")), list(c("z1", "m1"), c("p1", "p1")))
  )
  expect_error(
    proceed(hands, list(c("z2", "p222="), c("z2", "z2")), list(c("z1", "m1"), c("p1", "p1")))
  )
  expect_error(
    proceed(hands, list(c("z2", "z2"), c("z2", "z2")), list(c("z1111", "m1"), c("p1", "p1")))
  )
  # 5枚目の"z1"
  expect_error(
    proceed(hands, list(c("z1", "z1"), c("z2", "z2")), list(c("m1", "m1"), c("p1", "p1")))
  )
})
