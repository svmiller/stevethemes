# Load a palette in `scale_*_manual()`

`spal()` is a derivation of a palette-loading function in an R package I
used to use quite regularly. Its intended use is interacting with
ggplot2 functions like `scale_fill_manual` and `scale_color_manual` (in
particular, the `values` argument). Herein, you can change the default
ggplot2 colors used.

## Usage

``` r
spal(
  palette,
  n = NULL,
  even = TRUE,
  d.mid = "#F7F7F7",
  exp = FALSE,
  lambda = 1.25
)
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
  middle color in a palette with an odd-numbered length. Applicable only
  to diverging palettes. Default value here is "white" (`#f7f7f7`), a
  color slightly

- exp:

  logical, defaults to FALSE, and applicable only to sequential
  palettes. If FALSE, palettes whiten by consistent amount each time
  across the range of colors (maximum: 9). If TRUE, palettes whiten as
  an exponential decay factor.

- lambda:

  the parameter governing the rate of decay. Called only when `exp` is
  TRUE. Higher values mean a faster rate of decay.

## Value

`spal()` returns a character vector of hex codes to use as a palette in
manually supplying colors to adjust the fill or color of a plot made by
ggplot2.

## Details

Color palettes available are "d-suFB", "d-suBF", "d-suBR","d-suRB",
"d-suBO", "d-suOB", "d-suFW", "d-suWF", "s-suB", "s-suF", "s-suO",
"s-suR", "q-supair", "q-OI", "q-google", "q-ibm", "q-wong", "q-tol",
"q-sciencespo", "q-dataroots", and "q-martel".

The `n` argument must be specified for sequential palettes and really
should be specified for diverging palettes. If not, diverging palettes
run the risk of being indistinguishable from sequential palettes.

Exponential decays are mostly experimental. I don't even know how much I
would use this function. Use as you see fit. Exponential decays are
min-max transformed to start at 1 and end at 1/n before applying the
whitening factor to
[`lighten_hex()`](http://svmiller.com/reference/lighten_hex.md).

## Description of Color Palettes

|  |  |
|----|----|
| **Name** | **Description** |
| `d-suFB` | diverging palette, ranging from Stockholm University "Fire" to Stockholm University "Blue" |
| `d-suBF` | diverging palette, ranging from Stockholm University "Blue" to Stockholm University "Fire" |
| `d-suBR` | diverging palette, ranging from Stockholm University "Blue" to Stockholm University "Red" |
| `d-suRB` | diverging palette, ranging from Stockholm University "Red" to Stockholm University "Blue" |
| `d-suBO` | diverging palette, ranging from Stockholm University "Blue" to Stockholm University "Olive" |
| `d-suOB` | diverging palette, ranging from Stockholm University "Olive" to Stockholm University "Blue" |
| `d-suFW` | diverging palette, ranging from Stockholm University "Fire" to Stockholm University "Water" |
| `d-suWF` | diverging palette, ranging from Stockholm University "Water" to Stockholm University "Fire" |
| `s-suB` | sequential palette, in shades of Stockholm University "Blue" |
| `s-suF` | sequential palette, in shades of Stockholm University "Fire" |
| `s-suO` | sequential palette, in shades of Stockholm University "Olive" |
| `s-suR` | sequential palette, in shades of Stockholm University "Red" |
| `s-suS` | sequential palette, in shades of Stockholm University "Sky" |
| `s-suW` | sequential palette, in shades of Stockholm University "Water" |
| `q-supair` | qualitative palette, using colors pairs of Stockholm University's template |
| `q-OI` | qualitative palette, Okabe-Ito (Colorbind Friendly) |
| `q-google` | qualitative palette, using Google colors |
| `q-ibm` | qualitative palette, using IBM Design Colorblind Safe Palette |
| `q-wong` | qualitative palette, using Wong Colorblind Safe Palette |
| `q-tolm` | qualitative palette, using Paul Tol's Muted Qualitative Palette |
| `q-sciencespo` | qualitative palette, using Sciences-Po's Médialab (hard) |
| `q-dataroots` | qualitative palette, paired, using Dataroots' colors |
| `q-martel` | qualitative palette, using a palette of colors inspired by Rick Martel |

## Author

Steven V. Miller

## Examples

``` r

spal("q-martel")
#> [1] "#e04892" "#411e65" "#70c6df" "#a01f19" "#000000"
spal("d-suBO")
#> [1] "#002f5f" "#3F6387" "#A5B6C7" "#CCD5DF" "#F7F7F7" "#ECEDE1" "#DEE0CB"
#> [8] "#BABD90" "#a3a86b"
spal("s-suB", n = 5)
#> [1] "#002f5f" "#32587E" "#66829F" "#99ABBF" "#CCD5DF"
```
