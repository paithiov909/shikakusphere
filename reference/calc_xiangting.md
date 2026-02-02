# Calculate xiangting number of hands

Calculate xiangting number of hands

## Usage

``` r
calc_xiangting(pai)
```

## Arguments

- pai:

  A character vector.

## Value

A tibble.

## Examples

``` r
calc_xiangting(c("m345567p234s3378", "p222345z1234567"))
#> # A tibble: 2 × 2
#>     num mode 
#>   <int> <fct>
#> 1     0 yiban
#> 2     4 yiban
```
