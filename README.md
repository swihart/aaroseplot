# aaroseplot

aaroseplot is an R package/repo providing an attempt to assuage the "major preceptual problems" listed in
the note of ggplot2:coord_polar (http://docs.ggplot2.org/0.9.3.1/coord_polar.html):

    NOTE: Use these plots with caution - polar coordinates has
    major perceptual problems.  The main point of these examples is
    to demonstrate how these common plots can be described in the
    grammar.  Use with EXTREME caution.


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
    