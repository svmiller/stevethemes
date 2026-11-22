# Miscellaneous functions to make your ggplot2 plot "print-ready"

These are assorted functions that will make your plot "print-ready".
These are context-dependent adjustments for things like ticks,
gridlines, and axes.

## Usage

``` r
no_gridlines(...)

make_classic(...)

no_axes(...)
```

## Arguments

- ...:

  called for side effects

## Value

`no_gridlines()` takes a plot made in ggplot2 and removes the gridlines
from the plot before returning it to the user.

`make_classic()` takes a plot made in ggplot2 and removes the gridlines,
gray background, and adds solid axes to the plot.

`no_axes()` removes the x- and y-axes. Use it for making maps because
your audience won't care about the longitude and latitude coordinates
that make the map.

## Details

`no_gridlines()` is a simple wrapper for some basic ggplot2 code that
will allow you to remove gridlines from the plot.

`make_classic()` removes gridlines, removes the default gray background,
*and* imposes a black, solid line on both axes. It will also hard code
the axis text to be black. Using the latter with the former is likely
redundant.

`no_axes()` removes the x- and y-axis from the plot. You'll want this
for making maps, unless it's really pertinent that the user knows the
latitude and longitude coordinates on the y- and x-axis.

You will want to put these functions after a theme you've declared. If
you run this before adding a theme over it, the theme you add will
probably overwrite this function.

## Author

Steven V. Miller

## Examples

``` r

library(ggplot2)

example_plot(type = "scatter")
#> `geom_smooth()` using formula = 'y ~ x'


example_plot(type='scatter') + no_gridlines()
#> `geom_smooth()` using formula = 'y ~ x'


example_plot(type='scatter') + make_classic()
#> `geom_smooth()` using formula = 'y ~ x'


example_plot("map") + no_axes()

```
