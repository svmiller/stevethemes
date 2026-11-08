# Learn how to install fonts on your computer

`how_to_install_fonts()` communicates to the user how they can install
fonts on their computer.

## Usage

``` r
how_to_install_fonts(os = "any")
```

## Arguments

- os:

  a character vector coinciding with the information you want,
  contingent on your operating system. If `os` is "any" (the default),
  it returns a generic message about how to install fonts. If `os` is
  "windows", "mac", or "linux", you get more information about font
  installation on your operating system.

## Value

`how_to_install_fonts()` returns a message communicating how to install
fonts on the user's operating system.

## Details

The 'any' option for the `os` argument is necessarily less informative.
If you know whether you're using Windows, a Mac, or Linux, you should
change the `os` argument.

## Author

Steven V. Miller

## Examples

``` r

how_to_install_fonts("windows")
#> Open up the directory containing the fonts you want to install. You will see that these font files have an extension of something like '.ttf' or '.otf'. Then, select all the fonts you want to install in this directory. Right click, then select 'Install'. You may have to spam your way through a few permission overrides because Windows installs things at a system-level and can behave like it's paranoid about what you're installing. However, these are just simple font files. Communicate to Windows, ''Yes, I want to install these things because they are just simple fonts.''
#> 
#> After installing these fonts, check that your word processor can see them. Restart Rstudio if necessary and run something like example_plot() + theme_steve() to see if these fonts will render correctly.

how_to_install_fonts("mac")
#> Open up the directory containing the fonts you want to install. You will see that these font files have an extension of something like '.ttf' or '.otf'. Then, hit Cmd-Space and ask Mac to open the Font Book app. In the Font Book app, choose File > Add Fonts to Current User. In the directory containing the fonts you want to install, double-click the font file.
#> 
#> Mac users should have a few more options, all of which are doing the same basic thing. You can right-click on the font file(s) in question and ask to open it in Font Book (which should trigger an installation procedure). You can double-click the font file in Finder and click 'Install' in the dialog that appears. Either way, fonts in Mac are centrally managed through the Font Book app.
#> 
#> After installing these fonts, check that your word processor can see them. Restart Rstudio if necessary and run something like example_plot() + theme_steve() to see if these fonts will render correctly.
```
