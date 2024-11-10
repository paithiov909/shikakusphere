#' 局数`[局数, 本場, 供託/100点]`を`package_version`に変換する
#' 局数は [東1..北4] が [0..16) に対応
#' @noRd
as_version <- function(x) {
  purrr::map(x, function(v) {
    paste0(v, collapse = ".") |>
      package_version(strict = FALSE)
  }) |>
    purrr::list_c()
}

#' プレイヤーごとの`list(qipai, zimo, dapai)`を`data.frame`にする
#' ここでツモ切り`60`は現物にして末尾に`_`を付けておく
#' @param x 各プレイヤーの`list(qipai, zimo, dapai)`
#' @param ju 局数を含む`package_version`のベクトル
#' @noRd
collect_log_by_player <- function(x, ju) {
  ret <- purrr::map2(x, c("qipai", "zimo", "dapai"), function(y, z) {
    data.frame(
      round = rep(ju, vctrs::list_sizes(y)),
      action = z,
      pai = unlist(y, use.names = FALSE) |> as.character()
    )
  })
  ret[[3]][["pai"]] <- vctrs::vec_assign(
    ret[[3]][["pai"]],
    ret[[3]][["pai"]] == 60,
    paste0(ret[[2]][["pai"]][which(ret[[3]][["pai"]] == 60, useNames = FALSE)], "_")
  )
  ret
}

#' JSON形式における牌`15`などを`m5`の形に変換する
#' @param x 牌を表す2桁の整数ベクトル. 副露は渡さない
#' @returns 牌を表す文字列ベクトル.
#' 後でパースした副露も含むベクトルにするので`factor`としては返さない
#' @noRd
tenhouint2tile <- function(x) {
  mark <- stringi::stri_extract_all_regex(x, "[_\\*]")
  digit <- stringi::stri_extract_all_regex(x, "[\\d]{2}")
  tile <- c(
    0,
    51, 11:19,
    52, 21:29,
    53, 31:39,
    41:47
  ) |>
    rlang::set_names(
      "_",
      paste0("m", 0:9),
      paste0("p", 0:9),
      paste0("s", 0:9),
      paste0("z", 1:7)
    )
  paste0(
    as.character(factor(unlist(digit, use.names = FALSE), levels = tile, labels = names(tile))),
    stringi::stri_na2empty(unlist(mark, use.names = FALSE))
  )
}

#' 牌と副露をパースする
#' @param x 牌や副露を表す文字列ベクトル
#' @importFrom stringi stri_flatten
#' @noRd
parse_tile <- function(x) {
  # m: 大明カン `191919m19` -> `m9999+`
  check <- stringi::stri_detect_regex(x, "m[\\d]{2}")
  is_fulou <- check
  if (any(check)) {
    x[check] <- x[check] |>
      rlang::as_function(~ {
        # 1,3,5,7
        pos <- stringi::stri_locate_first_fixed(., "m")[, "start"]
        tile <-
          stringi::stri_extract_all_regex(., "[\\d]{2}") |>
          purrr::map(~ tenhouint2tile(as.integer(.))) |>
          lipai()
        purrr::imap_chr(as.character(pos), \(p, i) {
          switch(p,
            "1" = stri_flatten(c(tile[i], "-")),
            "3" = stri_flatten(c(tile[i], "=")),
            "5" = stri_flatten(c(tile[i], "=")),
            "7" = stri_flatten(c(tile[i], "+"))
          )
        })
      })()
  }
  # a: 暗カン `191919a19` -> `m9999`
  check <- stringi::stri_detect_fixed(x, "a")
  is_fulou <- is_fulou | check
  if (any(check)) {
    x[check] <- x[check] |>
      stringi::stri_extract_all_regex("[\\d]{2}") |>
      purrr::map(~ tenhouint2tile(as.integer(.))) |>
      lipai()
  }
  # k: 加カン `1919k1919` -> `m999+9`
  check <- stringi::stri_detect_fixed(x, "k")
  is_fulou <- is_fulou | check
  if (any(check)) {
    x[check] <- x[check] |>
      rlang::as_function(~ {
        # 1,3,5
        pos <- stringi::stri_locate_first_fixed(., "k")[, "start"]
        tile <-
          stringi::stri_extract_all_regex(., "[\\d]{2}") |>
          purrr::map(\(x) {
            tenhouint2tile(as.integer(x))
          })
        purrr::map2_chr(tile, pos, \(str, i) {
          rank <- tile2rank(str)
          switch(as.character(i),
            "1" = stri_flatten(c(tile2suit(str[4]), rank[1:3], "-", rank[4])),
            "3" = stri_flatten(c(tile2suit(str[4]), rank[1:3], "=", rank[4])),
            "5" = stri_flatten(c(tile2suit(str[4]), rank[1:3], "+", rank[4]))
          )
        })
      })()
  }
  # p: ポン `19p1919` -> `m999=`
  check <- stringi::stri_detect_fixed(x, "p")
  is_fulou <- is_fulou | check
  if (any(check)) {
    x[check] <- x[check] |>
      rlang::as_function(~ {
        # 1,3,5
        pos <- stringi::stri_locate_first_fixed(., "p")[, "start"]
        tile <-
          stringi::stri_extract_all_regex(., "[\\d]{2}") |>
          purrr::map(\(x) {
            tenhouint2tile(as.integer(x))
          })
        purrr::map2_chr(tile, pos, \(str, i) {
          switch(as.character(i),
            "1" = stri_flatten(c(tile2suit(str[1]), stri_flatten(tile2rank(str[c(2, 3, 1)])), "-")),
            "3" = stri_flatten(c(tile2suit(str[2]), stri_flatten(tile2rank(str[c(1, 3, 2)])), "=")),
            "5" = stri_flatten(c(tile2suit(str[3]), stri_flatten(tile2rank(str[c(1, 2, 3)])), "+"))
          )
        })
      })()
  }
  # チー
  check <- stringi::stri_detect_fixed(x, "c")
  is_fulou <- is_fulou | check
  if (any(check)) {
    x[check] <- x[check] |>
      rlang::as_function(~ {
        # 1,3,5
        pos <- stringi::stri_locate_first_fixed(., "c")[, "start"]
        tile <-
          stringi::stri_extract_all_regex(., "[\\d]{2}") |>
          purrr::map(\(x) {
            tenhouint2tile(as.integer(x))
          })
        purrr::map2_chr(tile, pos, \(str, i) {
          rank <- tile2rank(str)
          switch(as.character(i),
            "1" = stri_flatten(c(tile2suit(str[1]), rank[2], rank[3], rank[1], "-")),
            "3" = stri_flatten(c(tile2suit(str[2]), rank[1], rank[3], rank[2], "-")),
            "5" = stri_flatten(c(tile2suit(str[3]), rank[1], rank[2], rank[3], "-"))
          )
        })
      })()
  }
  # リーチ
  check <- stringi::stri_detect_fixed(x, "r")
  if (any(check)) {
    x[check] <- x[check] |>
      stringi::stri_replace_all_regex("r(\\d{2})", "$1\\*")
  }
  # その他
  x[!is_fulou] <- tenhouint2tile(x[!is_fulou])
  x
}

