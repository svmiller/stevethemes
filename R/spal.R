#' Load a palette as a character vector
#'
#' @description
#'
#' `spal()` is a derivation of a palette-loading function in an R package
#' I used to use quite regularly. Its intended use is interacting with
#' \pkg{ggplot2} functions like `scale_fill_manual()` and
#' `scale_color_manual()` (in particular, the `values` argument). Herein, you
#' can change the default \pkg{ggplot2} colors used.
#'
#' @details
#'
#' Available palettes are listed in the `palettes` data set in this package. This
#' function consults that data set for the identity of the palettes that this
#' function creates.
#'
#' The `n` argument must be specified for sequential palettes and really should
#' be specified for diverging palettes. If not, diverging palettes run the risk
#' of being indistinguishable from sequential palettes.
#'
#' Exponential decays are mostly experimental. I don't even know how much I would
#' use this function. Use as you see fit. Exponential decays are min-max transformed
#' to start at 1 and end at 1/n before applying the whitening factor to `lighten_hex()`.
#'
#' # Description of Color Palettes
#'
#' ```{r, evel=T, echo=F, results='asis'}
#' palettes <- stevethemes::palettes
#' palettes$palette <- paste0("`", palettes$palette, "`")
#' palettes$description <- gsub(
#'   "([]\\[\\[])",
#'   "\\\\\\1",
#'   palettes$description
#' )
#' knitr::kable(palettes, escape = TRUE,
#'             align = c("cl"),
#'             col.names = c("**Palette Name**", "**Description**"))
#' #library(tinytable)
#' #tt(palettes, theme = 'empty') |>
#'   # style_tt(j = 1, monospace = TRUE, align = "c") |>
#'   # style_tt(i = 0, monospace = FALSE, bold = TRUE) |>
#'   # setNames(c("Palette Name", "Description")) |>
#'   # print("latex")
#' ```
#'
#' @name spal
#'
#' @param palette a label coinciding with a value in the \code{color} column of the
#' \code{steve_hex} data frame
#' @param n a mostly optional argument for how many colors you want. Defaults to `NULL`.
#' The maximum is 9, and even 9 is pushing it.
#' @param even logical, defaults to TRUE, used internally for diverging palettes.
#' @param d.mid a valid hex triplet coinciding with a color that should serve as the
#' middle color in a palette with an odd-numbered length. Applicable only to
#' diverging palettes. Default value here is `#f7f7f7`, a color slightly
#' off-white.
#' @param exp logical, defaults to FALSE, and applicable only to sequential
#' palettes. If FALSE, palettes whiten by consistent amount each time across
#' the range of colors (maximum: 9). If TRUE, palettes whiten as an exponential
#' decay factor.
#' @param lambda the parameter governing the rate of decay. Called only when
#' `exp` is TRUE. Higher values mean a faster rate of decay.
#'
#' @return \code{spal()} returns a character vector of hex triplets to use as a
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

spal <- function(palette, n = NULL, even = TRUE, d.mid = "#F7F7F7",
                 exp = FALSE, lambda = 1.25) {

  # d: diverging, s: sequential, q: qualitative
  ### B: blue
  ### O: olive
  ### F: fire
  ### R: red
  ### S: sky
  ### W: water

  dmid <- d.mid

  # PALETTES <- c("d-suFB", "d-suBF", "d-suBR","d-suRB",
  #               "d-suBO", "d-suOB", "d-suFW", "d-suWF",
  #               "s-suB", "s-suO", "s-suR", "s-suF", "s-suS", "s-suW",
  #               "q-supair", "q-OI", "q-google", "q-ibm", "q-wong", "q-tol",
  #               "q-martel", "q-sciencespo", "q-dataroots")

  PALETTES <- palettes$palette

  if(!palette %in% PALETTES) {

    stop("Palette not recognized. Please inspect codebook for spal() to see what palettes are available.")
  }

  pal.type <- substr(palette, 1, 1)

  if(pal.type == "s" & is.null(n)) {
    stop("Sequential palettes require the n argument to be specified.")
  }

  dispatch <- list(d = .pal_diverging,
                   s = .pal_sequential,
                   q = .pal_qual)

  x <- dispatch[[pal.type]](palette, n, even, dmid, exp, lambda)

  return(x)
}

# #' @keywords internal
# #' @noRd

.pal_diverging <- function(palette, n = NULL, even = TRUE, dmid, exp, lambda) {

  if(!is.null(n) && n > 9) {
    stop("I don't think these diverging palettes can handle more than nine unique colors. Even 9 might be pushing it.")
  }

  if(dmid != "#f7f7f7") { # You're on your own here for a valid HEX color...

    midcol <- dmid

  } else {

    midcol <- "#f7f7f7"

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

.pal_sequential <- function(palette, n, even = TRUE, dmid, exp, lambda) {

  if(!is.null(n) && n > 9) {
    stop("I don't think these sequential palettes can handle more than nine unique colors. Even 9 might be pushing it.")
  }

  COLORS <- c(B = g_c("su_blue"),
              F = g_c("su_fire"),
              O = g_c("su_olive"),
              R = g_c("su_red"),
              S = g_c("su_sky"),
              W = g_c("su_water"))

  cc <- substr(palette, 5, 5)
  cc <- unname(COLORS[cc])



  if(exp == FALSE) {

    x <- cc

    for(i in seq(1, 1/n, length.out = n)[-1]) {
      x <- c(x, lighten_hex(cc, i))
    }

  } else if (exp == TRUE) {

    nn <- n
    decay <- lambda

    t <- seq(0, 1, length.out = nn)

    v <- exp(-decay*t)
    d <- (1/n) + (((v - min(v))/(max(v) - min(v)))*(1 - (1/n)))

    # for(i in seq(1, 1/n, length.out = n)[-1]) {
    #   x <- c(x, lighten_hex(cc, i))
    # }

    x <- c()

    for(i in c(d)) {

      x <- c(x, lighten_hex(cc,i))

      }



    }

  x

}

# #' @keywords internal
# #' @noRd

.pal_qual <- function(palette, n = NULL, even, dmid, exp, lambda) {

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

  } else if (qq == "tolm") {

    x <- c("#332288", "#88CCEE", "#44AA99", "#117733", "#999933", "#DDCC77",
           "#CC6677", "#AA4499")

  } else if (qq == "martel") {

    x <- c(g_c("martel_pink"), g_c("martel_purple"), g_c("martel_eau"),
           g_c("martel_red"), "#000000") # #FFD700 is "gold"; #f7b539 is on QC's flag

  } else if (qq == "dataroots") {

    x <- c("#52BE7F", "#27ae60", "#3498db", "#2980b9", "#34495e", "#2c3e50")

  } else if (qq == "su70") {

    x <- c(lighten_hex(g_c("su_blue"), .7), g_c("su_fire70"), g_c("su_olive70"),
           g_c("su_water70"), g_c("su_sky70"))

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
