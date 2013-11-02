#' Plots:  Barcharts, Roseplots, and Area Adjusted Roseplots via ggplot2
#'
#' \code{A suite of functions to demonstrate why the area in roseplots need adjusting}
#'
#' @name plots
#' @param data A dataframe that is three columns wide and has the column names "prob", "cond", and "region":  "prob" is the probability of being in the "region" and "cond" is a condition or grouping variable.  See prob.cond.region in the examples.
#' @param pos  passed to geom_bar() as the "position" value:  currently supported are "dodge" and "stack"; to be impemented: "superimposed".
#' @param width passed to geom_bar() as the "width" value: determines the spacing between bars/clusters of bars between the regions.
#' @param start Passed to coord_polar() as the "start" value -- rotates the circle so that the East label meets the right side of the page.
#' @import ggplot2
#' @import RColorBrewer
#' @import scales
#' @export barchart
#' @export roseplot
#' @export aaroseplot
#' @examples
#' data(prob.cond.region)
#' b <-   barchart(prob.cond.region, "dodge", .50)       + ggtitle("Barchart")
#' r <-   roseplot(prob.cond.region, "dodge", .50, pi/3) + ggtitle("Roseplot mapped from Barchart")
#' a <- aaroseplot(prob.cond.region, "dodge", .50, pi/3) + ggtitle("Area Adjusted Roseplot")
#' multiplot(b,r,a, cols=3)
#' b <-   barchart(prob.cond.region, "stack", .95)       + ggtitle("Barchart")
#' r <-   roseplot(prob.cond.region, "stack", .95, pi/3) + ggtitle("Roseplot mapped from Barchart")
#' a <- aaroseplot(prob.cond.region, "stack", .95, pi/3) + ggtitle("Area Adjusted Roseplot")
#' multiplot(b,r,a, cols=3)
#' @rdname plots
barchart <- function(data=d, pos=p, width=w){
  ggplot(data, aes(x=factor(region), y=prob, fill=factor(cond)))+
  geom_bar(width=width, stat="identity", position=pos)
}
#' @rdname plots
roseplot <- function(data=d, pos=p, width=w, start=s){
  ggplot(data, aes(x=factor(region), y=prob, fill=factor(cond)))+
  geom_bar(width=width, stat="identity", position=pos) +
  coord_polar(start=start)
}
#' @rdname plots
aaroseplot <- function(data=d, pos=p, width=w, start=s){
  d.temp <- data
  angle <- 360 / length(unique(d.temp$region))
  groups <- length(unique(d.temp$cond))
  d.temp$radius <- area2radius(d.temp$prob, width, angle, groups)
  ggplot(d.temp, aes(x=factor(region), y=radius, fill=factor(cond)))+
    geom_bar(width=width, stat="identity", position=pos) +
      coord_polar(start=start) +
        scale_y_continuous(labels = seq(0,1,.1), breaks=area2radius(seq(0,1,.1), width, angle, groups))+
          ylab("prob")
}



