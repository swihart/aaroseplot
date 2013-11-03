\name{plots}
\alias{aaroseplot}
\alias{plots}
\alias{roseplot}
\title{Plots:  Barcharts, Roseplots, and Area Adjusted Roseplots via ggplot2}
\usage{
  barchart(data = d, pos = p, width = w)

  roseplot(data = d, pos = p, width = w, start = s)

  aaroseplot(data = d, pos = p, width = w, start = s)
}
\arguments{
  \item{data}{A dataframe that is three columns wide and
  has the column names "prob", "cond", and "region": "prob"
  is the probability of being in the "region" and "cond" is
  a condition or grouping variable.  See prob.cond.region
  in the examples.}

  \item{pos}{passed to geom_bar() as the "position" value:
  currently supported are "dodge" and "stack"; to be
  impemented: "superimposed".}

  \item{width}{passed to geom_bar() as the "width" value:
  determines the spacing between bars/clusters of bars
  between the regions.}

  \item{start}{Passed to coord_polar() as the "start" value
  -- rotates the circle so that the East label meets the
  right side of the page.}
}
\description{
  \code{A suite of functions to demonstrate why the area in
  roseplots need adjusting}
}
\examples{
data(prob.cond.region)
b <-   barchart(prob.cond.region, "dodge", .50)       + ggtitle("Barchart")
r <-   roseplot(prob.cond.region, "dodge", .50, pi/3) + ggtitle("Roseplot mapped from Barchart")  + scale_fill_discrete(guide=FALSE)
a <- aaroseplot(prob.cond.region, "dodge", .50, pi/3) + ggtitle("Area Adjusted Roseplot")         + scale_fill_discrete(guide=FALSE)
multiplot(b,r,a, cols=2, rows=2)
b <-   barchart(prob.cond.region, "stack", .95)       + ggtitle("Barchart")
r <-   roseplot(prob.cond.region, "stack", .95, pi/3) + ggtitle("Roseplot mapped from Barchart")  + scale_fill_discrete(guide=FALSE)
a <- aaroseplot(prob.cond.region, "stack", .95, pi/3) + ggtitle("Area Adjusted Roseplot")         + scale_fill_discrete(guide=FALSE)
multiplot(b,r,a, cols=2, rows=2)
}

