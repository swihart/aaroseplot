#' Plots:  Barcharts, Roseplots, and Area Adjusted Roseplots via ggplot2
#'
#' \code{A suite of functions to demonstrate why the area in roseplots need adjusting}
#'
#' @name plots
#' @param data A dataframe that is three columns wide and has the column names "prob", "cond", and "region":  "prob" is the probability of being in the "region" and "cond" is a condition or grouping variable.  See prob.cond.region in the examples.
#' @param pos  passed to geom_bar() as the "position" value:  currently supported are "dodge" and "stack"; "super" superimposes layers up to 10 levels of "cond".  If pos="super" throws the error "Error in if (nrow(layer_data) == 0) return() : argument is of length zero" then exit out, restart R, and \code{library(devtools); install_github("ggplot2","hadley")}.  See https://github.com/hadley/ggplot2/issues/587 for details
#' @param width passed to geom_bar() as the "width" value: determines the spacing between bars/clusters of bars between the regions. Default is 0.80
#' @param alpha Passed to geom_bar() as the "alpha" value -- default is 0.6; 1 is opaque and 0 is transparent
#' @param border.col Passed to geom_bar() as the "color" value -- "black" is default and NA is transparent for border color control
#' @param rad.max [0, 1.05*rad.max] is the range of the radius-scale. rad.max should be specified as a number between 0 and 1.  Default is NULL, which means ggplot will handle the range display automatically/default.
#' @param start Passed to coord_polar() as the "start" value -- default \code{pi/3} rotates the circle so that the East (EE) label meets the right side of the page (not applicable to \code{barchart()})
#' @import ggplot2
#' @import RColorBrewer
#' @import scales
#' @export barchart
#' @export roseplot
#' @export aaroseplot
#' @examples
#' data(prob.cond.region)
#' ## Dodged barchart, roseplot, area adjusted roseplot
#' be <-   barchart(prob.cond.region, "dodge", rad.max=0.5) + ggtitle("Barchart (dodge)")
#' re <-   roseplot(prob.cond.region, "dodge", rad.max=0.5) + ggtitle("Roseplot (dodge)")               + scale_fill_discrete(guide="none")
#' ae <- aaroseplot(prob.cond.region, "dodge", rad.max=0.5) + ggtitle("Area Adjusted Roseplot (dodge)") + scale_fill_discrete(guide="none")
#' multiplot(be,re,ae, cols=2, rows=2)
#' ## Stacked barchart, roseplot, area adjusted roseplot
#' bk <-   barchart(prob.cond.region, "stack", rad.max=0.5) + ggtitle("Barchart (stack)")
#' rk <-   roseplot(prob.cond.region, "stack", rad.max=0.5) + ggtitle("Roseplot (stack)")               + scale_fill_discrete(guide="none")
#' ak <- aaroseplot(prob.cond.region, "stack", rad.max=0.5) + ggtitle("Area Adjusted Roseplot (stack)") + scale_fill_discrete(guide="none")
#' multiplot(bk,rk,ak, cols=2, rows=2)
#' ## Superimposed barchart, roseplot, area adjusted roseplot
#' br <-   barchart(prob.cond.region, "super", rad.max=0.5) + ggtitle("Barchart (super)")
#' rr <-   roseplot(prob.cond.region, "super", rad.max=0.5) + ggtitle("Roseplot (super)")               + scale_fill_discrete(guide="none")
#' ar <- aaroseplot(prob.cond.region, "super", rad.max=0.5) + ggtitle("Area Adjusted Roseplot (super)") + scale_fill_discrete(guide="none")
#' multiplot(br,rr,ar, cols=2, rows=2)
#' ## Dodged, Stacked, and Superimposed barchart, roseplot, area adjusted roseplot in same plot
#' ## tip:  maximize window after render
#' multiplot(be,bk,br,re,rk,rr,ae,ak,ar, cols=3)
#' @rdname plots
barchart <- function(data=d, pos=p, width=0.80, alpha=0.6, border.col="black", rad.max=NULL){
        ifelse(is.null(rad.max), rad.max <- max(data$prob)*1.05, rad.max)
	if(pos=="super"){
		## really bad coding; hard coded at 10 levels of cond.  If there are fewer, just doesn't add anything...
		p.return <-
			ggplot(subset(data, cond==levels(factor(cond))[1]), aes(x=factor(region), y=prob, fill=factor(cond)))+
			geom_bar(width=width, stat="identity", position="identity", alpha=alpha, color=border.col) +
			geom_bar(data=subset(data, cond==levels(factor(cond))[2]), width=width, stat="identity", position="identity", alpha=alpha, color=border.col) +
			geom_bar(data=subset(data, cond==levels(factor(cond))[3]), width=width, stat="identity", position="identity", alpha=alpha, color=border.col) +
			geom_bar(data=subset(data, cond==levels(factor(cond))[4]), width=width, stat="identity", position="identity", alpha=alpha, color=border.col) +
			geom_bar(data=subset(data, cond==levels(factor(cond))[5]), width=width, stat="identity", position="identity", alpha=alpha, color=border.col) +
			geom_bar(data=subset(data, cond==levels(factor(cond))[6]), width=width, stat="identity", position="identity", alpha=alpha, color=border.col) +
			geom_bar(data=subset(data, cond==levels(factor(cond))[7]), width=width, stat="identity", position="identity", alpha=alpha, color=border.col) +
			geom_bar(data=subset(data, cond==levels(factor(cond))[8]), width=width, stat="identity", position="identity", alpha=alpha, color=border.col) +
			geom_bar(data=subset(data, cond==levels(factor(cond))[9]), width=width, stat="identity", position="identity", alpha=alpha, color=border.col) +
			geom_bar(data=subset(data, cond==levels(factor(cond))[10]), width=width, stat="identity", position="identity", alpha=alpha, color=border.col) +
					scale_y_continuous(labels = seq(0,1,.1),
							   breaks=seq(0,1,.1),
							   limits=c(0,rad.max))
	}else{
		p.return <- ggplot(data, aes(x=factor(region), y=prob, fill=factor(cond)))+
			geom_bar(width=width, stat="identity", position=pos, alpha=alpha, color=border.col) +
					scale_y_continuous(labels = seq(0,1,.1),
							   breaks=seq(0,1,.1),
							   limits=c(0,rad.max))
	}
	p.return
}
#' @rdname plots
roseplot <- function(data=d, pos=p, width=0.80, alpha=0.6, border.col="black", rad.max=NULL, start=pi/3){
        ifelse(is.null(rad.max), rad.max <- max(data$prob)*1.05, rad.max)
	if(pos=="super"){
		## really bad coding; hard coded at 10 levels of cond.  If there are fewer, just doesn't add anything...
		p.return <- ggplot(subset(data, cond==levels(factor(cond))[1]), aes(x=factor(region), y=prob, fill=factor(cond)))+
			geom_bar(width=width, stat="identity", position="identity", alpha=alpha, color=border.col) +
				coord_polar(start=start) +
			geom_bar(data=subset(data, cond==levels(factor(cond))[2]), width=width, stat="identity", position="identity", alpha=alpha, color=border.col) +
				coord_polar(start=start) +
			geom_bar(data=subset(data, cond==levels(factor(cond))[3]), width=width, stat="identity", position="identity", alpha=alpha, color=border.col) +
				coord_polar(start=start) +
			geom_bar(data=subset(data, cond==levels(factor(cond))[4]), width=width, stat="identity", position="identity", alpha=alpha, color=border.col) +
				coord_polar(start=start) +
			geom_bar(data=subset(data, cond==levels(factor(cond))[5]), width=width, stat="identity", position="identity", alpha=alpha, color=border.col) +
				coord_polar(start=start) +
			geom_bar(data=subset(data, cond==levels(factor(cond))[6]), width=width, stat="identity", position="identity", alpha=alpha, color=border.col) +
				coord_polar(start=start) +
			geom_bar(data=subset(data, cond==levels(factor(cond))[7]), width=width, stat="identity", position="identity", alpha=alpha, color=border.col) +
				coord_polar(start=start) +
			geom_bar(data=subset(data, cond==levels(factor(cond))[8]), width=width, stat="identity", position="identity", alpha=alpha, color=border.col) +
				coord_polar(start=start) +
			geom_bar(data=subset(data, cond==levels(factor(cond))[9]), width=width, stat="identity", position="identity", alpha=alpha, color=border.col) +
				coord_polar(start=start) +
			geom_bar(data=subset(data, cond==levels(factor(cond))[10]), width=width, stat="identity", position="identity", alpha=alpha, color=border.col) +
				coord_polar(start=start)  +
					scale_y_continuous(labels = seq(0,1,.1),
							   breaks=seq(0,1,.1),
							   limits=c(0,rad.max))
	}else{
		p.return <- ggplot(data, aes(x=factor(region), y=prob, fill=factor(cond)))+
			geom_bar(width=width, stat="identity", position=pos, alpha=alpha, color=border.col) +
				coord_polar(start=start) +
					scale_y_continuous(labels = seq(0,1,.1),
							   breaks=seq(0,1,.1),
							   limits=c(0,rad.max))
	}
	p.return
}
#' @rdname plots
aaroseplot <- function(data=d, pos=p, width=0.80, alpha=0.6, border.col="black", rad.max=NULL, start=pi/3){
        ifelse(is.null(rad.max), rad.max <- max(data$prob)*1.05, rad.max)
	## dodge and superimpose, because they start from center, require same radius2area transformation:
	if(pos %in% c("dodge", "super")){
		d.temp <- data
		angle <- 360 / length(unique(d.temp$region))
		groups <- length(unique(d.temp$cond))
		d.temp$radius <- area2radius(d.temp$prob, width, angle, groups)
		if(pos == "super"){
			## really bad coding; hard coded at 10 levels of cond.  If there are fewer, just doesn't add anything...
			p.return <- ggplot(subset(d.temp, cond==levels(factor(cond))[1]), aes(x=factor(region), y=radius, fill=factor(cond)))+
			geom_bar(width=width, stat="identity", position="identity", alpha=alpha, color=border.col) +
				coord_polar(start=start) +
			geom_bar(data=subset(d.temp, cond==levels(factor(cond))[2]), width=width, stat="identity", position="identity", alpha=alpha, color=border.col) +
				coord_polar(start=start) +
			geom_bar(data=subset(d.temp, cond==levels(factor(cond))[3]), width=width, stat="identity", position="identity", alpha=alpha, color=border.col) +
				coord_polar(start=start) +
			geom_bar(data=subset(d.temp, cond==levels(factor(cond))[4]), width=width, stat="identity", position="identity", alpha=alpha, color=border.col) +
				coord_polar(start=start) +
			geom_bar(data=subset(d.temp, cond==levels(factor(cond))[5]), width=width, stat="identity", position="identity", alpha=alpha, color=border.col) +
				coord_polar(start=start) +
			geom_bar(data=subset(d.temp, cond==levels(factor(cond))[6]), width=width, stat="identity", position="identity", alpha=alpha, color=border.col) +
				coord_polar(start=start) +
			geom_bar(data=subset(d.temp, cond==levels(factor(cond))[7]), width=width, stat="identity", position="identity", alpha=alpha, color=border.col) +
				coord_polar(start=start) +
			geom_bar(data=subset(d.temp, cond==levels(factor(cond))[8]), width=width, stat="identity", position="identity", alpha=alpha, color=border.col) +
				coord_polar(start=start) +
			geom_bar(data=subset(d.temp, cond==levels(factor(cond))[9]), width=width, stat="identity", position="identity", alpha=alpha, color=border.col) +
				coord_polar(start=start) +
			geom_bar(data=subset(d.temp, cond==levels(factor(cond))[10]), width=width, stat="identity", position="identity", alpha=alpha, color=border.col) +
				coord_polar(start=start) +
			scale_y_continuous(labels = seq(0,1,.1),
					   breaks=area2radius(seq(0,1,.1), width, angle, groups),
					   limits=c(0,area2radius(rad.max, width,angle,groups)))+
				ylab("prob")
		}else{
			p.return <- ggplot(d.temp, aes(x=factor(region), y=radius, fill=factor(cond)))+
				geom_bar(width=width, stat="identity", position=pos, alpha=alpha, color=border.col) +
					coord_polar(start=start) +
						scale_y_continuous(labels = seq(0,1,.1),
								   breaks=area2radius(seq(0,1,.1), width, angle, groups),
								   limits=c(0,area2radius(rad.max, width,angle,groups)))+
							ylab("prob")
		}
	}else{print("double check graphical results for pos=stack")
		d.temp <- data
		angle <- 360 / length(unique(d.temp$region))
		groups <- 1
		d.temp$radius <- area2radius.stack(d.temp, width, angle)
			p.return <- ggplot(d.temp, aes(x=factor(region), y=radius, fill=factor(cond)))+
				geom_bar(width=width, stat="identity", position=pos, alpha=alpha, color=border.col) +
					coord_polar(start=start) +
						scale_y_continuous(labels = seq(0,1,.1),
								   breaks=area2radius(seq(0,1,.1), width, angle, groups),
								   limits=c(0,area2radius(rad.max, width,angle,groups)))+
							ylab("prob")
		}
	p.return
}



