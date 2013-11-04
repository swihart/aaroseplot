#' Radius of a sector (circle wedge)
#'
#' \code{area2radius.stack} is a function that will return the sequential radii for stacked sections in a sector (circle wedge) of a given area and angle.
#'
#' @param data A dataframe that is three columns wide and has the column names "prob", "cond", and "region":  "prob" is the probability of being in the "region" and "cond" is a condition or grouping variable.  See prob.cond.region in the examples. The stacking will occur in order of the levels when "cond" is a factor, innermost to outermost.
#' @param w.g  The global width (as specified in the bar chart)
#' @param a    The total angle to be occupied in degrees.
#' @export
area2radius.stack <- function(data, w.g=width.global, a=angle){
        dt <- data
	dt$area <- dt$prob
	dt$radius <- NA
	sub.angle <- (w.g * a)
        ## calculate first radius
	for(R in 1:length(levels(factor(dt$region)))){
		extract <-which(dt$cond==levels(factor(dt$cond))[1] & dt$region==levels(factor(dt$region))[R])
		dt$radius[extract] <- sqrt((2*dt$area[extract])/(sub.angle*pi/180))
		previous.radius <- dt$radius[extract]
		for(L in 2:length(levels(factor(dt$cond))[1])){
			extract <-which(dt$cond==levels(factor(dt$cond))[L] & dt$region==levels(factor(dt$region))[R])
			dt$radius[extract] <- sqrt((2*dt$area[extract])/(sub.angle*pi/180) + previous.radius^2) - previous.radius
                        previous.radius <- previous.radius + dt$radius[extract]
		}
	}
	dt$radius
}
