#' List of hupai
#'
#' @details
#' A tibble that contains the list of hupai.
#'
#' The list includes the following columns:
#' * `id`: The id of the hupai.
#' * `en`: The English name of the hupai.
#' * `jp`: The Japanese name of the hupai.
"hupai"

#' Sample data of mahjong game log
#'
#' @details
#' A named list that contains sample data of mahjong game log.
#' The data was coverted from 'tenhou.net/6' format
#' using `read_tenhou6()` function
#' in \href{https://github.com/paithiov909/convlog}{convlog} package.
#'
#' @source
#' \url{https://github.com/Equim-chan/mjai-reviewer/blob/master/convlog/tests/testdata/ranked_game.json}
"ranked_game"

#' Test cases for `calc_xiangting()`
#'
#' @details
#' A tibble that contains test cases for `calc_xiangting()`.
#' Contents may vary depending on package version.
#'
#' @source
#' \url{https://github.com/TadaoYamaoka/cmajiang/tree/main/tests_cpp/data}
"testdat_xiangting"

#' Lookup table for tiles conversion
#'
#' @details
#' A tibble that contains the lookup table for tiles conversion.
"tiles"
