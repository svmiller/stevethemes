#' Get a Custom Color from \code{steve_hex}
#'
#' @description \code{g_c()} (i.e. *g*et *c*olor) is a simple function that
#' interfaces with the \code{steve_hex} data frame to return a hex value
#' associated with a named color.
#'
#' @details Check \code{steve_hex} in this same package for the custom colors
#' included
#'
#' @name g_c
#'
#' @param x a label coinciding with a value in the \code{color} column of the
#' \code{steve_hex} data frame
#'
#' @return \code{g_c()} returns a character vector, in particular, a hex triplet
#' that coincides with the label supplied in the function. Use it for specifying
#' a custom fill or color in a plot.
#'
#' @author Steven V. Miller
#'
#' @examples
#'
#' g_c("su_blue")
#'
#' g_c("martel_pink")

g_c <- function(x) {
  as.character(steve_hex[which(steve_hex$color == x),][2])
  #as.character(subset(steve_hex, .data$color == x)[2])
}

