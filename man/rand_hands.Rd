% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/rand.R
\name{rand_hands}
\alias{rand_hands}
\title{Create a function to randomly generate hands}
\usage{
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
}
\arguments{
\item{hupai}{A string scalar.}

\item{zhuangfeng}{A string scalar; "ba-kaze" tile.}

\item{menfeng}{A string scalar; "ji-kaze" tile.}

\item{rule}{A list; a rule set. Defaults to \code{default_rule()}.}

\item{seed}{An integer scalar.
Used for initializing the random number generator.}
}
\value{
A function inheriting class \code{purrr_function_compose}
that takes single arguments \code{n}: number of hands to be generated.
}
\description{
Create a function to randomly generate hands
}
\examples{
rand_hands()(3)
}
