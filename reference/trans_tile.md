# Translate tiles from one format to another

Translate tiles from one format to another

## Usage

``` r
trans_tile(
  x,
  from = c("mjai", "tenhou_int", "id", "cmajiang"),
  to = c("cmajiang", "mjai", "tenhou_int", "id")
)
```

## Arguments

- x:

  A vector of tiles to be translated.

- from:

  A string scalar. Either "mjai", "tenhou_int", "id", or "cmajiang".

- to:

  A string scalar. Either "cmajiang", "mjai", "tenhou_int", or "id".

## Value

- For `to = "cmajiang"` and `to = "mjai"`: A character vector.

- For `to = "tenhou_int"`: An integer vector.

## Examples

``` r
trans_tile(c("m0", "p1", "z1", "_"), from = "cmajiang", to = "mjai")
#> [1] "5mr" "1p"  "E"   "?"  
trans_tile(c("5mr", "1p", "E", "?"), from = "mjai", to = "cmajiang")
#> [1] "m0" "p1" "z1" "_" 
trans_tile(c(51, 21, 41, 0), from = "tenhou_int", to = "mjai")
#> [1] "5mr" "1p"  "E"   "?"  
```
