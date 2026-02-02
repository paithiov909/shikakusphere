# Detect specific tiles

Detect specific tiles

## Usage

``` r
tile2rank(x)

tile2suit(x)

is_fulou(x)

is_tsumogiri(x)

is_lizhi(x)

is_suit(x, suit = c("m", "p", "s", "z"))

is_yaojiu(x, negate = FALSE)

is_zhongzhang(x)

is_suzhi(x, suzhi = c("23", "34", "45", "56", "67", "78"))
```

## Arguments

- x:

  A character vector.

- suit:

  A string scalar. Either "m", "p", "s", or "z".

- negate:

  A logical scalar.

- suzhi:

  A string scalar. Either "23", "34", "45", "56", "67", or "78".

## Value

- For `tile2rank` and `tile2suit`: a character vector (an empty string
  for "\_").

- For other functions: a logical vector.
