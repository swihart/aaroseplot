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
#' ## Dodged barchart, roseplot, area adjusted roseplot
#' be <-   barchart(prob.cond.region, "dodge", rad.max=0.5) + ggtitle("Barchart (dodge)")
#' re <-   roseplot(prob.cond.region, "dodge", rad.max=0.5) + ggtitle("Roseplot (dodge)")               + scale_fill_discrete(guide=FALSE)
#' ae <- aaroseplot(prob.cond.region, "dodge", rad.max=0.5) + ggtitle("Area Adjusted Roseplot (dodge)") + scale_fill_discrete(guide=FALSE)
#' multiplot(be,re,ae, cols=2, rows=2)
#' ## Stacked barchart, roseplot, area adjusted roseplot
#' bk <-   barchart(prob.cond.region, "stack", rad.max=0.5) + ggtitle("Barchart (stack)")
#' rk <-   roseplot(prob.cond.region, "stack", rad.max=0.5) + ggtitle("Roseplot (stack)")               + scale_fill_discrete(guide=FALSE)
#' ak <- aaroseplot(prob.cond.region, "stack", rad.max=0.5) + ggtitle("Area Adjusted Roseplot (stack)") + scale_fill_discrete(guide=FALSE)
#' multiplot(bk,rk,ak, cols=2, rows=2)
#' ## Superimposed barchart, roseplot, area adjusted roseplot
#' br <-   barchart(prob.cond.region, "super", rad.max=0.5) + ggtitle("Barchart (super)")
#' rr <-   roseplot(prob.cond.region, "super", rad.max=0.5) + ggtitle("Roseplot (super)")               + scale_fill_discrete(guide=FALSE)
#' ar <- aaroseplot(prob.cond.region, "super", rad.max=0.5) + ggtitle("Area Adjusted Roseplot (super)") + scale_fill_discrete(guide=FALSE)
#' multiplot(br,rr,ar, cols=2, rows=2)
#' ## Dodged, Stacked, and Superimposed barchart, roseplot, area adjusted roseplot in same plot
#' ## tip:  maximize window after render
#' multiplot(be,bk,br,re,rk,rr,ae,ak,ar, cols=3)
NULL
