tiles <- data.frame(
  id = as.integer(c(
    30, # "z0" is missing. treating it as "_"
    0, 1, 2, 3, 4, 5, 6, 7, 8, 9,
    10, 11, 12, 13, 14, 15, 16, 17, 18, 19,
    20, 21, 22, 23, 24, 25, 26, 27, 28, 29,
    31, 32, 33, 34, 35, 36, 37
  )),
  cmajiang = c(
    "_",
    paste0("m", 0:9),
    paste0("p", 0:9),
    paste0("s", 0:9),
    paste0("z", 1:7)
  ),
  mjai = c(
    "?",
    "5mr", paste0(1:9, "m"),
    "5pr", paste0(1:9, "p"),
    "5sr", paste0(1:9, "s"),
    "E", "S", "W", "N", "P", "F", "C"
  ),
  tenhou_int = as.integer(c(
    0,
    51, 11:19,
    52, 21:29,
    53, 31:39,
    41:47
  ))
) |>
  dplyr::as_tibble()

usethis::use_data(tiles, overwrite = TRUE)
