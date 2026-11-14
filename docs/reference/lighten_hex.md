# Whiten an RGB Hex Value

`lighten_hex()` whitens a hex triplet to be some proportion of its
original value.

## Usage

``` r
lighten_hex(hex, p)
```

## Arguments

- hex:

  a valid hex triplet, with leading pound sign (#)

- p:

  some value between 0 and 1 for whitening the hex triplet in question.

## Value

`lighten_hex()` takes an RGB hex triplet and a value between (and
including) 0 and 1 and returns a hex triplet that retains some
proportion (`p`) of its original value. For example,
`lighten_hex("#000000", 0)` takes the RGB hex triplet for pure black and
whitens it to retain none of its original color. This would be white.
Alternatively, `lighten_hex("#002f5f", .8)` takes the color
corresponding with Stockholm University Blue (`g_c("su_blue")`) and
whitens it to retain 80% of its original value. This procedure closely
approximates what Stockholm University presents as 80% of its original
color (`#32587E` compared to `#33587f` it presents on its website).

## Details

This function is mostly for internal use, but you're welcome to
experiment with it.

## Author

Steven V. Miller

## Examples

``` r

lighten_hex(g_c("su_fire"), .7)
#> [1] "#F19B66"
# Compare with...
g_c("su_fire70")
#> [1] "#f19b66"
```
