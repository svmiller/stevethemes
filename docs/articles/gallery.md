# A Gallery of \`{stevethemes}\`

``` r

library(tidyverse)
#> ── Attaching core tidyverse packages ──────────────────────── tidyverse 2.0.0 ──
#> ✔ dplyr     1.1.1     ✔ readr     2.1.4
#> ✔ forcats   1.0.0     ✔ stringr   1.5.0
#> ✔ ggplot2   3.4.1     ✔ tibble    3.2.1
#> ✔ lubridate 1.9.2     ✔ tidyr     1.3.0
#> ✔ purrr     1.0.1     
#> ── Conflicts ────────────────────────────────────────── tidyverse_conflicts() ──
#> ✖ dplyr::filter() masks stats::filter()
#> ✖ dplyr::lag()    masks stats::lag()
#> ℹ Use the conflicted package (<http://conflicted.r-lib.org/>) to force all conflicts to become errors
library(stevethemes)
```

``` r

example_plot() + theme_steve()
```

![](gallery_files/figure-html/unnamed-chunk-3-1.png)

``` r

example_plot() + theme_steve("fira")
```

![](gallery_files/figure-html/unnamed-chunk-3-2.png)

``` r

example_plot() + theme_steve("ms")
```

![](gallery_files/figure-html/unnamed-chunk-3-3.png)

``` r

# ^ re: this one; if you're doing this for an academic manuscript, you won't
# want the title and subtitle.

example_plot("faceted_line") + theme_steve()
```

![](gallery_files/figure-html/unnamed-chunk-3-4.png)

``` r

example_plot("faceted_line") + theme_steve("fira")
```

![](gallery_files/figure-html/unnamed-chunk-3-5.png)

``` r


example_plot("scatter") + theme_steve()
#> `geom_smooth()` using formula = 'y ~ x'
```

![](gallery_files/figure-html/unnamed-chunk-3-6.png)

``` r

example_plot("scatter") + theme_steve("fira")
#> `geom_smooth()` using formula = 'y ~ x'
```

![](gallery_files/figure-html/unnamed-chunk-3-7.png)
