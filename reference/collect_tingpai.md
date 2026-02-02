# Collect tingpais for hands

Collect tiles that can decrease the xiangting number of hands if they
are drawn. In case there are no tingpais for the hand, the function
warns about it and returns an empty character vector.

## Usage

``` r
collect_tingpai(pai)
```

## Arguments

- pai:

  A character vector.

## Value

A list of character vectors.

## Examples

``` r
collect_tingpai(c("m345567p234s3378", "p222345z1234567"))
#> [[1]]
#> [1] "s6" "s9"
#> 
#> [[2]]
#> [1] "z1" "z2" "z3" "z4" "z5" "z6" "z7"
#> 
```
