# Create a Swatchplot of Palettes

`swatchplot()` creates a plot of color swatches for the various palettes
included in this package.

## Usage

``` r
swatchplot(palette = NULL, style = "generic", font = NULL)
```

## Arguments

- palette:

  must be NULL or one of the palettes included in this package. If NULL
  (the default value), the swatchplot returns swatches for palettes.

- style:

  passed to
  [`theme_steve()`](http://svmiller.com/reference/theme_steve.md) in the
  construction of the plot. Defautls to "generic" for testing purposes.
  Consult the documentation for
  [`theme_steve()`](http://svmiller.com/reference/theme_steve.md) for
  more information.

- font:

  defaults to NULL and used only when the `style` argument is "custom".
  Used for specifying the font of the user's choice that, one assumes,
  is available on their computer.

## Value

`swatchplot()` returns a plot of the colors available in a requested
palette, or all available palettes, as a ggplot2 object.

## Details

The palette argument must be NULL or one of the palettes included in
this package and listed in the `palettes` data frame in this package. If
the palette requested is a diverging or sequential palette, the
swatchplot returns all colors in the palette for a length of 2 to 9 (the
maximum). If the palette requested is qualitative, the swatchplot is all
colors in the palette and their position in it.

## Author

Steven V. Miller

## Examples

``` r

swatchplot()

swatchplot("d-suBF")

swatchplot("s-suO")

swatchplot("q-martel")

```
