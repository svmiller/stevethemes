#' Learn how to install fonts on your computer
#'
#' @description \code{how_to_install_fonts()} communicates to the user how they
#' can install fonts on their computer.
#'
#' @details The 'any' option for the \code{os} argument is necessarily less
#' informative. If you know whether you're using Windows, a Mac, or Linux, you
#' should change the \code{os} argument.
#'
#' @name how_to_install_fonts
#'
#' @param os a character vector coinciding with the information you want, contingent
#' on your operating system. If \code{os} is "any" (the default), it returns a
#' generic message about how to install fonts. If \code{os} is "windows", "mac",
#' or "linux", you get more information about font installation on your operating
#' system.
#'
#' @return \code{how_to_install_fonts()} returns a message communicating how to
#' install fonts on the user's operating system.
#'
#' @author Steven V. Miller
#'
#' @examples
#'
#' how_to_install_fonts("windows")
#'
#' how_to_install_fonts("mac")

how_to_install_fonts <- function(os="any") {

  if(!(os %in% c("any", "windows", "mac", "linux"))) {
    stop("The 'check' argument only takes ''all'' for the time being. The extent of what it is checking is not so large or time-consuming to burden the user, at least I don't think.")
  }

  if (os == "any") {
    message(paste0("Open up the directory containing the fonts you want to install. You will see that these font files have an extension of something like '.ttf' or '.otf'. Then, do the following (contingent on whether you're a Windows user, a Mac user, or a Linux user.\n\n- Windows users: select all fonts you want to install. Right click, and select 'Install'.\n- Mac users: Double-click the font file and install in Font Book app.\n- Linux users: create a folder in your home directory called '.fonts' and copy-paste all the fonts you want into it. For you, this directory would be: ", paste0(Sys.getenv('HOME'),"/.fonts"),"\n\nAfter installing these fonts, check that your word processor can see them. Restart Rstudio if necessary and run something like example_plot() + theme_steve() to see if these fonts will render correctly."))

  } else if (os == "windows") {

    message(paste0("Open up the directory containing the fonts you want to install. You will see that these font files have an extension of something like '.ttf' or '.otf'. Then, select all the fonts you want to install in this directory. Right click, then select 'Install'. You may have to spam your way through a few permission overrides because Windows installs things at a system-level and can behave like it's paranoid about what you're installing. However, these are just simple font files. Communicate to Windows, ''Yes, I want to install these things because they are just simple fonts.''\n\nAfter installing these fonts, check that your word processor can see them. Restart Rstudio if necessary and run something like example_plot() + theme_steve() to see if these fonts will render correctly."))

  } else if (os == "mac") {
    message(paste0("Open up the directory containing the fonts you want to install. You will see that these font files have an extension of something like '.ttf' or '.otf'. Then, hit Cmd-Space and ask Mac to open the Font Book app. In the Font Book app, choose File > Add Fonts to Current User. In the directory containing the fonts you want to install, double-click the font file.\n\nMac users should have a few more options, all of which are doing the same basic thing. You can right-click on the font file(s) in question and ask to open it in Font Book (which should trigger an installation procedure). You can double-click the font file in Finder and click 'Install' in the dialog that appears. Either way, fonts in Mac are centrally managed through the Font Book app.\n\nAfter installing these fonts, check that your word processor can see them. Restart Rstudio if necessary and run something like example_plot() + theme_steve() to see if these fonts will render correctly."))

  } else if (os == "linux") {

    message(paste0("Because you are among the proud, the few, the elite---the Linux user---you probably know how to do this already. Linux users self-select into being Linux users. However, I'll write it out for you anyway just in case.\n\nOpen up the directory containing the fonts you want to install. You will see that these font files have an extension of something like '.ttf' or '.otf'.\n\nNow, go to your home directory in another tab in your file browser. For you, this directory would be: ",paste0(Sys.getenv('HOME')),". Create a directory in your user home directory called '.fonts'. The leading dot in '.fonts' is important because this is a kind of 'hidden' directory that will become immediately invisible once you create it. However, it's there. Once you create it, press Ctrl+H to reveal hidden directories in the home directory and you'll see it. Once you see it, open it. Move all the font files you want into this directory (", paste0(Sys.getenv('HOME'),"/.fonts"),"). Easy as that. That's the installation procedure.\n\nAfter creating this directory and moving the font files into that directory, check that your word processor can see them. Restart Rstudio if necessary and run something like example_plot() + theme_steve() to see if these fonts will render correctly."))
}

}

