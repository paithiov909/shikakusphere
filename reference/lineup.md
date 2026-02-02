# Line up tiles

Arrange all tiles from a data frame.

## Usage

``` r
lineup(x)
```

## Arguments

- x:

  A data frame with columns `id`, `tile`, and `n`.

## Value

An object of `x$tile` class.

## Examples

``` r
rand_hands()(3) |>
  paistr() |>
  tidy() |>
  lineup()
#> [[1]]
#>  [1] m1 m2 m3 m7 m8 m9 p2 p2 p3 p3 p4 p4 s1 s1
#> 38 Levels: _ m0 m1 m2 m3 m4 m5 m6 m7 m8 m9 p0 p1 p2 p3 p4 p5 p6 p7 p8 p9 ... z7
#> 
#> [[2]]
#>  [1] m6 m6 p3 p4 p5 p6 p7 p8 s4 s5 s6 s6 s7 s8
#> 38 Levels: _ m0 m1 m2 m3 m4 m5 m6 m7 m8 m9 p0 p1 p2 p3 p4 p5 p6 p7 p8 p9 ... z7
#> 
#> [[3]]
#>  [1] p3 p4 p5 p7 p7 s5 s6 s7 s7 s7 s8 s8 s9 s9
#> 38 Levels: _ m0 m1 m2 m3 m4 m5 m6 m7 m8 m9 p0 p1 p2 p3 p4 p5 p6 p7 p8 p9 ... z7
#> 
```
