# Convert symbols from 'mjai' format

Converts symbols from 'mjai' format into 'cmajiang' format. To read
'mjai' format logs, use `convlog::read_tenhou6()`.

## Usage

``` r
mjai_target(perspective, target)

mjai_conv(type, pai, consumed, target)
```

## Arguments

- perspective:

  An integer vector that indicates the plyaer's perspective.

- target:

  An integer vector that represents the target of 'mjai' events.

- type:

  A character vector that represents the type of 'mjai' events.

- pai:

  A character vector of tiles to be converted from 'mjai' format into
  'cmajiang' format.

- consumed:

  A list of character vectors that represent the 'consumed' tiles in
  'mjai' format.

## Value

A character vector.

## Examples

``` r
if (requireNamespace("dplyr", quietly = TRUE)) {
  data("ranked_game")
  ranked_game[["paifu"]] |>
    dplyr::filter(
      type %in% c("tsumo", "dahai", "chi", "pon", "daiminkan", "kakan", "ankan")
    ) |>
    dplyr::mutate(
      target = mjai_target(actor, target),
      pai = trans_tile(pai)
    ) |>
    dplyr::group_by(game_id, round_id, actor) |>
    dplyr::mutate(pai = mjai_conv(type, pai, consumed, target)) |>
    dplyr::ungroup()
}
#> # A tibble: 305 × 12
#>    game_id round_id event_id type  actor target pai   tsumogiri consumed
#>      <int>    <int>    <int> <chr> <int> <chr>  <chr> <lgl>     <list>  
#>  1       1        1        1 tsumo     0 NA     z1    NA        <NULL>  
#>  2       1        1        2 dahai     0 NA     m3    FALSE     <NULL>  
#>  3       1        1        3 tsumo     1 NA     z5    NA        <NULL>  
#>  4       1        1        4 dahai     1 NA     p9    FALSE     <NULL>  
#>  5       1        1        5 tsumo     2 NA     m0    NA        <NULL>  
#>  6       1        1        6 dahai     2 NA     p1    FALSE     <NULL>  
#>  7       1        1        7 tsumo     3 NA     p6    NA        <NULL>  
#>  8       1        1        8 dahai     3 NA     z7    FALSE     <NULL>  
#>  9       1        1        9 tsumo     0 NA     s3    NA        <NULL>  
#> 10       1        1       10 dahai     0 NA     s3    TRUE      <NULL>  
#> # ℹ 295 more rows
#> # ℹ 3 more variables: dora_marker <chr>, deltas <list>, ura_markers <list>
```
