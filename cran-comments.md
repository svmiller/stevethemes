## Test environment

- Pop! OS (22.04), R 4.1.2

## Feedback to CRAN Upon Initial Rejection

I thank CRAN for pointing me to style guidelines about referencing other CRAN packages in the DESCRIPTION file, and apologize for the invalid URL/redirect. I'm also a little embarrassed I keep making rookie mistakes after all these years. :P

## Initial Comments to CRAN

R CMD check done via `devtools::check()`, resulting in 0 errors, 0 warnings and 0 notes.

`devtools::spell_check()` results in a few typos, all of which are false positives.

This is a development release of a suite of theme elements for `{ggplot2}`, which make references to fonts that a user may or may not have installed (and for which a CRAN testing computer assuredly won't have installed). It's why the functions that call them are disabled for testing on CRAN computers.

The release of this package will deprecate an identically named function in  `{stevemisc}`, which is on CRAN. That other package is undergoing major developments, and I want to get this on CRAN before I do that.

## Downstream dependencies

None to note. This is a new package.
