\name{area2radius.stack}
\alias{area2radius.stack}
\title{Radius of a sector (circle wedge)}
\usage{
  area2radius.stack(data, w.g = width.global, a = angle)
}
\arguments{
  \item{data}{A dataframe that is three columns wide and
  has the column names "prob", "cond", and "region": "prob"
  is the probability of being in the "region" and "cond" is
  a condition or grouping variable.  See prob.cond.region
  in the examples. The stacking will occur in order of the
  levels when "cond" is a factor, innermost to outermost.}

  \item{w.g}{The global width (as specified in the bar
  chart)}

  \item{a}{The total angle to be occupied in degrees.}
}
\description{
  \code{area2radius.stack} is a function that will return
  the sequential radii for stacked sections in a sector
  (circle wedge) of a given area and angle.
}

