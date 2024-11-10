#' Check if a rule is valid
#'
#' @param rule A list.
#' @returns A logical scalar.
#' @keywords internal
is_valid_rule <- function(rule) {
  cond <- identical(
    names(rule),
    c(
      "startingPoints",
      "rankPoints",
      "roundRankPoints",
      "doubleWindTileScore",
      "hongpai",
      "canduan",
      "canChangePermissionLevel",
      "roundsType",
      "abortiveDraw",
      "liujumanguan",
      "notenDeclaration",
      "notenPenalty",
      "maxSimultaneousWinners",
      "dealerContinuationType",
      "bankruptcyEndAll",
      "lastRoundStop",
      "overtimeType",
      "yifa",
      "libaopai",
      "gangbaopai",
      "ganglibaopai",
      "gangbaopaiPostAddition",
      "lizhiWithoutTsumoBonus",
      "lizhiPostClosedGangPermissionLevel",
      "damanguanCombination",
      "doubleDamanguan",
      "countedDamanguan",
      "damanguanPao",
      "roundUpManguan"
    )
  )
  if (!cond) {
    return(FALSE)
  }
  if (!is.numeric(rule[["rankPoints"]]) || length(rule[["rankPoints"]]) != 4) {
    return(FALSE)
  }
  if (!is.numeric(rule[["hongpai"]]) || length(rule[["hongpai"]]) != 3) {
    return(FALSE)
  }
  TRUE
}

#' Create default rule set
#'
#' @seealso
#' \url{https://github.com/kobalab/majiang-core/wiki/%E3%83%AB%E3%83%BC%E3%83%AB}
#' @returns A list.
#' @export
default_rule <- function() {
  list(
    startingPoints = 25000,
    rankPoints = c(20, 10, -10, -20),
    roundRankPoints = FALSE,
    doubleWindTileScore = FALSE,
    hongpai = c(0, 0, 0),
    canduan = FALSE,
    canChangePermissionLevel = 0,
    roundsType = 0,
    abortiveDraw = TRUE,
    liujumanguan = TRUE,
    notenDeclaration = FALSE,
    notenPenalty = TRUE,
    maxSimultaneousWinners = 2,
    dealerContinuationType = 2,
    bankruptcyEndAll = TRUE,
    lastRoundStop = TRUE,
    overtimeType = 1,
    yifa = TRUE,
    libaopai = TRUE,
    gangbaopai = TRUE,
    ganglibaopai = TRUE,
    gangbaopaiPostAddition = TRUE,
    lizhiWithoutTsumoBonus = FALSE,
    lizhiPostClosedGangPermissionLevel = 2,
    damanguanCombination = TRUE,
    doubleDamanguan = TRUE,
    countedDamanguan = TRUE,
    damanguanPao = TRUE,
    roundUpManguan = FALSE
  )
}

#' Modify the default rule set by patch
#'
#' @param patch A list.
#' @returns A list.
#' @export
modify_rule <- function(patch = list()) {
  purrr::list_modify(default_rule(), !!!patch)
}
