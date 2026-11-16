#' Color Vision Deficiency Simulation Tools
#'
#' @description
#'
#' These are various color vision deficiency simulation tools for evaluating
#' color palettes and how colorblind-friendly they are.
#'
#' @details
#'
#' These functions take valid hex triplets of any length *or* a character that
#' matches one of the palettes available in this package. Check the `palettes`
#' data frame for those.
#'
#' The functions simulate the palettes under *maximum* conditions of color vision
#' deficiency. Future extensions of these functions will likely allow the user
#' to specify the severity of color vision deficiency they want to simulate. For
#' now, the simulations assume the maximum severity of deuteranomaly, protanomaly,
#' and tritanomaly.
#'
#'
#' @param pal a character vector of valid hex triplets (with leading pound
#' signs) or a character of length 1 matching a palette name in the `palettes`
#' data frame
#'
#' @return
#'
#' `deut()` takes a palette from this package (or a character vector of valid
#' hex triplets) and returns their adjusted hex triplets under conditions of
#' deuteranomaly.
#'
#' `prot()` takes a palette from this package (or a character vector of valid
#' hex triplets) and returns their adjusted hex triplets under conditions of
#' protanomaly.
#'
#' `trit()` takes a palette from this package (or a character vector of valid
#' hex triplets) and returns their adjusted hex triplets under conditions of
#' tritanomaly.
#'
#' `cvdplot()` takes a palette from this package (or a character vector of valid
#' hex triplets) and returns a graph that juxtaposes the palette vis-a-vis what
#' they would look like under varying conditions of color vision deficiency
#' (deuteranomaly, protanomaly, and tritanomaly).
#'
#' @author Steven V. Miller
#'
#' @examples
#'
#' deut("q-martel")
#' prot("q-martel")
#' trit("q-martel")
#'
#' cvdplot("q-martel")
#'
#' @name cvd-simulator
#' @aliases cvdplot deut prot trit
#' @importFrom grDevices col2rgb rgb
#' @md



#' @rdname cvd-simulator
#' @export
deut <- function(pal) {
  x <- .simcvd(pal, .deutan)
  return(x)
}

#' @rdname cvd-simulator
#' @export
prot <- function(pal) {
  x <- .simcvd(pal, .protan)
  return(x)
}

#' @rdname cvd-simulator
#' @export
trit <- function(pal) {
  x <- .simcvd(pal, .tritan)
  return(x)
}

#' @rdname cvd-simulator
#' @export
cvdplot <- function(pal) {

  PALETTES <- palettes$palette

  if (length(pal) == 1 && pal %in% PALETTES) {

    i <- match(pal, palettes$palette)

    descr <- paste("A Simulation of a", palettes$description[i], "Under Color Vision Defiency")
    pal <- spal(pal)

  } else {
    descr <- "A Simulation of Your Palette Under Color Vision Deficiency"
  }

  pallen <- length(pal)

  dc <- deut(pal)
  pc <- prot(pal)
  tc <- trit(pal)

  paldata <- data.frame(name = "Original Palette",
                        value = pal,
                        y = as.factor(seq(1, pallen)))
  dcdata <- data.frame(name = "Deuteranomaly",
                       value = dc,
                       y = paldata$y)
  pcdata <- data.frame(name = "Protanomaly",
                       value = pc,
                       y = paldata$y)
  tcdata <- data.frame(name = "Tritanomaly",
                       value = tc,
                       y = paldata$y)

  rbind(paldata, dcdata, pcdata, tcdata) -> cvddat
  cvddat$name <- factor(cvddat$name, levels = rev(unique(cvddat$name)))

  ggplot(cvddat, aes(x = name, y = y, fill = value)) +
    geom_tile(width = .7, color='black') +
    scale_fill_identity() +
    coord_flip() +
    labs(title = descr, #"A Simulation of Your Palette Under Color Vision Deficiency"
         subtitle = "Use this information to potentially adjust your palette or consider another palette.",
         x = "",
         y = "") -> pp

  return(pp)
}


# https://www.inf.ufrgs.br/~oliveira/pubs_files/CVD_Simulation/CVD_Simulation.html
#' @keywords internal
#' @noRd
.deutan = matrix(c(0.367322,  0.860646, -0.227968,
                   0.280085,  0.672501,  0.047413,
                   -0.011820,  0.042940,  0.968881), 3, 3, byrow = TRUE)

#' @keywords internal
#' @noRd
.protan = matrix(c(0.152286,  1.052583, -0.204868,
                   0.114503,  0.786281,  0.099216,
                   -0.003882, -0.048116,  1.051998), 3, 3, byrow = TRUE)

#' @keywords internal
#' @noRd
.tritan = matrix(c(1.255528, -0.076749, -0.178779,
                   -0.078411,  0.930809,  0.147602,
                   0.004733,  0.691367,  0.303900), 3, 3, byrow = TRUE)

#' @keywords internal
#' @noRd
.simcvd <- function(pal, transform) {

  PALETTES <- palettes$palette

  if(length(pal) == 1 && pal %in% PALETTES) {
    pal <- spal(pal)
  }

  RGB <- col2rgb(pal) # makes grDevices a dependency for this function

  x <- RGB/255

  # This is a difference from {colorspace}, which uses the older threshold of .03928.
  # Current threshold is .04045. See:
  # https://www.w3.org/WAI/WCAG22/Understanding/contrast-minimum.html
  RGB <- matrix(ifelse(x <= 0.04045, x/12.92,
                       ((x + 0.055)/1.055)^2.4), nrow = 3)*255

  RGB <- transform %*% RGB # Do *not* screw this up, Steve. This is the workhorse.

  # Bound the RGB values and convert back to sRGB
  RGB <- pmax(0, pmin(255, RGB))
  x <- RGB/255

  # For the reverse conversion, it's this value:
  # https://entropymine.com/imageworsener/srgbformula/
  RGB <- matrix(ifelse(x <= 0.0031308, 12.92*x,
                       1.055*x^(1/2.4) - 0.055), nrow = 3)*255

  # Rounding here is a judgment call, but it's standard for converting to hex triplets as I understand it.
  x <- grDevices::rgb(round(RGB[1, ]), round(RGB[2, ]), round(RGB[3, ]), maxColorValue = 255)

  return(x)

}


#cvdplot(spal("q-martel"))

# coll <- spal("q-martel")
# deut1 <- deut(coll)
# prot1 <- prot(coll)
# trit1 <- trit(coll)
#
# data.frame(name = "Original",
#            value = coll) %>%
#   bind_rows(., tibble(name = "Deut", value = deut1)) %>%
#   mutate(y = rep(1:5, 2)) %>%
#   mutate(y = as.factor(y)) %>%
#   ggplot(.,aes(name, y, fill=value)) +
#   geom_tile(width = .7) +
#   scale_fill_identity() +
#   coord_flip() +
#   theme_steve()
