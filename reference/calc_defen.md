# Calculate score of hand

Calculate score of hand

## Usage

``` r
calc_defen(
  pai,
  baopai,
  libaopai = "",
  rongpai = "",
  rule = default_rule(),
  zhuangfeng = c("z1", "z2", "z3", "z4"),
  menfeng = c("z2", "z3", "z4", "z1"),
  lizhi = c("none", "lizhi", "double-lizhi"),
  yifa = FALSE,
  qianggang = FALSE,
  lingshang = FALSE,
  haidi = c("none", "haidimoyue", "hedilaoyu"),
  tianhe = c("none", "tianhe", "dihe"),
  changbang = 0L,
  lizhibang = 0L
)
```

## Arguments

- pai:

  A string scalar. This param is not vectorized.

- baopai:

  A character vector. "Dora" indicators.

- libaopai:

  A character vector. "Ura-dora" indicators. Leave empty if there is no
  libaopai.

- rongpai:

  A string scalar such as `"m1="`. Leave empty if there is no rongpai.

- rule:

  A list; a rule set. Defaults to
  [`default_rule()`](https://paithiov909.github.io/shikakusphere/reference/default_rule.md).

- zhuangfeng:

  A string scalar; "ba-kaze" tile.

- menfeng:

  A string scalar; "ji-kaze" tile.

- lizhi:

  A string scalar. Either "none", "lizhi", or "double-lizhi".

- yifa:

  A logical scalar; flag for "ippatsu".

- qianggang:

  A logical scalar; flag for "chankan".

- lingshang:

  A logical scalar; flag for "rinshan-kaihou".

- haidi:

  A string scalar. Either "none", "haidimoyue", or "hedilaoyu".

- tianhe:

  A string scalar; Either "none", "tianhe", or "dihe".

- changbang:

  An integer scalar; the number of counter sticks that indicates
  "honba".

- lizhibang:

  An integer scalar; the number of 1,000-point sticks on the table.

## Value

A data frame.

## Examples

``` r
calc_defen("m345567p234s3378", baopai = "z1", rongpai = "s9=")
#>               shoupai hupai fu fanshu damanguan defen menfeng
#> 1 m345567p234s3378s9=    22 30      1         0  1000       1
```
