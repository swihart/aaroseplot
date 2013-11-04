# aaroseplot

aaroseplot is a plotting system for R, based on the grammar of graphics,
which tries to take the good parts of base and lattice graphics and
avoid bad parts. It takes care of many of the fiddly details
that make plotting a hassle (like drawing legends) as well as
providing a powerful model of graphics that makes it easy to produce
complex multi-layered graphics.

To install or update, run:

    install.packages(c("aaroseplot", "plyr"))

Find out more at http://had.co.nz/aaroseplot, and check out the nearly 500
examples of ggplot in use.  If you're interested, you can also sign up to 
the aaroseplot mailing list at http://groups.google.com/group/aaroseplot, or track
development at http://github.com/hadley/aaroseplot

## Development

To install the development version of aaroseplot, it's easiest to use the `devtools` package:

    # install.packages("devtools")
    library(devtools)
    install_github("aaroseplot", "swihart")