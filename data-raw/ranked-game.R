ranked_game <-
  system.file("testdata/ranked_game.json", package = "convlog") |>
  convlog::read_tenhou6()

usethis::use_data(ranked_game, overwrite = TRUE)