#' Read 'tenhou.net/6' format mahjong log
#'
#' @param file JSON file.
#' @returns
#' A list that contains the following elements:
#' * `meta`: a list that contains `title`, `name` and `rule` string of the game.
#' * `paifu`: a tibble that contains the log of the game.
#' * `info`: a tibble that contains the other information of the game.
#' @export
read_tenhou6 <- function(file) {
  js <-
    jsonlite::read_json(file, simplifyVector = TRUE)

  log <- purrr::list_transpose(js$log)

  # 局
  ju <- as_version(log[[1]])
  # 持ち点
  score <- purrr::list_transpose(log[[2]]) |>
    tibble::as_tibble(.name_repair = ~ paste0("l", seq_along(.)))
  # ドラ、裏ドラ
  baopai <- log[[3]]
  libaopai <- log[[4]]
  # 牌譜
  paifu <-
    list(
      collect_log_by_player(log[5:7], ju),
      collect_log_by_player(log[8:10], ju),
      collect_log_by_player(log[11:13], ju),
      collect_log_by_player(log[14:16], ju)
    ) |>
    purrr::imap(function(x, i) {
      vctrs::vec_cbind(
        purrr::list_rbind(x),
        data.frame(player = paste0("l", i))
      )
    }) |>
    purrr::list_rbind() |>
    tibble::as_tibble()
  paifu[["pai"]] <- parse_tile(paifu[["pai"]])

  # フッター
  footer <- purrr::list_transpose(log[[17]])
  footer1 <- footer[[1]]
  footer2 <- purrr::list_transpose(footer[[2]]) |>
    tibble::as_tibble(.name_repair = ~ paste0("l", seq_along(.)))
  footer3 <- purrr::map(footer[[3]], function(x) {
    if (is.null(x)) {
      list(rep(NA_integer_, 3), NA_character_, NA_character_)
    } else {
      list(
        as.integer(x[1:3]),
        x[4],
        paste0(x[5:length(x)], collapse = ",")
      )
    }
  }) |>
    purrr::list_transpose() |>
    purrr::set_names(c("baojia", "defen", "hupai")) |>
    tibble::as_tibble()

  list(
    meta = list(
      title = js[["title"]],
      name = js[["name"]],
      rule = js[["rule"]]
    ),
    paifu = paifu,
    info = tibble::tibble(
      round = ju,
      baopai = purrr::map(baopai, ~ tenhouint2tile(.)),
      libaopai = purrr::map(libaopai, ~ tenhouint2tile(.)),
      score = score,
      result = footer1,
      payment = footer2,
      footer3
    )
  )
}
