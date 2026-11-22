# Convert RGB values to a HEX color

Converts red, green, and blue (RGB) color values into a six-digit hex
triplet.

## Usage

``` r
rgb2hex(r, g, b)
```

## Arguments

- r:

  a numeric for red channel intensity, between 0 and 255.

- g:

  a numeric for green channel intensity, between 0 and 255.

- b:

  a numeric for blue channel intensity, between 0 and 255.

## Value

A character string containing a six-digit hex triplet in the format
`#RRGGBB`.

## Details

RGB values are specified using the 8-bit RGB color model, in which each
channel ranges from 0 (no intensity) to 255 (maximum intensity). Values
must be whole numbers, although they may be supplied as either integers
or numeric values.

## Examples

``` r
rgb2hex(0, 47, 95)
#> [1] "#002F5F"
rgb2hex(196, 232, 237)
#> [1] "#C4E8ED"
rgb2hex(255, 255, 255)
#> [1] "#FFFFFF"
```
