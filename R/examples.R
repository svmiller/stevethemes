#' Create an example plot (in \pkg{ggplot2}) for experimenting with different styles
#'
#' @description \code{example_plot()} allows you to experiment with some
#' \pkg{ggplot2} themes, like those in this package, by seeing them applied to
#' some example plots.
#'
#' @details
#'
#' Valid entries for 'type' are "bar" (alias: "martel"), "brandy", "britney",
#' "faceted-boxplot", "faceted-line", "line" (alias: "imfquotas"), "scatter",
#' and "stacked-bar".
#'
#' @name example_plot
#'
#' @param type a type
#' @param alpha defaults to 1 and passed through to example plots (e.g. "britney")
#' where there is use of the fill argument. Values less than 1 induce transparency
#' to the fill.
#' @param color defaults to NULL and passed through to example plots (e.g. "scatter")
#' where there is use of the color argument. Specifies the color of the color.
#' Default is "#002f5f" ("SU Blue")
#' @param fill defaults to NULL and passed through to example plots (e.g. "britney")
#' where there is use of the fill argument. Specifies the color of the fill.
#' Default is "#9bb2ce" ("SU Water")
#' @param family defaults to NULL and passed through to example plots (e.g.
#' "britney" where there is a text annotation). Specifies the font you want for
#' the annotation. Default is the use of the default graphics-device font.
#'
#' @return \code{example_plot()} returns a plot made in \pkg{ggplot2}, allowing
#' the user to experiment with different themes to see which ones they like the
#' best.
#'
#' @author Steven V. Miller
#'
#' @examples
#'
#' library(ggplot2)
#'
#' example_plot()
#'
example_plot <- function(type = "bar", alpha = 1, color = NULL, fill = NULL, family = NULL) {

  if(is.null(fill)) {

    fill <- g_c("su_water")

  }

  if(is.null(color)) {

    color <- g_c("su_blue")

  }

  if(type %in% c("bar", "martel")) {
    ggplot(martel_ratings, aes(as.factor(.data$value))) +
      labs(title = "A Bar Chart of CAGEMATCH Ratings for Rick Martel",
           x = "Rating on 1-10 Scale", y ="Count",
           caption = "Data: CAGEMATCH, the Internet Wrestling Database. Data are for illustration purposes, though Rick Martel is an objective 10/10.",
           subtitle = "This is just a simple bar chart. Experiment with customization options!") +
      geom_bar(fill=fill, alpha=alpha, color='black') -> p

  } else if (type == "faceted-line") {

    ggplot(se_counties_gdppc, aes(.data$year, .data$value)) +
      geom_line() +
      facet_wrap(~county) +
      labs(title = "The GDP per Capita of Swedish Counties, 2001-2020",
           subtitle = "This is just a simple faceted line chart. Experiment with customization options!",
           y = "GDP per Capita (Nominal SEK)",
           x = "Year",
           caption = "Data: OECD") -> p


  } else if (type == "scatter") {
    ggplot(kwh_gdp, aes(.data$ln_kwhpc, .data$ln_gdppc)) +
      geom_smooth(method='lm', color=color, fill=fill) +
      geom_point(alpha=.8) +
      labs(title = "Energy Consumption per Capita and GDP per Capita, 2010",
           subtitle = "This is just a simple scatterplot. Experiment with customization options!",
           y = "GDP per Capita (Current USD, Logged)",
           x = "Kilowatt Hours per Capita (Logged)",
           caption = "Data: World Bank, OECD, and International Energy Agency") -> p

  } else if (type == "stacked-bar") {

    ggplot(cowwaryears, aes(x = .data$year, y = .data$n, fill = .data$cat)) +
      geom_bar(stat = 'identity', color='black') +
      scale_x_continuous(breaks = seq(1820, 2010, by = 10)) +
      #guides(fill = "none")  +
      labs(fill = "", y = "Number of Wars in a Given Year", x = "",
           title = "A Stacked Bar Chart of Wars by Type, 1816-2007",
           subtitle = "This is just a simple bar chart Experiment with customization options!") -> p



  } else if (type == "britney") {

    ggplot(britneywork ,aes(.data$date, .data$value)) +
      geom_ribbon(aes(ymin=-Inf, ymax=.data$value),
                  alpha=alpha, fill=fill) +
      geom_line(linewidth=1.1) +
      scale_x_date(date_breaks = "1 year",
                   date_labels = "%Y",
                   minor_breaks = "1 month") +
      geom_vline(xintercept = as.Date("2013-09-17"),
                 linetype = "dashed") +
      annotate("text",
               x = as.Date("2014-06-01"), y = 7.5,
               hjust = 0.5,
               family = if (is.null(family)) "" else family,
               label = 'Britney Spears releases "Work B***h"\n(Sept. 17, 2013)') +
      labs(title = "The Effect of Britney Spears on the Civilian Unemployment Rate, 2013-2018",
           subtitle = "This is just a simple line chart demonstrating how Britney Spears decreased the unemployment rate by 47.2%. Experiment with customization options!", x = "Date",
           y = "Civilian Unemployment Rate",
           caption = "Data: U.S. Bureau of Labor Statistics. CRAN will for sure not let me print the full name of this song.\nIf in 2018 Donald Trump could take credit for this clear multi-year downward turn in the civilian unemployment rate prior to his election, then why not Britney Spears?") -> p

  } else if (type == "brandy") {

    ggplot(brandy, aes(.data$year, .data$n)) +
      geom_ribbon(aes(ymin=-Inf, ymax=.data$n), alpha = alpha, fill = fill) +
      geom_line(linewidth = 1.1) +
      geom_vline(xintercept = 1972.5, linetype = "dashed") +
      scale_x_continuous(breaks = seq(1940, 2020, by = 10)) +
      annotate("text", x = 1972, y = 6000,
               hjust = "right",
               label = "Looking Glass releases ''Brandy (You're a Fine Girl)''\n(May 18, 1972)",
               family= if (is.null(family)) "" else family) +
      labs(y = 'The Number of Female Births Named "Brandy"', x = "",
           title = 'The Number of "Brandy" Births, 1942-2017',
           subtitle = "This is just a simple line chart (you're a fine girl). Experiment with customization options (such a fine girl)...",
           caption = '...but my life, my love, and my lady, is the sea (Do do do do do do do do). Seriously, "Brandy" increased 195.73% from 1971 to 1972.
       Data: Social Security Administration (via {babynames} in R).') -> p


  } else if (type == "faceted-boxplot") {

    ggplot(oilrents, aes(.data$orcat, .data$dgdppc, fill=.data$orcat)) +
      geom_boxplot(outliers = FALSE) +
      geom_hline(yintercept = 0, linetype = 'dashed') +
      facet_wrap(~.data$decade, scales="free_y") +
      labs(x = "Oil Rents % of GDP (Categorized)",
           title = "Oil Rents as a % of GDP and Annual GDP Growth, by Decade",
           subtitle = "This is just a simple faceted boxplot. Experiment with some customization options!",
           caption = "Data: World Bank Open Data Repository",
           y = "GDP per capita growth (annual %)",
           fill = "") -> p
  } else if (type %in% c("line", "imfquotas")) {

    ggplot(imfquotas, aes(.data$year, .data$prop, color=.data$cat, linetype=.data$cat)) +
      geom_line(linewidth=1.1) +
      labs(y = "Proportion of Quotas (SDRs)", x = "",
           title = "The Proportion of IMF Quotas for Select Actors/Groupings, 1945-2025",
           subtitle = "This is just a simple line chart. Experiment with customization options!",
           color = "", linetype = "",
           caption = "Data: International Monetary Fund, Fund Account") -> p

  }

  return(p)
}




