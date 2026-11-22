#' Convert CMYK values to a HEX color
#'
#' Converts cyan, magenta, yellow, and black (CMYK) color values into
#' a six-digit hex triplet.
#'
#' @param c a numeric for cyan channel intensity, between 0 and 100.
#' @param m a numeric for magenta channel intensity, between 0 and 100.
#' @param y a numeric for yellow channel intensity, between 0 and 100.
#' @param k a numeric for black channel intensity, between 0 and 100.
#'
#' @return A character string containing a six-digit hex triplet in the format
#' `#RRGGBB`.
#'
#' @details CMYK values are expressed as percentages, ranging from 0 (no ink) to
#' 100 (maximum ink coverage). This function handles the conversion to proportions.
#'
#' Conversion to RGB format is performed using a simplified mathematical model,
#' in which the CMYK values are first converted to proportions between 0 and 1.
#' The resulting RGB values are calculated as ` R = 255(1-C)(1-K)`,
#' `G = 255(1-M)(1-K)`, and `B = 255(1-Y)(1-K)`.
#'
#' The resulting RGB values are rounded to the nearest integer before being
#'  converted to a hex triplet.
#'
#' This conversion is an approximation and does not account for printing
#' conditions, ink characteristics, paper properties, or ICC color profiles.
#' Consequently, the resulting hex triplet may differ from color-managed
#' CMYK-to-RGB conversions, particularly when CMYK values originate from
#' professional printing standards. If you are presented with a CMYK value and
#' an RGB value for the same branded color and want a hex triplet from it, use
#' `rgb2hex()` instead of this for obtaining the hex triplet.
#'
#' @examples
#' cmyk2hex(100, 69, 8, 54)
#' cmyk2hex(99, 51, 8, 36)
#' cmyk2hex(0, 0, 0, 0)
#'
#' @md
#' @export

cmyk2hex <- function(c, m, y, k) {

  validcmyk <- function(x) {
    is.numeric(x) &&  length(x) == 1L && is.null(dim(x)) &&
      is.finite(x) && x >= 0 && x <= 100
  }

  if (!all(vapply(list(c, m, y, k), validcmyk, logical(1)))) {
    stop("c, m, y, and k must be numeric values between 0 and 100. Proportions are calculated from it by this function.",
         call. = FALSE)
  }

  r <- round(255*(1-(c/100))*(1-(k/100)))
  g <- round(255*(1-(m/100))*(1-(k/100)))
  b <- round(255*(1-(y/100))*(1-(k/100)))

  x <- sprintf("#%02X%02X%02X", r, g, b)

  return(x)

}
