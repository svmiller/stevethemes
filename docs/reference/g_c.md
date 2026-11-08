# Get a Custom Color from `steve_hex`

`g_c()` (i.e. \*g\*et \*c\*olor) is a simple function that interfaces
with the `steve_hex` data frame to return a hex value associated with a
named color.

`lighten_hex()` whitens an RGB hex value to be some proportion of its
original value.

## Usage

``` r
g_c(x)

lighten_hex(hex, p)
```

## Arguments

- x:

  a label coinciding with a value in the `color` column of the
  `steve_hex` data frame

- hex:

  a valid RGB hex value, with leading pound sign (#)

- p:

  some value between 0 and 1 for whitening the RGB hex value in
  question.

## Value

`g_c()` returns a character vector, in particular, a hex triplet that
coincides with the label supplied in the function. Use it for specifying
a custom fill or color in a plot.

`lighten_hex()` takes an RGB hex value and a value between (and
including) 0 and 1 and returns a HEX code that retains some proportion
(`p`) of its original value. For example, `lighten_hex("#000000", 0)`
takes the RGB hex value for pure black and whitens it to retain none of
its original color. This would be white. Alternatively,
`lighten_hex("#002f5f, .8)` takes the color corresponding with Stockholm
University Blue `g_c("su_blue")` and whitens it to retain 80% of its
original value. This procedure closely approximates what Stockholm
University presents as 80% of its original color (`#32587E` compared to
`#33587f` it presents on its website).

## Details

Check `steve_hex` in this same package for the custom colors included

This function is mostly for internal use, but you're welcome to
experiment with it.

## Author

Steven V. Miller

## Examples

``` r

g_c("su_blue")
#> [1] "#002f5f"

g_c("martel_pink")
#> [1] "#e04892"

lighten_hex(g_c("su_fire"), .7)
#> [1] "#F19B66"
# Compare with...
g_c("su_fire70")
#> [1] "#f19b66"
```
