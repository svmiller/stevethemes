#' Download Some Fonts from Google
#'
#' @description \code{download_some_fonts()} is a simple function that will
#' download some fonts from Google and stick them in the package directory.
#'
#' @details  \code{download_some_fonts()} assumes an active internet connection
#' in order to download some fonts from Google. It also assumes you don't have
#' these fonts yet, or do not have them installed. Loading the package will
#' advise you what fonts it suggests you have installed, pointing you in the
#' direction of what you may want to install. At worst, this function downloads
#' stuff you already have installed or downloaded in another directory on your
#' computer. You could always go right to Google and do this manually.
#'
#' Right now, the function won't download a zip file for the font if it detects
#' the zip file it would download is already in the directory.
#'
#' @param unzip logical, defaults to TRUE If TRUE, the function unzips the contents
#' of the file it downloaded into the directory in which you downloaded the zip
#' file.
#'
#' @return \code{download_some_fonts()} downloads some fonts from Google, if
#' they don't already exist in the package's directory, and optionally unzips
#' them. It ends with a message about where these fonts were downloaded to
#' assist the user in locating these fonts (so that they may install them on
#' their operating system).
#'
#' @author Steven V. Miller
#'
#' @examples
#'
#' \dontrun{
#' # Here's where the data are going to be downloaded.
#' system.file("fonts", package="stevethemes")
#' # Now, let's download the data.
#' download_some_fonts()
#' }

download_some_fonts <- function(unzip=TRUE) {

  if(file.exists(system.file("fonts/fira-sans", "Fira_Sans.zip", package="stevethemes"))) {
    message("Fira Sans fonts already appear to be in this directory")
  } else {
    destination <- paste0(system.file("fonts/fira-sans", package='stevethemes'),"/Fira_Sans.zip")
    download.file("https://fonts.google.com/download?family=Fira%20Sans", destfile=destination)

    if(unzip == TRUE) {
    unzip(system.file("fonts/fira-sans", "Fira_Sans.zip", package="stevethemes"),
          exdir = system.file("fonts/fira-sans", package="stevethemes"))
    } else {

    }

  }

  if(file.exists(system.file("fonts/open-sans", "Open_Sans.zip", package="stevethemes"))) {
    message("Open Sans fonts already appear to be in this directory")
  } else {
    destination <- paste0(system.file("fonts/open-sans", package='stevethemes'),"/Open_Sans.zip")
    download.file("https://fonts.google.com/download?family=Open%20Sans", destfile=destination)

    if(unzip == TRUE) {
      unzip(system.file("fonts/open-sans", "Open_Sans.zip", package="stevethemes"),
            exdir = system.file("fonts/open-sans", package="stevethemes"))
    } else {

    }
  }

  if(file.exists(system.file("fonts/titillium-web", "Titillium_Web.zip", package="stevethemes"))) {
    message("Titillium Web fonts already appear to be in this directory")
  } else {
    destination <- paste0(system.file("fonts/titillium-web", package='stevethemes'),"/Titillium_Web.zip")
    download.file("https://fonts.google.com/download?family=Titillium%20Web", destfile=destination)

    if(unzip == TRUE) {
      unzip(system.file("fonts/titillium-web", "Titillium_Web.zip", package="stevethemes"),
            exdir = system.file("fonts/titillium-web", package="stevethemes"))
    } else {

    }
  }

  look_here <- system.file("fonts", package="stevethemes")
  message("Assuming a successful download of these fonts from Google, go here:\n\n", look_here,"\n\nThereafter, unzip the contents and/or install them as you normally would on your operating system.")
}

