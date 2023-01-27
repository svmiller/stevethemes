#' Steve's Preferred \pkg{ggplot2} Themes and Assorted Stuff
#'
#' @description \code{theme_steve()} is my default theme framework for graphs I
#' make with \pkg{ggplot2}. It starts \code{theme_bw()}, which is available in
#' \pkg{ggplot2}, but adjusts the margins and axes a bit to my liking. The end
#' result is, I think, a lovely template for graphs I make in R.
#'
#' @param style various styles/adjustments to make to the base theme
#' @param ... optional stuff, though you don't need to think much about this.
#'
#' @details The best use of this function may involve the fonts you have installed
#' on your system. The user should experiment with various options to see what they
#' like.
#'
#' @examples
#'
#' library(ggplot2)
#'
#' example_plot() + theme_steve()
#'
theme_steve <- function(style="web",...) {
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
  }

  return(p)

}

