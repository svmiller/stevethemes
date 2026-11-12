# Check if you have the fonts you need already installed on your computer

`are_fonts_installed()` leans on systemfonts to determine if R can find
the fonts that are used by the stevethemes package.

## Usage

``` r
are_fonts_installed(check = "all")
```

## Arguments

- check:

  a character vector coinciding with the font or fonts you want to
  check. Defaults to "all", which will check for all of "Open Sans",
  "Titillium Web", "Fira Sans", "Crimson Pro", and "Merriweather".

## Value

`are_fonts_installed()` returns a message communicating whether the
systemfonts package in R can find the fonts used by stevethemes on the
user's operating system. It also returns some information about where
the user can download or obtain these fonts.

## Details

Future functionality will allow you to supply more than "all", but "all"
is the only argument for the function that will work for the moment.

## Author

Steven V. Miller

## Examples

``` r

are_fonts_installed()
#> The {systemfonts} package in R suggests you have the following fonts in your registry:
#> 
#> Open Sans (✓); Titillium Web (✓); Crimson Pro (✓); Fira Sans (✓); Merriweather (✓)
#> 
#> If you see an 'x' in parentheses next to these fonts, it means {systemfonts} doesn't think you have these fonts installed. This package has copies of these fonts that should be minimally sufficient to get you started, which you can find here:
#> 
#> - /tmp/RtmpYyF4Kg/temp_libpath311a057fcc494e/stevethemes/fonts
#> 
#> You can also find full versions of these fonts (and more) here:
#> 
#> - https://fonts.google.com
#> 
#> It might be in your interest to download and install the full fonts.
```
