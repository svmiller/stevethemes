#' Convert RGB values to a HEX color
#'
#' Converts red, green, and blue (RGB) color values into a six-digit hex triplet.
#'
#' @param r a numeric for red channel intensity, between 0 and 255.
#' @param g a numeric for green channel intensity, between 0 and 255.
#' @param b a numeric for blue channel intensity, between 0 and 255.
#'
#' @return A character string containing a six-digit hex triplet in the format
#' `#RRGGBB`.
#'
#' @details RGB values are specified using the 8-bit RGB color model, in which
#' each channel ranges from 0 (no intensity) to 255 (maximum intensity). Values
#' must be whole numbers, although they may be supplied as either integers or
#' numeric values.
#'
#' @md
#' @examples
#' rgb2hex(0, 47, 95)
#' rgb2hex(196, 232, 237)
#' rgb2hex(255, 255, 255)
#'
#' @export

rgb2hex <- function(r,g,b) {

  validrgb <- function(x) {
    is.numeric(x) && length(x) == 1L && is.null(dim(x)) &&
      is.finite(x) &&  x == floor(x) && x >= 0 && x <= 255
  }

  if (!all(vapply(list(r, g, b), validrgb, logical(1)))) {
    stop("r, g, and b must be whole numbers between 0 and 255",
         call. = FALSE)
  }



  x <- sprintf("#%02X%02X%02X", r, g, b)
  return(x)

}





# data.frame(a = 0:15,
#            b = c(0:9,"A", "B","C","D","E","F")) -> AA
#
#
# rval <- r
# rs1 <- floor(rval/16)
# rs2 <- rval - (16*rs1)
#
# rp1 <- AA[AA$a == rs1, "b"]
# rp2 <- AA[AA$a == rs2, "b"]
#
# gval <- g
# gs1 <- floor(gval/16)
# gs2 <- gval - (16*gs1)
#
# gp1 <- AA[AA$a == gs1, "b"]
# gp2 <- AA[AA$a == gs2, "b"]
#
# bval <- b
# bs1 <- floor(bval/16)
# bs2 <- bval - (16*bs1)
#
# bp1 <- AA[AA$a == bs1, "b"]
# bp2 <- AA[AA$a == bs2, "b"]
#
# x <- paste0("#",rp1,rp2,gp1,gp2,bp1,bp2)
# AA
# floor(95/16)
# 95-(16*5)
#
#
# rgb2hex(172, 222, 230)


