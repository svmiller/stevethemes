#' Load a palette in `scale_*_manual()`
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
#' Color palettes available are "d-suFB", "d-suBF", "d-suBR","d-suRB", "d-suBO",
#' "d-suOB", "d-suFW", "d-suWF", "s-suB", "s-suF", "s-suO", "s-suR", "q-supair",
#' "q-OI", "q-google", "q-ibm", "q-wong", "q-tol", "q-sciencespo", and "q-martel".
#'
#' The `n` argument must be specified for sequential palettes and really should
#' be specified for diverging palettes. If not, diverging palettes run the risk
#' of being indistinguishable from sequential palettes.
#'
#' # Description of Color Palettes
#'
#' | **Name** | **Description** |
#' |:-----------:|:----------------|
#' | `d-suFB` | diverging palette, ranging from Stockholm University "Fire" to Stockholm University "Blue" |
#' | `d-suBF` | diverging palette, ranging from Stockholm University "Blue" to Stockholm University "Fire" |
#' | `d-suBR` | diverging palette, ranging from Stockholm University "Blue" to Stockholm University "Red" |
#' | `d-suRB` | diverging palette, ranging from Stockholm University "Red" to Stockholm University "Blue" |
#' | `d-suBO` | diverging palette, ranging from Stockholm University "Blue" to Stockholm University "Olive" |
#' | `d-suOB` | diverging palette, ranging from Stockholm University "Olive" to Stockholm University "Blue" |
#' | `d-suFW` | diverging palette, ranging from Stockholm University "Fire" to Stockholm University "Water" |
#' | `d-suWF` | diverging palette, ranging from Stockholm University "Water" to Stockholm University "Fire" |
#' | `s-suB`  | sequential palette, in shades of Stockholm University "Blue" |
#' | `s-suF`  | sequential palette, in shades of Stockholm University "Fire" |
#' | `s-suO`  | sequential palette, in shades of Stockholm University "Olive" |
#' | `s-suR`  | sequential palette, in shades of Stockholm University "Red" |
#' | `q-supair`  | qualitative palette, using colors pairs of Stockholm University's template |
#' | `q-OI`  | qualitative palette, Okabe-Ito |
#' | `q-google`  | qualitative palette, using Google colors |
#' | `q-ibm`  | qualitative palette, using IBM Design Colorblind Safe Palette |
#' | `q-wong`  | qualitative palette, using Wong Colorblind Safe Palette |
#' | `q-tol`  | qualitative palette, using Paul Tol's Qualitative Palette |
#' | `q-sciencespo`  | qualitative palette, using Sciences-Po's Medialab (hard, force vector) |
#' | `q-dataroots` | qualitative palette, paired, using Dataroots' colors |
#' | `q-martel`  | qualitative palette, using a palette of colors inspired by Rick Martel |
#'
#'
#' @name spal
#'
#' @param palette a label coinciding with a value in the \code{color} column of the
#' \code{steve_hex} data frame
#' @param n a mostly optional argument for how many colors you want. Defaults to `NULL`.
#' @param even logical, defaults to TRUE, used internally for diverging palettes.
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
#' spal("q-martel")
#' spal("d-suBO")
#' spal("s-suB", n = 5)
#'
#' @importFrom grDevices col2rgb rgb
#' @md
#' @export

spal <- function(palette, n = NULL, even = TRUE, d.mid = "white") {

  # d: diverging, s: sequential, q: qualitative
  ### B: blue
  ### O: olive
  ### F: fire
  ### R: red
  ### S: sky
  ### W: water

  dmid <- d.mid

  PALETTES <- c("d-suFB", "d-suBF", "d-suBR","d-suRB",
                "d-suBO", "d-suOB", "d-suFW", "d-suWF",
                "s-suB", "s-suO", "s-suR", "s-suF",
                "q-supair", "q-OI", "q-google", "q-ibm", "q-wong", "q-tol",
                "q-martel", "q-sciencespo", "q-dataroots")

  if(!palette %in% PALETTES) {

    stop("Palette not recognized. Please inspect codebook for spal() to see what palettes are available.")
  }

  pal.type <- substr(palette, 1, 1)

  if(pal.type == "s" & is.null(n)) {
    stop("Sequential palettes require the n argument to be specified.")
  }

  dispatch <- list(
    d = .pal_diverging,
    s = .pal_sequential,
    q = .pal_qual
  )

  x <- dispatch[[pal.type]](palette, n, even, dmid)

  return(x)
}

# #' @keywords internal
# #' @noRd

.pal_diverging <- function(palette, n = NULL, even = TRUE, dmid) {

  if(!is.null(n) && n > 9) {
    stop("I don't think these diverging palettes can handle more than nine unique colors.")
  }

  if(dmid == "white") {
    midcol <- "#ffffff"
  } else { # You're on your own here for a valid HEX color...

    midcol <- dmid

  }

  COLORS <- c(B = g_c("su_blue"),
              F = g_c("su_fire"),
              O = g_c("su_olive"),
              R = g_c("su_red"),
              S = g_c("su_sky"),
              W = g_c("su_water"))

  left <- substr(palette, 5, 5)
  right <- substr(palette, 6, 6)
  cleft <- unname(COLORS[left])
  cright <- unname(COLORS[right])

  x <- c(cleft, lighten_hex(cleft, .75), lighten_hex(cleft, .35), lighten_hex(cleft, .2),
          midcol, lighten_hex(cright, .2), lighten_hex(cright, .35),
          lighten_hex(cright, .75), cright)

    if(!is.null(n)){
      if(even & n < length(x)){
        x<-x[round(seq.int(1, length(x), length.out = n))]
      } else {
        x<-rep(x, length.out = n)
      }
    }

  x

}

