#' Create a Swatchplot of Palettes
#'
#' @description
#'
#' `swatchplot()` creates a plot of color swatches for the various palettes
#' included in this package.
#'
#' @details
#'
#' The palette argument must be NULL or one of the palettes included in this
#' package and listed in the `palettes` data frame in this package. If the
#' palette requested is a diverging or sequential palette, the swatchplot returns
#' all colors in the palette for a length of 2 to 9 (the maximum). If the palette
#' requested is qualitative, the swatchplot is all colors in the palette and their
#' position in it.
#'
#'
#' @name swatchplot
#'
#' @param palette must be NULL or one of the palettes included in this package.
#' If NULL (the default value), the swatchplot returns swatches for palettes.
#' @param style passed to `theme_steve()` in the construction of the plot. Defautls
#' to "generic" for testing purposes. Consult the documentation for `theme_steve()`
#' for more information.
#' @param font defaults to NULL and used only when the `style` argument is "custom".
#' Used for specifying the font of the user's choice that, one assumes, is available
#' on their computer.
#'
#' @author Steven V. Miller
#'
#' @return `swatchplot()` returns a plot of the colors available in a requested
#' palette, or all available palettes, as a \pkg{ggplot2} object.
#'
#'
#' @examples
#'
#' swatchplot()
#' swatchplot("d-suBF")
#' swatchplot("s-suO")
#' swatchplot("q-martel")
#'
#' @importFrom grDevices col2rgb rgb
#' @md
#' @export

swatchplot <- function(palette = NULL, style = "generic", font = NULL) {

  # PALETTES <- c("d-suFB", "d-suBF", "d-suBR","d-suRB",
  #               "d-suBO", "d-suOB", "d-suFW", "d-suWF",
  #               "s-suB", "s-suO", "s-suR", "s-suF", "s-suS", "s-suW",
  #               "q-supair", "q-OI", "q-google", "q-ibm", "q-wong", "q-tol",
  #               "q-martel", "q-sciencespo", "q-dataroots")

  PALETTES <- palettes$palette

  if(!is.null(palette) && !(palette %in% PALETTES)) {
    stop("The palette specified in the `palette` argument is not a valid palette in this package.")
  }

  # if palette = NULL
  if(is.null(palette)) {

    swatches <- do.call(rbind, lapply(PALETTES, function(p) {

      if(substr(p, 1, 1) == "s") {
        cols <- spal(p, n = 9)
      } else {
        cols <- spal(p)
      }

      data.frame(name = p, k = seq_along(cols), col  = cols)

    }))

    swatches$name <- factor(swatches$name, levels = unique(swatches$name))
    swatches$k <- as.factor(swatches$k)

    ggplot(swatches, aes(x = .data$k, y=.data$name, fill=col)) +
      geom_tile(color='black') +
      scale_fill_identity() +
      theme_steve(style = style, font= font) +
      labs(title = "Available Palettes in {stevethemes}",
           subtitle = "Hopefully you find something you like among the diverging (d-), sequential (s-), and qualitative (q-) palettes. If you don't, sorry. I tried. :/",
           x="Color", y="",
           caption = "Diverging palettes are all based around Stockholm University colors and have an absolute maximum of nine colors. The middle color, by default, is white. But, you can adjust this.
       Nine colors is ambitious for a diverging or sequential palette. It may not work in your particular use-case. This can be quite challenging.
       Gradient adjustments in diverging palettes are based around Stockholm University's blends of colors with white that retain 75%, 35%, or 20% of its base color.
       As always, ask what you're doing and why you're doing it.") +
      theme(legend.position='none',
            panel.background = element_rect(fill = "#ffffff")) +
      no_gridlines() -> x


  } else if(!is.null(palette) && substr(palette, 1, 1) %in% c("s","d")) {

    swatches <- do.call(rbind, lapply(2:9, function(i) {

      cols <- spal(palette, n = i)

      data.frame(name = palette,
                 n = i,
                 k = seq_along(cols),
                 col = cols)

    }))

    swatches$name <- factor(swatches$name, levels = unique(swatches$name))
    swatches$k <- as.factor(swatches$k)
    swatches$n <- as.factor(swatches$n)



    descr <- palettes[palettes$palette == palette,]$description
    plottitle <- paste0('A Swatchplot of a ', descr)

    ggplot(swatches, aes(x = as.factor(.data$k), y=as.factor(.data$n), fill=col)) +
      geom_tile(color='black') +
      scale_fill_identity() +
      theme_steve(style = style, font= font) +
      labs(title = plottitle,
           subtitle = "You can see how this palette whitens/transitions across the range of possible values.",
           x="Position", y="Possible Palette Lengths",
           caption = "Nine colors might be particularly ambitious for the sequential (and even diverging) palettes available in this package.") +
      theme(legend.position='none',
            panel.background = element_rect(fill = "#ffffff")) +
      no_gridlines() -> x

  }  else if(!is.null(palette) && substr(palette, 1, 1) %in% c("q")) {

    thepalpal <- spal(palette)
    nnn <- seq(1:length(thepalpal))

    data.frame(k = nnn,
               col = thepalpal) -> swatches

    swatches$k <- as.factor(swatches$k)
    # swatches$y <- c("y")
    swatches$y <- as.factor("y")
    swatches$lab <- paste0(swatches$col,"\n(",swatches$k,")")

    # plottitle <- paste0('A Swatchplot of "', palette, '"')
    descr <- palettes[palettes$palette == palette,]$description
    plottitle <- paste0('A Swatchplot of a ', descr)

    ggplot(swatches, aes(x = .data$k, y = .data$y, fill= .data$col)) + geom_tile(color='black') +
      theme_steve(style = style, font= font) +
      scale_fill_identity() +
      scale_x_discrete(labels = swatches$lab) +
      scale_y_discrete(labels = NULL) +
      labs(title= plottitle,
           subtitle = "Qualitative palettes presented in order in which color would appear in your plot, going left to right.",
           x = "Color", y = "") +
      theme(legend.position='none', axis.ticks.x = element_blank(),
            axis.ticks.y = element_blank(), axis.text.y = element_blank(),
            panel.background = element_rect(fill = "#ffffff")) -> x


  }

  return(x)


}
