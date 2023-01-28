## Test environment

- Pop! OS (22.04), R 4.1.2

## Feedback to CRAN Upon Second Rejection

I apologize for the lack of title case in the DESCRIPTION field. That's my bad.

CRAN is correct that the use of \dontrun{} was inappropriate in the way that I used it. It was because I was wanting to do too much in the examples field there. I removed that from the examples and also pared down what was being done in the examples section.

I think it would just be easier to remove the `download_some_fonts()` function. Its use is better done anyways in the `{gfonts}` package and much of what was being done in that function is now included outright in the package. The package is bigger now but is still well below the 5 MB maximum.

## Feedback to CRAN Upon Initial Rejection

I thank CRAN for pointing me to style guidelines about referencing other CRAN packages in the DESCRIPTION file, and apologize for the invalid URL/redirect. I'm also a little embarrassed I keep making rookie mistakes after all these years. :P

## Initial Comments to CRAN

R CMD check done via `devtools::check()`, resulting in 0 errors, 0 warnings and 0 notes.

`devtools::spell_check()` results in a few typos, all of which are false positives.

This is a development release of a suite of theme elements for `{ggplot2}`, which make references to fonts that a user may or may not have installed (and for which a CRAN testing computer assuredly won't have installed). It's why the functions that call them are disabled for testing on CRAN computers.

The release of this package will deprecate an identically named function in  `{stevemisc}`, which is on CRAN. That other package is undergoing major developments, and I want to get this on CRAN before I do that.

## Downstream dependencies

None to note. This is a new package.