# #' @keywords internal
# #' @noRd

.pal_sequential <- function(palette, n, even = TRUE, dmid) {

  if(!is.null(n) && n > 9) {
    stop("I don't think these sequential palettes can handle more than nine unique colors.")
  }

  COLORS <- c(B = g_c("su_blue"),
              F = g_c("su_fire"),
              O = g_c("su_olive"),
              R = g_c("su_red"),
              S = g_c("su_sky"),
              W = g_c("su_water"))

  cc <- substr(palette, 5, 5)
  cc <- unname(COLORS[cc])

  x <- cc


    for(i in seq(1, 1/n, length.out = n)[-1]) {
      x <- c(x, lighten_hex(cc, i))
    }

  x

}

# #' @keywords internal
# #' @noRd

.pal_qual <- function(palette, n = NULL, even, dmid) {

  qq <- substr(palette, 3, nchar(palette))

  # I'm trying here...
  # https://rgblind.com/color-blind-color-pair-checker

  if(qq == "supair") {
    x <- c(g_c("su_blue"), lighten_hex(g_c("su_blue"), .75),
           g_c("su_olive"), g_c("su_olive70"),
           g_c("su_darkgrey"), g_c("su_mediumgrey"),
           g_c("su_fire"), g_c("su_fire70"),
           g_c("su_red"), g_c("su_red10"))

  } else if (qq == "OI") {

    x <- c("#E69F00", "#56B4E9", "#009E73", "#F0E442",
           "#0072B2", "#D55E00", "#CC79A7", "#000000")

  } else if (qq == "google") {

    # dput(artyfarty::pal("google"))

    x <- c("#3366CC", "#DC3912", "#FF9900", "#109618", "#990099", "#0099C6",
           "#DD4477", "#66AA00", "#B82E2E", "#316395")

  } else if (qq == "sciencespo") {

    # https://medialab.github.io/iwanthue/

    x <- c("#3d114d", "#75d966", "#316ee5", "#b83d0e", "#eca0ff",
           "#ade297", "#ff7d89", "#ff9e67", "#a44a54")

  } else if (qq == "ibm") {

    # https://rgblind.com/blog/color-blindness-friendly-chart-colors

    x <- c("#648FFF", "#785EF0", "#DC267F", "#FE6100", "#FFB000")

  } else if (qq == "wong") {

    # dput(clipr::read_clip())
    # https://rgblind.com/blog/color-blindness-friendly-chart-colors

    x <- c("#000000", "#E69F00", "#56B4E9", "#009E73", "#F0E442", "#0072B2",
           "#D55E00", "#CC79A7")

  } else if (qq == "tol") {

    x <- c("#332288", "#88CCEE", "#44AA99", "#117733", "#999933", "#DDCC77",
           "#CC6677", "#AA4499")

  } else if (qq == "martel") {

    x <- c(g_c("martel_pink"), g_c("martel_purple"), g_c("martel_eau"),
           g_c("martel_red"), "#000000")

  } else if (qq == "dataroots") {

    x <- c("#52BE7F", "#27ae60", "#3498db", "#2980b9", "#34495e", "#2c3e50")

  }


}


# par(mfrow = c(4, 1), mar = c(1, 1, 2, 1))
# scales::show_col(x)
# scales::show_col(colorspace::protan(x))
# scales::show_col(colorspace::deutan(x))
# scales::show_col(colorspace::tritan(x))

#
# pal <- function(name, n = NULL, evenly_spaced = TRUE) {
#
#   if(name %in% rownames(RColorBrewer::brewer.pal.info)){
#     p <- RColorBrewer::brewer.pal(
#       RColorBrewer::brewer.pal.info[rownames(RColorBrewer::brewer.pal.info) == name, "maxcolors"],
#       name)
#
#     return(p)
#   }
#
#   if(!name %in% names(PALETTES))
#     stop(paste0("Requested palette '", name, "' not found"))
#
#   p<-PALETTES[[name]]$colors
#
#
#   if(!is.null(n)){
#     if(evenly_spaced & n < length(p)){
#       p<-p[round(seq.int(1, length(p), length.out = n))]
#     } else {
#       p<-rep(p, length.out = n)
#     }
#   }
#
#   p
# }



#
#
#   suF <- g_c("su_fire")
#   suB <- g_c("su_blue")
#   suO <- g_c("su_olive")
#   su_S <- g_c("su_sky") # grepl("\\bs", "sUFB")
#
#   x <- c(g_c("su_fire"))
#
#   for(i in seq(1, 1/4, length.out = 4)[-1]) {
#     x <- c(x, lighten_hex(g_c("su_fire"), i))
#   }
#
# c("#eb7125", "#F0945B", "#F8CDB2", "#FBE2D3")
#
#
#   x <- c(dsuF, lighten_hex(dsuF, .7), lighten_hex(dsuF, .35),
#          lighten_hex(dsuF, .2), g_c("su_lightgrey"),
#          lighten_hex(dsuB, .2), lighten_hex(dsuB, .35),
#          lighten_hex(dsuB, .7), dsuB)
#
#
#   if(!is.null(n)){
#     if(even & n < length(x)){
#       x<-x[round(seq.int(1, length(x), length.out = n))]
#     } else {
#       x<-rep(x, length.out = n)
#     }
#   }
