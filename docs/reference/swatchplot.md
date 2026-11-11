# Create a Swatchplot of Palettes

[`spal()`](http://svmiller.com/reference/spal.md) is a derivation of a
palette-loading function in an R package I used to use quite regularly.
Its intended use is interacting with ggplot2 functions like
`scale_fill_manual` and `scale_color_manual` (in particular, the
`values` argument). Herein, you can change the default ggplot2 colors
used.

## Usage

``` r
swatchplot(palette = NULL, style = "generic", font = NULL)
```

## Arguments

- palette:

  a label coinciding with a value in the `color` column of the
  `steve_hex` data frame

- n:

  a mostly optional argument for how many colors you want. Defaults to
  `NULL`.

- even:

  logical, defaults to TRUE, used internally for diverging palettes.

- d.mid:

  a valid hex code coinciding with a color that should serve as the
  middle color in a palette whose length is an odd number. Applicable
  only to diverging palettes. Default value here is "white" (`#FFFFFF`).
  I'll be honest that I'm thinking of changing this to `#F7F7F7`.

## Value

[`spal()`](http://svmiller.com/reference/spal.md) returns a character
vector of hex codes to use as a palette in manually supplying colors to
adjust the fill or color of a plot made by ggplot2.

## Details

dsfdsfs

## Author

Steven V. Miller

## Examples

``` r

swatchplot(style = 'custom', font='Arial Narrow')

swatchplot("q-martel", "web")

```
