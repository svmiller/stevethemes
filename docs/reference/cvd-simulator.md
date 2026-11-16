# Color Vision Deficiency Simulation Tools

These are various color vision deficiency simulation tools for
evaluating color palettes and how colorblind-friendly they are.

## Usage

``` r
deut(pal)

prot(pal)

trit(pal)

cvdplot(pal)
```

## Arguments

- pal:

  a character vector of valid hex triplets (with leading pound signs) or
  a character of length 1 matching a palette name in the `palettes` data
  frame

## Value

`deut()` takes a palette from this package (or a character vector of
valid hex triplets) and returns their adjusted hex triplets under
conditions of deuteranomaly.

`prot()` takes a palette from this package (or a character vector of
valid hex triplets) and returns their adjusted hex triplets under
conditions of protanomaly.

`trit()` takes a palette from this package (or a character vector of
valid hex triplets) and returns their adjusted hex triplets under
conditions of tritanomaly.

`cvdplot()` takes a palette from this package (or a character vector of
valid hex triplets) and returns a graph that juxtaposes the palette
vis-a-vis what they would look like under varying conditions of color
vision deficiency (deuteranomaly, protanomaly, and tritanomaly).

## Details

These functions take valid hex triplets of any length *or* a character
that matches one of the palettes available in this package. Check the
`palettes` data frame for those.

The functions simulate the palettes under *maximum* conditions of color
vision deficiency. Future extensions of these functions will likely
allow the user to specify the severity of color vision deficiency they
want to simulate. For now, the simulations assume the maximum severity
of deuteranomaly, protanomaly, and tritanomaly.

## Author

Steven V. Miller

## Examples

``` r

deut("q-martel")
#> [1] "#8C8D8E" "#033063" "#A5B5DF" "#685C12" "#000000"
prot("q-martel")
#> [1] "#627194" "#003067" "#B6C1E0" "#494016" "#000000"
trit("q-martel")
#> [1] "#F13B67" "#3A2E3E" "#2FCFCE" "#B10020" "#000000"

cvdplot("q-martel")

```
