## to parse data from https://github.com/tomohxx/necessary-and-unnecessary-tiles
# read_int <- function(int) {
#   int <- unlist(int, use.names = FALSE)
#   stopifnot(length(int) == 10)
#   v <- integer(30)
#   for (i in seq_len(10)) {
#     v[i] <- bitwAnd(int[i], (bitwShiftL(1L, 4L) - 1))
#     v[i + 10] <- bitwAnd(bitwShiftR(int[i], 4L), (bitwShiftL(1L, 9L) - 1))
#     v[i + 20] <- bitwAnd(bitwShiftR(int[i], 13L), (bitwShiftL(1L, 9L) - 1))
#   }
#   return(v)
# }

## 次のファイルに含まれるデータを読み込む
## https://github.com/tomohxx/shanten-number/blob/master/data.tar.gz
## どちらも10列のIntegerMatrixにする
index_s <- readr::read_delim(
  here::here("data-raw", "index_s.txt"),
  delim = " ",
  col_names = FALSE,
  col_types = c(rep("i", 10), "-"),
  col_select = 1:10
) |>
  as.matrix()
index_s |> lobstr::obj_size()

index_h <- readr::read_delim(
  here::here("data-raw", "index_h.txt"),
  delim = " ",
  col_names = FALSE,
  col_types = c(rep("i", 10), "-"),
  col_select = 1:10
) |>
  as.matrix()
index_h |> lobstr::obj_size()

usethis::use_data(index_s, index_h, internal = TRUE, overwrite = TRUE)
