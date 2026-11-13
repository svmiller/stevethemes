# Get a Custom Color from `steve_hex`

`g_c()` (i.e. *g*et *c*olor) is a simple function that interfaces with
the `steve_hex` data frame to return a hex value associated with a named
color.

## Usage

``` r
g_c(x)
```

## Arguments

- x:

  a label coinciding with a value in the `color` column of the
  `steve_hex` data frame

## Value

`g_c()` returns a character vector, in particular, a hex triplet that
coincides with the label supplied in the function. Use it for specifying
a custom fill or color in a plot.

## Details

Check `steve_hex` in this same package for the custom colors included

## Author

Steven V. Miller

## Examples

``` r

g_c("su_blue")
#> [1] "#002f5f"

g_c("martel_pink")
#> [1] "#e04892"
```
