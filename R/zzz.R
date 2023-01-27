# CRAN Note avoidance. I hate this check.
# Inspiration: https://github.com/HughParsonage/grattan/blob/master/R/zzz.R
# Also:
if(getRversion() >= "2.15.1")
  utils::globalVariables(
    # underlying data used for behind-the-scenes handsomeness
    c("se_counties_gdppc", "martel_ratings", "steve_hex", "kwh_gdp")
  )


.onAttach <- function(libname, pkgname) {

  check_open_sans <- subset(system_fonts(), family == "Open Sans")
  check_titillium_web <- subset(system_fonts(), family == "Titillium Web")
  check_crimson_pro <- subset(system_fonts(), family == "Crimson Pro")

  if (nrow(check_open_sans) == 0) {
    has_open_sans <- "Open Sans (x)"
  } else {
    has_open_sans <- "Open Sans (\u2713)"

  }


  if (nrow(check_titillium_web) == 0) {
    has_titillium_web <- "Titillium Web (x)"
  } else {
    has_titillium_web <- "Titillium Web (\u2713)"

  }

  if (nrow(check_crimson_pro) == 0) {
    has_crimson_pro <- "Crimson Pro (x)"
  } else {
    has_crimson_pro <- "Crimson Pro (\u2713)"

  }


  if(nrow(check_crimson_pro) > 0 & nrow(check_titillium_web) > 0 & nrow(check_open_sans) > 0) {

  } else {
    packageStartupMessage(paste0("A check of your font registry suggests you may not have one or more of the fonts suggested for this package:\n\n", has_open_sans,"; ", has_titillium_web,"; ", has_crimson_pro,"\n\nCheck download options for more."))
  }

}
