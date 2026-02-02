# Proceed state of hands

Proceed state of hands

## Usage

``` r
proceed(qipai, zimo, dapai, accumulate = FALSE)
```

## Arguments

- qipai:

  A list of character vectors where each element represents a player's
  qipai.

- zimo:

  A list of character vectors where each element represents a players's
  zimo.

- dapai:

  A list of character vectors where each element represents a players's
  dapai.

- accumulate:

  Logical. If true, returns accumulated result.

## Value

A (list of) `paistr` vector(s).

## Examples

``` r
if (requireNamespace("dplyr", quietly = TRUE)) {
  qipai <-
    paistr("m123456789p1s1z11") |>
    tidy() |>
    dplyr::mutate(tile = as.character(tile)) |>
    lineup()
  zimo <- list(c("p2", "p3"))
  dapai <- list(c("z1", "z1"))
  proceed(qipai, zimo, dapai)
}
#> <skksph_paistr[1]>
#> [1] <13>'m123456789p123s1'
```
