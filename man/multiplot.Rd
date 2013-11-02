\name{multiplot}
\alias{multiplot}
\title{Multiple plot function}
\usage{
  multiplot(..., plotlist = NULL, file, cols = 1,
    layout = NULL)
}
\arguments{
  \item{cols:}{Number of columns in layout}

  \item{layout:}{A matrix specifying the layout. If
  present, 'cols' is ignored.}
}
\description{
  \code{see
  http://www.cookbook-r.com/Graphs/Multiple_graphs_on_one_page_(ggplot2)/}
  ggplot objects can be passed in ..., or to plotlist (as a
  list of ggplot objects)
}
\examples{
data(prob.cond.region)
b <-   barchart(prob.cond.region, "dodge", .50)       + ggtitle("Barchart")
r <-   roseplot(prob.cond.region, "dodge", .50, pi/3) + ggtitle("Roseplot mapped from Barchart")
a <- aaroseplot(prob.cond.region, "dodge", .50, pi/3) + ggtitle("Area Adjusted Roseplot")
multiplot(b,r,a, cols=3)
b <-   barchart(prob.cond.region, "stack", .95)       + ggtitle("Barchart")
r <-   roseplot(prob.cond.region, "stack", .95, pi/3) + ggtitle("Roseplot mapped from Barchart")
a <- aaroseplot(prob.cond.region, "stack", .95, pi/3) + ggtitle("Area Adjusted Roseplot")
multiplot(b,r,a, cols=3)
}

