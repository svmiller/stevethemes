#' Miscellaneous functions to make your \pkg{ggplot2} plot "print-ready"
#'
#' @description These are assorted functions that will make your plot
#' "print-ready". These are context-dependent adjustments for things like ticks,
#' gridlines, and axes.
#'
#' @details
#'
#' `no_gridlines()` is a simple wrapper for some basic \pkg{ggplot2} code that
#' will allow you to remove gridlines from the plot.
#'
#' `make_classic()` removes gridlines, removes the default gray background,
#' *and* imposes a black, solid line on both axes. It will also hard code the
#' axis text to be black. Using the latter with the former is likely redundant.
#'
#' `no_axes()` removes the x- and y-axis from the plot. You'll want this for
#' making maps, unless it's really pertinent that the user knows the latitude
#' and longitude coordinates on the y- and x-axis.
#'
#' You will want to put these functions after a theme you've declared. If
#' you run this before adding a theme over it, the theme you add will probably
#' overwrite this function.
#'
#' @param ... called for side effects
#'
#' @return
#'
#' `no_gridlines()` takes a plot made in \pkg{ggplot2} and removes
#' the gridlines from the plot before returning it to the user.
#'
#' `make_classic()` takes a plot made in \pkg{ggplot2} and removes the
#' gridlines, gray background, and adds solid axes to the plot.
#'
#' `no_axes()` removes the x- and y-axes. Use it for making maps because your
#' audience won't care about the longitude and latitude coordinates that make
#' the map.
#'
#' @author Steven V. Miller
#'
#' @examples
#'
#' library(ggplot2)
#'
#' example_plot(type = "scatter")
#'
#' example_plot(type='scatter') + no_gridlines()
#'
#' example_plot(type='scatter') + make_classic()
#'
#' example_plot("map") + no_axes()
#'

#' @rdname print-ready
#' @md
#' @export
#'
no_gridlines <- function(...) {

  theme(panel.grid.major = element_blank(),
        panel.grid.minor = element_blank()) -> p

  return(p)
}

#' @rdname print-ready
#' @export
#'
make_classic <- function(...) {

  theme(panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        panel.background = element_blank(),
        axis.text.x = element_text(color="black"),
        axis.text.y = element_text(color="black"),
        axis.line = element_line(color = "black")) -> p

  return(p)
}

#' @rdname print-ready
#' @export
#'
no_axes <- function(...) {

  theme(axis.title = element_blank(),
        axis.text  = element_blank(),
        axis.line = element_blank(),
        axis.ticks = element_blank()) -> p

  return(p)
}




