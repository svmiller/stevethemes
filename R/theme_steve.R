#' Steve's Preferred \pkg{ggplot2} Theme
#'
#' @description \code{theme_steve()} is my default theme framework for graphs I
#' make with \pkg{ggplot2}. It starts \code{theme_bw()}, which is available in
#' \pkg{ggplot2}, but adjusts the margins and axes a bit to my liking. The end
#' result is, I think, a lovely template for graphs I make in R.
#'
#' @param style various styles/adjustments to make to the base theme. Must be
#' one of the following: "web" (default), "ms", "fira", "merri", "custom", or
#' "generic". The "custom" style is a fancy way of saying "supply your own
#' fonts". Where "custom" is used in this argument, something must be supplied
#' to the font argument in this same function.
#' @param font a character vector corresponding with a font that the user ideally
#' has installed on their operating system.
#' @param ... optional, called for side effects
#'
#' @details
#'
#' The best use of this function may involve the fonts you have installed on
#' your system. The user should experiment with various options to see what they
#' like. The "generic" style will use default \pkg{ggplot2} fonts and is invoked
#' here in this simple function for CRAN testing requirements. The default is
#' "web", which depends on having Open Sans and Titillium Web on the operating
#' system. You will see these two fonts everywhere on my website and most of my
#' R package websites.
#'
#' For greater clarity, the user should understand "ms" is code for the Crimson
#' Pro font, which resembles the "cochineal" font family in the LaTeX font
#' catalogue. "cochineal" is a fork of the Crimson font and its use is heavily
#' implied by my preferred article template (`article2`) in \pkg{stevetemplates}.
#'
#' "fira" is shorthand for "Fira Sans". "merri" is shorthand for "Merriweather".
#' The former features prominently in Firefox as well as my current operating
#' system (Pop! OS). The latter incorporates the Merriweather font, which is a
#' close cousin of the Palatino font. Palatino is the implied default font of
#' my first article template (`article`) in \pkg{stevetemplates}.
#'
#' @return No return value. Function is used for its side effect, which is to
#' format a plot made in the \pkg{ggplot2} package.
#'
#' @examples
#' library(ggplot2)
#'
#' # Experiment with options, those this depends on fonts you have installed.
#' example_plot() + theme_steve(style='generic')
#'
theme_steve <- function(style="web", font, ...) {

  if(!(style %in% c("web", "fira", "ms", "generic", "merri", "custom"))) {
    stop("This is not a recognized style in this function.")
  }

  theme_bw() +
    theme(panel.border = element_blank(),
          plot.margin = ggplot2::margin(15, 15, 15, 15),
          plot.caption = element_text(hjust = 1, size = 9,
                                      margin = ggplot2::margin(t = 10),
                                      face = "italic"),
          plot.title = element_text(hjust = 0, size = 18,
                                    margin = ggplot2::margin(b = 10),
                                    face = "bold"),
          plot.subtitle = element_text(hjust = 0,
                                       margin = ggplot2::margin(b = 10)),
          axis.title.y = element_text(size = 10, hjust = 1,
                                      face = "italic"),
          axis.title.x = element_text(hjust = 1, size = 10, face = "italic",
                                      margin = ggplot2::margin(t = 10)),
          legend.position = "bottom",
          legend.title = element_text(face = "bold")) +
    theme(legend.spacing.x = unit(.1, "cm"),
          panel.spacing = grid::unit(1.5, "lines")) -> p

  if(style == "web") {
    p +
      theme(plot.title = element_text(family = "Titillium Web"),
            legend.title = element_text(family = "Titillium Web"),
            plot.subtitle = element_text(family = "Open Sans"),
            axis.title.y = element_text(family = "Open Sans"),
            axis.title.x = element_text(family = "Open Sans"),
            text = element_text(family = "Open Sans")) -> p
  } else if(style == "ms") {
    p +
      theme(plot.title = element_text(family = "Crimson Pro"),
            legend.title = element_text(family = "Crimson Pro"),
            plot.subtitle = element_text(family = "Crimson Pro"),
            axis.title.y = element_text(family = "Crimson Pro"),
            axis.title.x = element_text(family = "Crimson Pro"),
            text = element_text(family = "Crimson Pro")) -> p

  } else if(style == "fira") {
    p +
      theme(plot.title = element_text(family = "Fira Sans"),
            legend.title = element_text(family = "Fira Sans"),
            plot.subtitle = element_text(family = "Fira Sans"),
            axis.title.y = element_text(family = "Fira Sans"),
            axis.title.x = element_text(family = "Fira Sans"),
            text = element_text(family = "Fira Sans")) -> p

  } else if(style == "generic") {

  } else if(style == "merri") {

    p +
      theme(plot.title = element_text(family = "Merriweather"),
            legend.title = element_text(family = "Merriweather"),
            plot.subtitle = element_text(family = "Merriweather"),
            axis.title.y = element_text(family = "Merriweather"),
            axis.title.x = element_text(family = "Merriweather"),
            text = element_text(family = "Merriweather")) -> p


  } else if(style == "custom") {

    if(missing(font)) {
      stop("style == 'custom' means a font argument must be specified")
    } else {

    p +
      theme(plot.title = element_text(family = font),
            legend.title = element_text(family = font),
            plot.subtitle = element_text(family = font),
            axis.title.y = element_text(family = font),
            axis.title.x = element_text(family = font),
            text = element_text(family = font)) -> p
    }
  }

  return(p)

}

