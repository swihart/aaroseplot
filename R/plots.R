#' Plots:  Barcharts, Roseplots, and Area Adjusted Roseplots via ggplot2
#'
#' \code{A suite of functions to demonstrate why the area in roseplots need adjusting}
#'
#' @name plots
#' @param data A dataframe that is three columns wide and has the column names "prob", "cond", and "region":  "prob" is the probability of being in the "region" and "cond" is a condition or grouping variable.  See prob.cond.region in the examples.
#' @param pos  passed to geom_bar() as the "position" value:  currently supported are "dodge" and "stack"; "super" superimposes layers up to 10 levels of "cond".
#' @param width passed to geom_bar() as the "width" value: determines the spacing between bars/clusters of bars between the regions. Default is 0.80
#' @param alpha Passed to geom_bar() as the "alpha" value -- default is 0.6; 1 is opaque and 0 is transparent
#' @param border.col Passed to geom_bar() as the "color" value -- "black" is default and NA is transparent for border color control
#' @param start Passed to coord_polar() as the "start" value -- default \code{pi/3} rotates the circle so that the East (EE) label meets the right side of the page (not applicable to \code{barchart()})
#' @import ggplot2
#' @import RColorBrewer
#' @import scales
#' @export barchart
#' @export roseplot
#' @export aaroseplot
#' @examples
#' data(prob.cond.region)
#' be <-   barchart(prob.cond.region, "dodge") + ggtitle("Barchart")
#' re <-   roseplot(prob.cond.region, "dodge") + ggtitle("Roseplot mapped from Barchart")  + scale_fill_discrete(guide=FALSE)
#' ae <- aaroseplot(prob.cond.region, "dodge") + ggtitle("Area Adjusted Roseplot")         + scale_fill_discrete(guide=FALSE)
#' multiplot(be,re,ae, cols=2, rows=2)
#' bk <-   barchart(prob.cond.region, "stack") + ggtitle("Barchart")
#' rk <-   roseplot(prob.cond.region, "stack") + ggtitle("Roseplot mapped from Barchart")  + scale_fill_discrete(guide=FALSE)
#' ak <- aaroseplot(prob.cond.region, "stack") + ggtitle("Area Adjusted Roseplot")         + scale_fill_discrete(guide=FALSE)
#' multiplot(bk,rk,ak, cols=2, rows=2)
#' br <-   barchart(prob.cond.region, "super") + ggtitle("Barchart")
#' rr <-   roseplot(prob.cond.region, "super") + ggtitle("Roseplot mapped from Barchart")  + scale_fill_discrete(guide=FALSE)
#' ar <- aaroseplot(prob.cond.region, "super") + ggtitle("Area Adjusted Roseplot")         + scale_fill_discrete(guide=FALSE)
#' multiplot(br,rr,ar, cols=2, rows=2)
#' multiplot(be,re,ae,bk,rk,ak,br,rr,ar, cols=3, rows=3)
#' @rdname plots
barchart <- function(data=d, pos=p, width=0.80, alpha=0.6, border.col="black"){
	if(pos=="super"){
		## really bad coding; hard coded at 10 levels of cond.  If there are fewer, just doesn't add anything...
		p.return <-
			ggplot(subset(data, cond==levels(factor(cond))[1]), aes(x=factor(region), y=prob, fill=factor(cond)))+
			geom_bar(width=width, stat="identity", position=NULL, alpha=alpha, color=border.col) +
			geom_bar(data=subset(data, cond==levels(factor(cond))[2]), width=width, stat="identity", position=NULL, alpha=alpha, color=border.col) +
			geom_bar(data=subset(data, cond==levels(factor(cond))[3]), width=width, stat="identity", position=NULL, alpha=alpha, color=border.col) +
			geom_bar(data=subset(data, cond==levels(factor(cond))[4]), width=width, stat="identity", position=NULL, alpha=alpha, color=border.col) +
			geom_bar(data=subset(data, cond==levels(factor(cond))[5]), width=width, stat="identity", position=NULL, alpha=alpha, color=border.col) +
			geom_bar(data=subset(data, cond==levels(factor(cond))[6]), width=width, stat="identity", position=NULL, alpha=alpha, color=border.col) +
			geom_bar(data=subset(data, cond==levels(factor(cond))[7]), width=width, stat="identity", position=NULL, alpha=alpha, color=border.col) +
			geom_bar(data=subset(data, cond==levels(factor(cond))[8]), width=width, stat="identity", position=NULL, alpha=alpha, color=border.col) +
			geom_bar(data=subset(data, cond==levels(factor(cond))[9]), width=width, stat="identity", position=NULL, alpha=alpha, color=border.col) +
			geom_bar(data=subset(data, cond==levels(factor(cond))[10]), width=width, stat="identity", position=NULL, alpha=alpha, color=border.col)
	}else{
		p.return <- ggplot(data, aes(x=factor(region), y=prob, fill=factor(cond)))+
			geom_bar(width=width, stat="identity", position=pos, alpha=alpha, color=border.col)
	}
	p.return
}
#' @rdname plots
roseplot <- function(data=d, pos=p, width=0.80, alpha=0.6, border.col="black", start=pi/3){
	if(pos=="super"){
		## really bad coding; hard coded at 10 levels of cond.  If there are fewer, just doesn't add anything...
		p.return <- ggplot(subset(data, cond==levels(factor(cond))[1]), aes(x=factor(region), y=prob, fill=factor(cond)))+
			geom_bar(width=width, stat="identity", position=NULL, alpha=alpha, color=border.col) +
				coord_polar(start=start) +
			geom_bar(data=subset(data, cond==levels(factor(cond))[2]), width=width, stat="identity", position=NULL, alpha=alpha, color=border.col) +
				coord_polar(start=start) +
			geom_bar(data=subset(data, cond==levels(factor(cond))[3]), width=width, stat="identity", position=NULL, alpha=alpha, color=border.col) +
				coord_polar(start=start) +
			geom_bar(data=subset(data, cond==levels(factor(cond))[4]), width=width, stat="identity", position=NULL, alpha=alpha, color=border.col) +
				coord_polar(start=start) +
			geom_bar(data=subset(data, cond==levels(factor(cond))[5]), width=width, stat="identity", position=NULL, alpha=alpha, color=border.col) +
				coord_polar(start=start) +
			geom_bar(data=subset(data, cond==levels(factor(cond))[6]), width=width, stat="identity", position=NULL, alpha=alpha, color=border.col) +
				coord_polar(start=start) +
			geom_bar(data=subset(data, cond==levels(factor(cond))[7]), width=width, stat="identity", position=NULL, alpha=alpha, color=border.col) +
				coord_polar(start=start) +
			geom_bar(data=subset(data, cond==levels(factor(cond))[8]), width=width, stat="identity", position=NULL, alpha=alpha, color=border.col) +
				coord_polar(start=start) +
			geom_bar(data=subset(data, cond==levels(factor(cond))[9]), width=width, stat="identity", position=NULL, alpha=alpha, color=border.col) +
				coord_polar(start=start) +
			geom_bar(data=subset(data, cond==levels(factor(cond))[10]), width=width, stat="identity", position=NULL, alpha=alpha, color=border.col) +
				coord_polar(start=start)
	}else{
		p.return <- ggplot(data, aes(x=factor(region), y=prob, fill=factor(cond)))+
			geom_bar(width=width, stat="identity", position=pos, alpha=alpha, color=border.col) +
				coord_polar(start=start)
	}
	p.return
}
#' @rdname plots
aaroseplot <- function(data=d, pos=p, width=0.80, alpha=0.6, border.col="black", start=pi/3){
	## dodge and superimpose, because they start from center, require same radius2area transformation:
	if(pos %in% c("dodge", "super")){
		d.temp <- data
		angle <- 360 / length(unique(d.temp$region))
		groups <- length(unique(d.temp$cond))
		d.temp$radius <- area2radius(d.temp$prob, width, angle, groups)
		if(pos == "super"){
			## really bad coding; hard coded at 10 levels of cond.  If there are fewer, just doesn't add anything...
			p.return <- ggplot(subset(d.temp, cond==levels(factor(cond))[1]), aes(x=factor(region), y=radius, fill=factor(cond)))+
			geom_bar(width=width, stat="identity", position=NULL, alpha=alpha, color=border.col) +
				coord_polar(start=start) +
			geom_bar(data=subset(d.temp, cond==levels(factor(cond))[2]), width=width, stat="identity", position=NULL, alpha=alpha, color=border.col) +
				coord_polar(start=start) +
			geom_bar(data=subset(d.temp, cond==levels(factor(cond))[3]), width=width, stat="identity", position=NULL, alpha=alpha, color=border.col) +
				coord_polar(start=start) +
			geom_bar(data=subset(d.temp, cond==levels(factor(cond))[4]), width=width, stat="identity", position=NULL, alpha=alpha, color=border.col) +
				coord_polar(start=start) +
			geom_bar(data=subset(d.temp, cond==levels(factor(cond))[5]), width=width, stat="identity", position=NULL, alpha=alpha, color=border.col) +
				coord_polar(start=start) +
			geom_bar(data=subset(d.temp, cond==levels(factor(cond))[6]), width=width, stat="identity", position=NULL, alpha=alpha, color=border.col) +
				coord_polar(start=start) +
			geom_bar(data=subset(d.temp, cond==levels(factor(cond))[7]), width=width, stat="identity", position=NULL, alpha=alpha, color=border.col) +
				coord_polar(start=start) +
			geom_bar(data=subset(d.temp, cond==levels(factor(cond))[8]), width=width, stat="identity", position=NULL, alpha=alpha, color=border.col) +
				coord_polar(start=start) +
			geom_bar(data=subset(d.temp, cond==levels(factor(cond))[9]), width=width, stat="identity", position=NULL, alpha=alpha, color=border.col) +
				coord_polar(start=start) +
			geom_bar(data=subset(d.temp, cond==levels(factor(cond))[10]), width=width, stat="identity", position=NULL, alpha=alpha, color=border.col) +
				coord_polar(start=start) +
			scale_y_continuous(labels = seq(0,1,.1), breaks=area2radius(seq(0,1,.1), width, angle, groups))+
				ylab("prob")
		}else{
			p.return <- ggplot(d.temp, aes(x=factor(region), y=radius, fill=factor(cond)))+
				geom_bar(width=width, stat="identity", position=pos, alpha=alpha, color=border.col) +
					coord_polar(start=start) +
						scale_y_continuous(labels = seq(0,1,.1), breaks=area2radius(seq(0,1,.1), width, angle, groups))+
							ylab("prob")
		}
	}else{print("not yet implemented for pos=stack")
		d.temp <- data
		angle <- 360 / length(unique(d.temp$region))
		groups <- length(unique(d.temp$cond))
		d.temp$radius <- area2radius(d.temp$prob, width, angle, groups)
			p.return <- ggplot(d.temp, aes(x=factor(region), y=radius, fill=factor(cond)))+
				geom_bar(width=width, stat="identity", position=pos, alpha=alpha, color=border.col) +
					coord_polar(start=start) +
						scale_y_continuous(labels = seq(0,1,.1), breaks=area2radius(seq(0,1,.1), width, angle, groups))+
							ylab("prob")
		}
	p.return
}



