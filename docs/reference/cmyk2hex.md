# Convert CMYK values to a HEX color

Converts cyan, magenta, yellow, and black (CMYK) color values into a
six-digit hex triplet.

## Usage

``` r
cmyk2hex(c, m, y, k)
```

## Arguments

- c:

  a numeric for cyan channel intensity, between 0 and 100.

- m:

  a numeric for magenta channel intensity, between 0 and 100.

- y:

  a numeric for yellow channel intensity, between 0 and 100.

- k:

  a numeric for black channel intensity, between 0 and 100.

## Value

A character string containing a six-digit hex triplet in the format
`#RRGGBB`.

## Details

CMYK values are expressed as percentages, ranging from 0 (no ink) to 100
(maximum ink coverage). This function handles the conversion to
proportions.

Conversion to RGB format is performed using a simplified mathematical
model, in which the CMYK values are first converted to proportions
between 0 and 1. The corresponding RGB values are then calculated as:

\$\$R = 255(1-C)(1-K)\$\$ \$\$G = 255(1-M)(1-K)\$\$ \$\$B =
255(1-Y)(1-K)\$\$

The resulting RGB values are rounded to the nearest integer before being
converted to a hex triplet.

This conversion is an approximation and does not account for printing
conditions, ink characteristics, paper properties, or ICC color
profiles. Consequently, the resulting hex triplet may differ from
color-managed CMYK-to-RGB conversions, particularly when CMYK values
originate from professional printing standards. If you are presented
with a CMYK value and an RGB value for the same branded color and want a
hex triplet from it, use
[`rgb2hex()`](https://svmiller.com/reference/rgb2hex.md) instead of this
for obtaining the hex triplet.

## Examples

``` r
cmyk2hex(100, 69, 8, 54)
#> [1] "#00246C"
cmyk2hex(99, 51, 8, 36)
#> [1] "#025096"
cmyk2hex(0, 0, 0, 0)
#> [1] "#FFFFFF"
```
