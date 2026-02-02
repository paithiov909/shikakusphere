# Generate hands at random

Generate hands at random

## Usage

``` r
rand_qipai(nrow, rule = default_rule(), seed = sample.int(10000, 1))
```

## Arguments

- nrow:

  An integer scalar.

- rule:

  A list; a rule set. Defaults to
  [`default_rule()`](https://paithiov909.github.io/shikakusphere/reference/default_rule.md).

- seed:

  An integer scalar. Used for initializing the random number generator.

## Value

A tibble that consists of 4 columns of `paistr` vector.

## Examples

``` r
rand_qipai(3)
#> # A tibble: 3 × 4
#>   l1                      l2                      l3                     
#>   <paistr>                <paistr>                <paistr>               
#> 1 <13>'m19p69s1469z24577' <13>'m56p56s2345667z45' <13>'m46678p77s5589z57'
#> 2 <13>'m1145p123s478z457' <13>'m88p244689s2236z5' <13>'m1679p137s4579z47'
#> 3 <13>'m2578p24589s27z35' <13>'m4678p378s11259z7' <13>'m1p49s44799z12456'
#> # ℹ 1 more variable: l4 <paistr>
```
