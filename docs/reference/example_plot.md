# Create an example plot (in ggplot2) for experimenting with different styles

`example_plot()` allows you to experiment with some ggplot2 themes, like
those in this package, by seeing them applied to some example plots.

## Usage

``` r
example_plot(type = "bar", alpha = 1, color = NULL, fill = NULL, family = NULL)
```

## Arguments

- type:

  a type

- alpha:

  defaults to 1 and passed through to example plots (e.g. "britney")
  where there is use of the fill argument. Values less than 1 induce
  transparency to the fill.

- color:

  defaults to NULL and passed through to example plots (e.g. "scatter")
  where there is use of the color argument. Specifies the color of the
  color. Default is "#002f5f" ("SU Blue")

- fill:

  defaults to NULL and passed through to example plots (e.g. "britney")
  where there is use of the fill argument. Specifies the color of the
  fill. Default is "#9bb2ce" ("SU Water")

- family:

  defaults to NULL and passed through to example plots (e.g. "britney"
  where there is a text annotation). Specifies the font you want for the
  annotation. Default is the use of the default graphics-device font.

## Value

`example_plot()` returns a plot made in ggplot2, allowing the user to
experiment with different themes to see which ones they like the best.

## Details

Valid entries for 'type' are "bar", "faceted-line", "scatter",
"stacked-bar", "britney"

## Author

Steven V. Miller

## Examples

``` r

library(ggplot2)

example_plot()

```
