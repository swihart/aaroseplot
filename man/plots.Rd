\name{plots}
\alias{aaroseplot}
\alias{plots}
\alias{roseplot}
\title{Plots:  Barcharts, Roseplots, and Area Adjusted Roseplots via ggplot2}
\usage{
  barchart(data = d, pos = p, width = 0.8, alpha = 0.6,
    border.col = "black")

  roseplot(data = d, pos = p, width = 0.8, alpha = 0.6,
    border.col = "black", start = pi/3)

  aaroseplot(data = d, pos = p, width = 0.8, alpha = 0.6,
    border.col = "black", start = pi/3)
}
\arguments{
  \item{data}{A dataframe that is three columns wide and
  has the column names "prob", "cond", and "region": "prob"
  is the probability of being in the "region" and "cond" is
  a condition or grouping variable.  See prob.cond.region
  in the examples.}

  \item{pos}{passed to geom_bar() as the "position" value:
  currently supported are "dodge" and "stack"; "super"
  superimposes layers up to 10 levels of "cond".  If
  pos="super" throws the error "Error in if
  (nrow(layer_data) == 0) return() : argument is of length
  zero" then exit out, restart R, and
  \code{library(devtools);
  install_github("ggplot2","hadley")}.  See
  https://github.com/hadley/ggplot2/issues/587 for details}

  \item{width}{passed to geom_bar() as the "width" value:
  determines the spacing between bars/clusters of bars
  between the regions. Default is 0.80}

  \item{alpha}{Passed to geom_bar() as the "alpha" value --
  default is 0.6; 1 is opaque and 0 is transparent}

  \item{border.col}{Passed to geom_bar() as the "color"
  value -- "black" is default and NA is transparent for
  border color control}

  \item{start}{Passed to coord_polar() as the "start" value
  -- default \code{pi/3} rotates the circle so that the
  East (EE) label meets the right side of the page (not
  applicable to \code{barchart()})}
}
\description{
  \code{A suite of functions to demonstrate why the area in
  roseplots need adjusting}
}
\examples{
data(prob.cond.region)
be <-   barchart(prob.cond.region, "dodge") + ggtitle("Barchart (dodge)")
re <-   roseplot(prob.cond.region, "dodge") + ggtitle("Roseplot (dodge)")  + scale_fill_discrete(guide=FALSE)
ae <- aaroseplot(prob.cond.region, "dodge") + ggtitle("Area Adjusted Roseplot (dodge)")         + scale_fill_discrete(guide=FALSE)
multiplot(be,re,ae, cols=2, rows=2)
bk <-   barchart(prob.cond.region, "stack") + ggtitle("Barchart (stack)")
rk <-   roseplot(prob.cond.region, "stack") + ggtitle("Roseplot (stack)")  + scale_fill_discrete(guide=FALSE)
ak <- aaroseplot(prob.cond.region, "stack") + ggtitle("Area Adjusted Roseplot (stack)")         + scale_fill_discrete(guide=FALSE)
multiplot(bk,rk,ak, cols=2, rows=2)
br <-   barchart(prob.cond.region, "super") + ggtitle("Barchart (super)")
rr <-   roseplot(prob.cond.region, "super") + ggtitle("Roseplot (super)")  + scale_fill_discrete(guide=FALSE)
ar <- aaroseplot(prob.cond.region, "super") + ggtitle("Area Adjusted Roseplot (super)")         + scale_fill_discrete(guide=FALSE)
multiplot(br,rr,ar, cols=2, rows=2)
multiplot(be,bk,br,re,rk,rr,ae,ak,ar, cols=3)
}

