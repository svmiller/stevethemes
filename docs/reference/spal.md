# Load a palette in `scale_*_manual()`

`spal()` is a derivation of a palette-loading function in an R package I
used to use quite regularly. Its intended use is interacting with
ggplot2 functions like
[`scale_fill_manual()`](https://ggplot2.tidyverse.org/reference/scale_manual.html)
and
[`scale_color_manual()`](https://ggplot2.tidyverse.org/reference/scale_manual.html)
(in particular, the `values` argument). Herein, you can change the
default ggplot2 colors used.

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
  `NULL`. The maximum is 9, and even 9 is pushing it.

- even:

  logical, defaults to TRUE, used internally for diverging palettes.

- d.mid:

  a valid hex triplet coinciding with a color that should serve as the
  middle color in a palette with an odd-numbered length. Applicable only
  to diverging palettes. Default value here is `#f7f7f7`, a color
  slightly

- exp:

  logical, defaults to FALSE, and applicable only to sequential
  palettes. If FALSE, palettes whiten by consistent amount each time
  across the range of colors (maximum: 9). If TRUE, palettes whiten as
  an exponential decay factor.

- lambda:

  the parameter governing the rate of decay. Called only when `exp` is
  TRUE. Higher values mean a faster rate of decay.

## Value

`spal()` returns a character vector of hex triplets to use as a palette
in manually supplying colors to adjust the fill or color of a plot made
by ggplot2.

## Details

Available palettes are listed in the `palettes` data set in this
package. This function consults that data set for the identity of the
palettes that this function creates.

The `n` argument must be specified for sequential palettes and really
should be specified for diverging palettes. If not, diverging palettes
run the risk of being indistinguishable from sequential palettes.

Exponential decays are mostly experimental. I don't even know how much I
would use this function. Use as you see fit. Exponential decays are
min-max transformed to start at 1 and end at 1/n before applying the
whitening factor to
[`lighten_hex()`](https://svmiller.com/reference/lighten_hex.md).

## Description of Color Palettes

|  |  |
|----|----|
| **Palette Name** | **Description** |
| `d-suFB` | Diverging Palette (SU "Fire" to SU Blue) |
| `d-suBF` | Diverging Palette (SU Blue to SU "Fire") |
| `d-suRB` | Diverging Palette (SU Red to SU Blue) |
| `d-suBR` | Diverging Palette (SU Blue to SU Red) |
| `d-suBO` | Diverging Palette (SU Blue to SU Olive) |
| `d-suOB` | Diverging Palette (SU Olive to SU Blue) |
| `d-suFW` | Diverging Palette (SU "Fire" to SU "Water") |
| `d-suWF` | Diverging Palette (SU "Water" to SU "Fire") |
| `s-suB` | Sequential Palette (SU Blue) |
| `s-suO` | Sequential Palette (SU Olive) |
| `s-suR` | Sequential Palette (SU Red) |
| `s-suF` | Sequential Palette (SU "Fire") |
| `s-suS` | Sequential Palette (SU "Sky") |
| `s-suW` | Sequential Palette (SU "Water") |
| `q-supair` | Qualitative Palette of Stockholm University Color Pairs |
| `q-su70` | Qualitative Palette of Stockholm University Colors (Muted, 70%) |
| `q-OI` | Qualitative Palette of Colorblind-Friendly Colors (Okabe-Ito) |
| `q-google` | Qualitative Palette of Google Colors |
| `q-ibm` | Qualitative Palette (IBM Design Colorblind Safe) |
| `q-wong` | Qualitative Palette (Bang Wong Colorblind Safe, Nature Methods \[2011\]) |
| `q-tolm` | Qualitative Palette (Paul Tol Colorblind Safe, Muted) |
| `q-sciencespo` | Qualitative Palette (Sciences-Po's Médialab \[hard\]) |
| `q-dataroots` | Qualitative Palette (Dataroots) |
| `q-martel` | Qualitative Palette (Inspired by Rick Martel) |

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
