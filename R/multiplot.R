#' Multiple plot function
#'
#' \code{see http://www.cookbook-r.com/Graphs/Multiple_graphs_on_one_page_(ggplot2)/}
#'ggplot objects can be passed in ..., or to plotlist (as a list of ggplot objects)
# If the layout is something like matrix(c(1,2,3,3), nrow=2, byrow=TRUE),
# then plot 1 will go in the upper left, 2 will go in the upper right, and
# 3 will go all the way across the bottom.
#' @param cols:   Number of columns in layout
#' @param layout: A matrix specifying the layout. If present, 'cols' is ignored.
#' @import ggplot2
#' @export
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
multiplot <- function(..., plotlist=NULL, file, cols=1, layout=NULL) {
  require(grid)
  # Make a list from the ... arguments and plotlist
  plots <- c(list(...), plotlist)
  numPlots = length(plots)
  # If layout is NULL, then use 'cols' to determine layout
  if (is.null(layout)) {
    # Make the panel
    # ncol: Number of columns of plots
    # nrow: Number of rows needed, calculated from # of cols
    layout <- matrix(seq(1, cols * ceiling(numPlots/cols)),
                    ncol = cols, nrow = ceiling(numPlots/cols))
  }
 if (numPlots==1) {
    print(plots[[1]])
  } else {
    # Set up the page
    grid.newpage()
    pushViewport(viewport(layout = grid.layout(nrow(layout), ncol(layout), 2)))##2 is for widths of columns
    # Make each plot, in the correct location
    for (i in 1:numPlots) {
      # Get the i,j matrix positions of the regions that contain this subplot
      matchidx <- as.data.frame(which(layout == i, arr.ind = TRUE))
      print(plots[[i]], vp = viewport(layout.pos.row = matchidx$row,
                                      layout.pos.col = matchidx$col))
    }
  }
}
