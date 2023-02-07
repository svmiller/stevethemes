#' Check if you have the fonts you need already installed on your computer
#'
#' @description \code{are_fonts_installed()} leans on \pkg{systemfonts} to determine
#' if R can find the fonts that are used by the \pkg{stevethemes} package.
#'
#' @details Future functionality will allow you to supply more than "all", but
#' "all" is the only argument for the function that will work for the moment.
#'
#' @name are_fonts_installed
#'
#' @param check a character vector coinciding with the font or fonts you want to
#' check. Defaults to "all", which will check for all of "Open Sans", "Titillium Web",
#' "Fira Sans", "Crimson Pro", and "Merriweather".
#'
#' @return \code{are_fonts_installed()} returns a message communicating whether
#' the \pkg{systemfonts} package in R can find the fonts used by \pkg{stevethemes}
#' on the user's operating system. It also returns some information about where
#' the user can download or obtain these fonts.
#'
#' @author Steven V. Miller
#'
#' @examples
#'
#' are_fonts_installed()

are_fonts_installed <- function(check="all") {
  my_fonts <- system_fonts()

  if(!(check %in% c("all"))) {
    stop("The 'check' argument only takes ''all'' for the time being. The extent of what it is checking is not so large or time-consuming to burden the user, at least I don't think.")
  }

  if (check == "all") {


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

  }


  message(paste0("The {systemfonts} package in R suggests you have the following fonts in your registry:\n\n", has_open_sans,"; ", has_titillium_web,"; ", has_crimson_pro,"; ",has_fira_sans, "; ",has_merriweather, "\n\nIf you see an 'x' in parentheses next to these fonts, it means {systemfonts} doesn't think you have these fonts installed. This package has copies of these fonts that should be minimally sufficient to get you started, which you can find here:\n\n- ",paste0(system.file("fonts", package='stevethemes')),"\n\nYou can also find full versions of these fonts (and more) here:\n\n- https://fonts.google.com\n\nIt might be in your interest to download and install the full fonts."))

}

