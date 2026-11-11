#' Create a Swatchplot of Palettes
#'
#' @description
#'
#' \code{spal()} is a derivation of a palette-loading function in an R package
#' I used to use quite regularly. Its intended use is interacting with
#' \pkg{ggplot2} functions like \code{scale_fill_manual} and
#' \code{scale_color_manual} (in particular, the `values` argument). Herein, you
#' can change the default \pkg{ggplot2} colors used.
#'
#' @details
#'
#' dsfdsfs
#'
#'
#' @name swatchplot
#'
#' @param palette a label coinciding with a value in the \code{color} column of the
#' \code{steve_hex} data frame
#' @param n a mostly optional argument for how many colors you want. Defaults to `NULL`.
#' @param even logical, defaults to TRUE, used internally for diverging palettes.
#' @param d.mid a valid hex code coinciding with a color that should serve as the
#' middle color in a palette whose length is an odd number. Applicable only to
#' diverging palettes. Default value here is "white" (`#FFFFFF`). I'll be honest
#' that I'm thinking of changing this to `#F7F7F7`.
#'
#' @return \code{spal()} returns a character vector of hex codes to use as a
#' palette in manually supplying colors to adjust the fill or color of a plot
#' made by \pkg{ggplot2}.
#'
#' @author Steven V. Miller
#'
#'
#' @examples
#'
#' swatchplot(style = 'custom', font='Arial Narrow')
#' swatchplot("q-martel", "web")
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

    ggplot(swatches, aes(x = k, y=name, fill=col)) +
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

    ggplot(swatches, aes(x = as.factor(k), y=as.factor(n), fill=col)) +
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

    ggplot(swatches, aes(x = k, y = y, fill= col)) + geom_tile(color='black') +
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
