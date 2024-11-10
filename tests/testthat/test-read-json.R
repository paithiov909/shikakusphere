test_that("parse_meld works", {
  # 大明カン
  expect_equal(
    parse_tile(c("m19191919", "19m191919", "1919m1919", "191919m19")),
    c("m9999-", "m9999=", "m9999=", "m9999+")
  )
  # 暗カン
  expect_equal(
    parse_tile("191919a19"),
    c("m9999")
  )
  # 加カン
  expect_equal(
    parse_tile(c("k15155115", "15k511515", "1551k1515")),
    c("m550-5", "m505=5", "m505+5")
  )
  # ポン
  expect_equal(
    parse_tile(c("p151551", "15p5115", "1551p15")),
    c("m505-", "m550=", "m505+")
  )
  # チー
  expect_equal(
    parse_tile(c("c141516", "14c1516", "1415c16")),
    c("m564-", "m465-", "m456-")
  )
})

# testdata: https://github.com/Apricot-S/majiang-log/blob/main/examples/output_log.example.json
test_that("read_tenhou6 works", {
  paifu <-
    read_tenhou6(
      system.file("json", "output_log.example.json", package = "shikakusphere")
    )[["paifu"]] |>
    dplyr::filter(player == "l1", action != "qipai", round == "5.0.0") |>
    dplyr::pull(pai, action)
  expect_snapshot_value(paifu, style = "json2", cran = FALSE)
})

# testdata: https://github.com/Equim-chan/mjai-reviewer/tree/master/convlog/tests/testdata
test_that("read_tenhou6 works for chankan.json", {
  paifu <-
    read_tenhou6(
      system.file("json", "chankan.json", package = "shikakusphere")
    )[["paifu"]] |>
    dplyr::pull(pai, action)
  expect_snapshot_value(paifu, style = "json2", cran = FALSE)
})
