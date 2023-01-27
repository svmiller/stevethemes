
# `stevethemes`: Steve’s `ggplot2` themes and related theme elements

[![](https://www.r-pkg.org/badges/version/stevethemes?color=green)](https://cran.r-project.org/package=stevethemes)
[![](http://cranlogs.r-pkg.org/badges/grand-total/stevethemes?color=green)](https://cran.r-project.org/package=stevethemes)
[![](http://cranlogs.r-pkg.org/badges/last-month/stevethemes?color=green)](https://cran.r-project.org/package=stevethemes)
[![](http://cranlogs.r-pkg.org/badges/last-week/stevethemes?color=green)](https://cran.r-project.org/package=stevethemes)

<img src="http://svmiller.com/images/stevethemes-hexlogo.png" alt="stevethemes  hexlogo" align="right" width="200" style="padding: 0 15px; float: right;"/>

`stevethemes` is an R package including various `{ggplot2}` themes and
theme elements (like colors and palettes) that I find useful and
aesthetically pleasing. It also includes some various helper functions
for adjusting plots to taste for either the web or a printed manuscript.
Its use heavily implies, but does not formally require, free fonts you
can download from Google. In particular, it suggests heavy use of
Titillium Web, Open Sans, Fira Sans, and Crimson Pro. The package has a
function to help you download those fonts from Google as well.

## Installation

You can install this on CRAN.

``` r
install.packages("stevethemes")
```

The development version may also have some extra goodies not yet
published on CRAN. You can install the development version of
`stevethemes` from Github via the `devtools` package. I suppose using
the `remotes` package would work as well.

``` r
devtools::install_github("svmiller/stevethemes")
```
