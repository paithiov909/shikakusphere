# Compose hands from character vectors

Compose hands from character vectors while ignoring invalid tiles. This
function can handle any number of tiles in each hand, but cannot more
than 5 identical tiles. If there are more than 5 identical tiles, arises
an error.

## Usage

``` r
lipai(x)
```

## Arguments

- x:

  A list of character vectors or a character vector.

## Value

A character vector.

## Examples

``` r
lipai(list(c("m1", "m2", "m3"), c("p1", "p2", "p3")))
#> [1] "m123" "p123"
```
