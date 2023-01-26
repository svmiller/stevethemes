#' Create an example plot (in \pkg{ggplot2}) for experimenting with different styles
#'
#' @description \code{example_plot()} allows you to experiment with some
#' \pkg{ggplot2} themes, like those in this package, by seeing them applied to
#' some example plots.
#'
#' @details I'll add more here in a little bit.
#'
#' @name example_plot
#'
#' @param type a type
#'
#' @return \code{example_plot()} returns a plot made in \pkg{ggplot2}, allowing
#' the user to experiment with different themes to their hearts content.
#'
#' @author Steven V. Miller
#'
#' @examples
#'
#' library(ggplot2)
#'
#' example_plot()
#'
#' example_plot(type = "faceted_line")
#'
example_plot <- function(type = "bar") {

  if(type == "bar") {
    ggplot(martel_ratings, aes(as.factor(value))) +
      labs(title = "A Bar Chart of Cagematch Ratings for Rick Martel",
           x = "Rating on 1-10 Scale", y ="Count",
           caption = "Data: Cagematch, the Internet Wrestling Database. Data are for illustration purposes, though Rick Martel is an objective 10/10.",
           subtitle = "This is just a simple bar chart. Experiment with customization options!") +
      geom_bar(fill=g_c("martel_eau"), alpha=.9, color='black')

  } else if (type == "faceted_line") {

    ggplot(se_counties_gdppc, aes(year, value)) +
      geom_line() +
      facet_wrap(~county) +
      labs(title = "The GDP per Capita of Swedish Counties, 2001-2020",
           subtitle = "This is just a simple faceted line chart. Experiment with customization options!",
           y = "GDP per Capita (Nominal SEK)",
           x = "Year",
           caption = "Data: OECD")


  }

}




