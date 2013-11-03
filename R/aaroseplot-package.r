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
#' be <-   barchart(prob.cond.region, "dodge") + ggtitle("Barchart (dodge)")
#' re <-   roseplot(prob.cond.region, "dodge") + ggtitle("Roseplot (dodge)")  + scale_fill_discrete(guide=FALSE)
#' ae <- aaroseplot(prob.cond.region, "dodge") + ggtitle("Area Adjusted Roseplot (dodge)")         + scale_fill_discrete(guide=FALSE)
#' multiplot(be,re,ae, cols=2, rows=2)
#' bk <-   barchart(prob.cond.region, "stack") + ggtitle("Barchart (stack)")
#' rk <-   roseplot(prob.cond.region, "stack") + ggtitle("Roseplot (stack)")  + scale_fill_discrete(guide=FALSE)
#' ak <- aaroseplot(prob.cond.region, "stack") + ggtitle("Area Adjusted Roseplot (stack)")         + scale_fill_discrete(guide=FALSE)
#' multiplot(bk,rk,ak, cols=2, rows=2)
#' br <-   barchart(prob.cond.region, "super") + ggtitle("Barchart (super)")
#' rr <-   roseplot(prob.cond.region, "super") + ggtitle("Roseplot (super)")  + scale_fill_discrete(guide=FALSE)
#' ar <- aaroseplot(prob.cond.region, "super") + ggtitle("Area Adjusted Roseplot (super)")         + scale_fill_discrete(guide=FALSE)
#' multiplot(br,rr,ar, cols=2, rows=2)
#' multiplot(be,bk,br,re,rk,rr,ae,ak,ar, cols=3)
NULL
