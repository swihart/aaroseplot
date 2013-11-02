\name{area2radius}
\alias{area2radius}
\title{Radius of a sector (circle wedge)}
\usage{
  area2radius(area, w.g = width.global, a = angle,
    g = groups)
}
\arguments{
  \item{area}{The number to be represented by the area of
  the wedge}

  \item{w.g}{The global width (as specified in the bar
  chart)}

  \item{a}{The total angle to be occupied}

  \item{g}{The total number of groups to be displayed
  within angle \code{a}}
}
\description{
  \code{area2radius} is a function that will return the
  radius for a sector (circle wedge) of a given area and
  angle.
}
\examples{
area2radius(pi/4, 1.0, 90, 1)
area2radius(pi/4, 0.5, 90, 1)
area2radius(pi/4, 1.0, 90, 2)
}

