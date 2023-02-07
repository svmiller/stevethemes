# CRAN Note avoidance. I hate this check.
# Inspiration: https://github.com/HughParsonage/grattan/blob/master/R/zzz.R
# Also:
if(getRversion() >= "2.15.1")
  utils::globalVariables(
    # underlying data used for behind-the-scenes handsomeness
    c("se_counties_gdppc", "martel_ratings", "steve_hex", "kwh_gdp")
  )


.onAttach <- function(libname, pkgname) {

  my_fonts <- system_fonts()


  check_open_sans <-  my_fonts[which(my_fonts$family == "Open Sans"),]
  check_titillium_web <-  my_fonts[which(my_fonts$family == "Titillium Web"),]
  check_crimson_pro <-  my_fonts[which(my_fonts$family == "Crimson Pro"),]
  check_fira_sans <-  my_fonts[which(my_fonts$family == "Fira Sans"),]
  check_merriweather <-  my_fonts[which(my_fonts$family == "Merriweather"),]


  if (nrow(check_open_sans) == 0) {
    has_open_sans <- "Open Sans (x)"
  } else {
    has_open_sans <- "Open Sans (\u2713)"

  }

  if (nrow(check_fira_sans) == 0) {
    has_fira_sans <- "Fira Sans (x)"
  } else {
    has_fira_sans <- "Fira Sans (\u2713)"

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

  if (nrow(check_merriweather) == 0) {
    has_merriweather <- "Merriweather (x)"
  } else {
    has_merriweather <- "Merriweather (\u2713)"

  }


  if(nrow(check_crimson_pro) > 0 & nrow(check_titillium_web) > 0 & nrow(check_open_sans) > 0 & nrow(check_fira_sans) > 0 & nrow(check_merriweather)) {


  } else {
    packageStartupMessage(paste0("A check of your font registry suggests you may not have one or more of the fonts suggested for this package:\n\n", has_open_sans,"; ", has_titillium_web,"; ", has_crimson_pro,"; ",has_fira_sans, "; ",has_merriweather, "\n\nThis package has copies of these fonts that should be minimally sufficient to get you started. You can find these here:\n\n- ",paste0(system.file("fonts", package='stevethemes')),"\n\nYou can also find full versions of these fonts (and more) here:\n\n- https://fonts.google.com\n\nYou can install these fonts as you would normally on your operating system.\n\n- Windows users: select all fonts you want to install. Right click, and select 'Install'.\n- Mac users: Double-click the font file and install in Font Book app.\n- Linux users: create a folder in your home directory called '.fonts' and copy-paste all the fonts you want into it For you, this directory would be: ", paste0(Sys.getenv('HOME'),"/.fonts"),"\n\nAfter installing these fonts, check that your word processor can see them. Restart Rstudio if necessary and run something like example_plot() + theme_steve() to see if these fonts will render correctly."))
  }

}
