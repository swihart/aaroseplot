#' aaroseplot: A package containing barchart, roseplot, and area adjusted roseplot wrappers of ggplot2 functions
#'
#'  aaroseplot is simply some wrappers for a specific kind of data that is well displayed as a roseplot.
#'  For an application I had, cells could grow outward from a center into a 2-D region.  I modeled
#' the probability of growth into a region and wanted to display those probabilities as a roseplot where the area
#' was the probability, not the radius.  See the examples.
#'
#' @name aaroseplot
#' @docType package
#' @examples
#' data(prob.cond.region)
#' b <-   barchart(prob.cond.region, "dodge", .50)       + ggtitle("Barchart")
#' r <-   roseplot(prob.cond.region, "dodge", .50, pi/3) + ggtitle("Roseplot mapped from Barchart")  + scale_fill_discrete(guide=FALSE)
#' a <- aaroseplot(prob.cond.region, "dodge", .50, pi/3) + ggtitle("Area Adjusted Roseplot")         + scale_fill_discrete(guide=FALSE)
#' multiplot(b,r,a, cols=3, rows=2)
#' b <-   barchart(prob.cond.region, "stack", .95)       + ggtitle("Barchart")
#' r <-   roseplot(prob.cond.region, "stack", .95, pi/3) + ggtitle("Roseplot mapped from Barchart")  + scale_fill_discrete(guide=FALSE)
#' a <- aaroseplot(prob.cond.region, "stack", .95, pi/3) + ggtitle("Area Adjusted Roseplot")         + scale_fill_discrete(guide=FALSE)
#' multiplot(b,r,a, cols=2, rows=2)
NULL
