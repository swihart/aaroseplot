# aaroseplot

The prefix "aa" stands for "area adjusted".

aaroseplot is an R package/repo providing an attempt to assuage the "major preceptual problems" of roseplots listed in
the note of [ggplot2:coord_polar](http://docs.ggplot2.org/0.9.3.1/coord_polar.html):

    NOTE: Use these plots with caution - polar coordinates has
    major perceptual problems.  The main point of these examples is
    to demonstrate how these common plots can be described in the
    grammar.  Use with EXTREME caution.

When a barchart is converted to a roseplot, the height of the bar becomes the radius of the "wedge".  This is problematic perceptually because the relation between the shaded areas of barchart does not persist to a roseplot. For example, if two bars have equal width but the one height is 4x as tall, then the fill-area is 4x as much as well.  However, if a wedge has 4x the radius, its area is 16x as much the referent wedge area.  The trick is to have the height of the bar in the bar chart become the area (not the radius) of the roseplot -- an area adjusted roseplot. 

## Can I just see what you're talking about?

Run in R:

    install.packages("devtools")
    library(devtools)
    install_github("ggplot2", "hadley")
    install_github("aaroseplot", "swihart")
    data(prob.cond.region)														  
    ## Dodged barchart, roseplot, area adjusted roseplot											  
    be <-   barchart(prob.cond.region, "dodge", rad.max=0.5) + ggtitle("Barchart (dodge)")						  
    re <-   roseplot(prob.cond.region, "dodge", rad.max=0.5) + ggtitle("Roseplot (dodge)")               + scale_fill_discrete(guide=FALSE)
    ae <- aaroseplot(prob.cond.region, "dodge", rad.max=0.5) + ggtitle("Area Adjusted Roseplot (dodge)") + scale_fill_discrete(guide=FALSE)
    ## Stacked barchart, roseplot, area adjusted roseplot										  
    bk <-   barchart(prob.cond.region, "stack", rad.max=0.5) + ggtitle("Barchart (stack)")						  
    rk <-   roseplot(prob.cond.region, "stack", rad.max=0.5) + ggtitle("Roseplot (stack)")               + scale_fill_discrete(guide=FALSE)
    ak <- aaroseplot(prob.cond.region, "stack", rad.max=0.5) + ggtitle("Area Adjusted Roseplot (stack)") + scale_fill_discrete(guide=FALSE)
    ## Superimposed barchart, roseplot, area adjusted roseplot										  
    br <-   barchart(prob.cond.region, "super", rad.max=0.5) + ggtitle("Barchart (super)")						  
    rr <-   roseplot(prob.cond.region, "super", rad.max=0.5) + ggtitle("Roseplot (super)")               + scale_fill_discrete(guide=FALSE)
    ar <- aaroseplot(prob.cond.region, "super", rad.max=0.5) + ggtitle("Area Adjusted Roseplot (super)") + scale_fill_discrete(guide=FALSE)
    ## Dodged, Stacked, and Superimposed barchart, roseplot, area adjusted roseplot in same plot
    ## tip:  maximize window after render
    multiplot(be,bk,br,re,rk,rr,ae,ak,ar, cols=3)
    
## Frequently Asked Questions:

    Q:  Why not have the _area_ of the bar become the area of the wedge.
    A:  Nice idea - I would first need to get my hands on the width of
    the bar to calculate the area - email me if you know how to get
    the width.

    Q: Isn't making canned wrappers of ggplot2 functions a
    bastardization of the whole idea of grammar of graphics?
    A:  Geez -- listen, I'm a purist too and a big fan of ggplot2 as
    well.  I just wanted to make my first github repo after a very
    specific project I had involving adjusting the area of some
    roseplots.  If you email me the pros/cons of what I'm doing (if
    there are even any pros :-) I'd be happy to post them with credit
    to you if you so wish.  We're all here to learn, to share, to
    source openly.
