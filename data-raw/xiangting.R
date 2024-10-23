pkgload::load_all(export_all = FALSE)

urls <- c(
  "https://github.com/TadaoYamaoka/cmajiang/raw/refs/heads/main/tests_cpp/data/xiangting_1.json",
  "https://github.com/TadaoYamaoka/cmajiang/raw/refs/heads/main/tests_cpp/data/xiangting_2.json",
  "https://github.com/TadaoYamaoka/cmajiang/raw/refs/heads/main/tests_cpp/data/xiangting_3.json",
  "https://github.com/TadaoYamaoka/cmajiang/raw/refs/heads/main/tests_cpp/data/xiangting_4.json"
)

test_xiangting <-
  purrr::map(urls, function(url) {
    jsonlite::read_json(url, simplifyVector = TRUE) |>
      dplyr::slice_sample(n = 1000) |>
      dplyr::rowwise() |>
      dplyr::mutate(
        q = lipai(q),
        n = min(unlist(x, use.names = FALSE))
      ) |>
      dplyr::ungroup()
  }) |>
  dplyr::bind_rows()

usethis::use_data(test_xiangting, overwrite = TRUE)
