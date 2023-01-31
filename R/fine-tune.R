#' Miscellaneous functions for fine-tuning \pkg{ggplot2} plots
#'
#' @description These are assorted functions that will fine-tune various things
#' in a \pkg{ggplot2} plot.
#'
#' @details  \code{adj_font_size()} is a simple wrapper for some basic
#' \pkg{ggplot2} code that will allow you to adjust the font size on the plot by
#' some number.
#'
#' Right now, \code{adj_font_size()} assumes you are using \code{theme_steve()}
#' because the font sizes initialized in the function are defaults from the theme.
#'
#' @param x a numeric vector that will adjust the size of all fonts on the plot. Can take decimals and negative numbers.
#' @param ... optional, called for side effects
#'
#' @return \code{adj_font_size()} takes a plot made in \pkg{ggplot2} and changes
#' the font size by some number requested by the user. It returns a plot with
#' bigger or smaller fonts, per the user's request.
#'
#' @author Steven V. Miller
#'
#' @examples
#'
#' library(ggplot2)
#'
#' example_plot(type = "scatter") + adj_font_size(-2)
#'
#' example_plot(type = "scatter") + adj_font_size(2)
#'

#' @rdname fine-tune
#' @export
#'
adj_font_size <- function(x, ...) {

  theme(
        plot.caption = element_text(size = 9 + x),
        plot.title = element_text(size = 18 + x),
        plot.subtitle = element_text(size = 11 + x),
        axis.title.y = element_text(size = 10 + x),
        axis.title.x = element_text(size = 10 + x)) -> p

  return(p)
}
