# Convert integers to tiles

Convert integers to tiles

## Usage

``` r
int2tile(x = seq_len(38) - 1, origin = c("zero", "one"))
```

## Arguments

- x:

  An integer vector.

- origin:

  A string scalar. Either "zero" or "one".

## Value

A factor.

## Examples

``` r
int2tile(c(0, 1, 25, 37))
#> [1] m0 m1 s5 z7
#> 38 Levels: _ m0 m1 m2 m3 m4 m5 m6 m7 m8 m9 p0 p1 p2 p3 p4 p5 p6 p7 p8 p9 ... z7
```
