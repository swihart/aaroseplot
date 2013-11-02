#' Radius of a sector (circle wedge)
#'
#' \code{area2radius} is a function that will return the radius for a sector (circle wedge) of a given area and angle.
#'
#' @param area The number to be represented by the area of the wedge
#' @param w.g  The global width (as specified in the bar chart)
#' @param a    The total angle to be occupied
#' @param g    The total number of groups to be displayed within angle \code{a}
#' @export
#' @examples
#' area2radius(pi/4, 1.0, 90, 1)
#' area2radius(pi/4, 0.5, 90, 1)
#' area2radius(pi/4, 1.0, 90, 2)
area2radius <- function(area, w.g=width.global, a=angle, g=groups){
	sub.angle <- (w.g * a)/g
	radius <- sqrt((2*area)/(sub.angle*pi/180))
	radius
}
