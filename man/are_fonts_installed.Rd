% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/are_fonts_installed.R
\name{are_fonts_installed}
\alias{are_fonts_installed}
\title{Check if you have the fonts you need already installed on your computer}
\usage{
are_fonts_installed(check = "all")
}
\arguments{
\item{check}{a character vector coinciding with the font or fonts you want to
check. Defaults to "all", which will check for all of "Open Sans", "Titillium Web",
"Fira Sans", "Crimson Pro", and "Merriweather".}
}
\value{
\code{are_fonts_installed()} returns a message communicating whether
the \pkg{systemfonts} package in R can find the fonts used by \pkg{stevethemes}
on the user's operating system. It also returns some information about where
the user can download or obtain these fonts.
}
\description{
\code{are_fonts_installed()} leans on \pkg{systemfonts} to determine
if R can find the fonts that are used by the \pkg{stevethemes} package.
}
\details{
Future functionality will allow you to supply more than "all", but
"all" is the only argument for the function that will work for the moment.
}
\examples{

are_fonts_installed()
}
\author{
Steven V. Miller
}
