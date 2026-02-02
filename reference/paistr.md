# `paistr` vector

Create a `paistr` vector from a character vector that represents
player's hands.

## Usage

``` r
paistr(x = character())

is_paistr(x)

# S3 method for class 'skksph_paistr'
calculate(x, ...)

# S3 method for class 'skksph_paistr'
plot(x, y, ...)

# S3 method for class 'skksph_paistr'
tidy(x, ...)
```

## Arguments

- x:

  - For `paistr()`: A character vector.

  - For `is_paistr()`: An object to test.

  - For
    [`calculate()`](https://generics.r-lib.org/reference/calculate.html):
    An object to summarize.

  - For [`plot()`](https://rdrr.io/r/graphics/plot.default.html): An
    object to plot as an image.

  - For [`tidy()`](https://generics.r-lib.org/reference/tidy.html): An
    object to tidy up.

- ...:

  Other arguments for
  [`calculate()`](https://generics.r-lib.org/reference/calculate.html),
  [`plot()`](https://rdrr.io/r/graphics/plot.default.html) or
  [`tidy()`](https://generics.r-lib.org/reference/tidy.html).

- y:

  - For [`plot()`](https://rdrr.io/r/graphics/plot.default.html): Not
    used.

## Value

- For `paistr()`: An object of class `skksph_paistr`.

- For `is_paistr()`: A logical scalar.

- For
  [`calculate()`](https://generics.r-lib.org/reference/calculate.html):
  A tibble.

- For [`plot()`](https://rdrr.io/r/graphics/plot.default.html): A bitmap
  image that internally converted by
  [`magick::image_read_svg()`](https://docs.ropensci.org/magick/reference/editing.html)
  is invisibly returned.

- For [`tidy()`](https://generics.r-lib.org/reference/tidy.html): A
  tibble.

## Details

Note that the validation of this function is not so strict. For example,
`paistr("z0")` still produces a valid `paistr` vector even though "z0"
is not a tile that actually exists. These `paistr` are simply ignored by
the 'cmajiang' function wrapper.

The number of tiles displayed when
[`print()`](https://rdrr.io/r/base/print.html) is not always accurate,
so if you need to count the actual number of tiles, use
[`tidy()`](https://generics.r-lib.org/reference/tidy.html).

## Examples

``` r
pai <- paistr(c("m055z7z7,m78-9,z5555,z666=", "m123s789z1117*,p5550"))
print(pai)
#> <skksph_paistr[2]>
#> [1] <15>'m055z7z7,m78-9,z5555,z666=' <14>'m123s789z1117*,p5550'      
is_paistr(pai)
#> [1] TRUE
calculate(pai)
#> # A tibble: 2 × 3
#>      id n_fulou bingpai[,1]  [,2]  [,3]  [,4]  [,5]  [,6]  [,7]  [,8]  [,9]
#>   <int>   <int>       <int> <int> <int> <int> <int> <int> <int> <int> <int>
#> 1     1       3           0     0     0     0     3     0     0     0     0
#> 2     2       1           1     1     1     0     0     0     0     0     0
#> # ℹ 1 more variable: bingpai[10:34] <int>
tidy(pai)
#> # A tibble: 18 × 3
#>       id tile      n
#>    <int> <fct> <int>
#>  1     1 m0        1
#>  2     1 m5        2
#>  3     1 m7        1
#>  4     1 m8        1
#>  5     1 m9        1
#>  6     1 z5        4
#>  7     1 z6        3
#>  8     1 z7        2
#>  9     2 m1        1
#> 10     2 m2        1
#> 11     2 m3        1
#> 12     2 p0        1
#> 13     2 p5        3
#> 14     2 s7        1
#> 15     2 s8        1
#> 16     2 s9        1
#> 17     2 z1        3
#> 18     2 z7        1
```
