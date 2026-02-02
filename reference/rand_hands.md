# Create a function to randomly generate hands

Create a function to randomly generate hands

## Usage

``` r
rand_hands(
  hupai = c("pinghe", "zhuangfeng", "menfeng", "fanpai", "duanyaojiu", "yibeikou",
    "sansetongshun", "yiqitongguan", "hunquandaiyaojiu", "qiduizi", "duiduihu",
    "sananke", "sangangzi", "sansetongke", "hunlaotou", "xiaosanyuan", "hunyise",
    "chunquandaiyaojiu", "erbeikou", "qingyise", "guoshiwushuang", "sianke", "dasanyuan",
    "xiaosixi", "dasixi", "ziyise", "lvyise", "qinglaotou", "sigangzi", "jiulianbaodeng"),
  zhuangfeng = c("z1", "z2", "z3", "z4"),
  menfeng = c("z2", "z3", "z4", "z1"),
  rule = default_rule(),
  seed = sample.int(10000, 1)
)
```

## Arguments

- hupai:

  A string scalar.

- zhuangfeng:

  A string scalar; "ba-kaze" tile.

- menfeng:

  A string scalar; "ji-kaze" tile.

- rule:

  A list; a rule set. Defaults to
  [`default_rule()`](https://paithiov909.github.io/shikakusphere/reference/default_rule.md).

- seed:

  An integer scalar. Used for initializing the random number generator.

## Value

A function inheriting class `purrr_function_compose` that takes single
arguments `n`: number of hands to be generated.

## Examples

``` r
rand_hands()(3)
#> <skksph_paistr[3]>
#> [1] <14>'m123678p3445567p4'  <14>'m6p456s344556678m6' <14>'m2234p123567s456m2'
```
