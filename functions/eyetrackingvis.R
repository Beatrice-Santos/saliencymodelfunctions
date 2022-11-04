#Load libraries
library(grid)

eyetrackingvis <- function(imgr,
                           img,
                           et,
                           style="size",
                           etonly=FALSE,
                           ...) {
  if(!inherits(et, "et"))
    stop("Invalid eye tracking data")
  
  #Viewports
  vp = viewport(xscale = c(0,imgr$dim[2]), yscale=c(imgr$dim[1],0), layout.pos.col = 1)
  vp2 = viewport(layout=grid.layout(1, 1, widths=imgr$dim[2], heights=imgr$dim[1], respect=TRUE))
  
  if (etonly) {
    pushViewport(vp2)
    pushViewport(vp)
    displayeyetracking(et, style, ...)
  }
  else {
    grid.newpage()
    pushViewport(vp2)
    pushViewport(vp)
    grid.raster(img) 
    displayeyetracking(et, style, ...)
  }

}


#Draws fixations on top of image given et object and vis style
displayeyetracking <- function(et, style="size", ...){
  if (!style %in% c("size", "alpha", "point", "subject"))
    stop("invalid style")

  ##dur is specific to MASSVIS
  if (style=="size"){
    grid.circle(x=unit(et$x, "native"), y=unit(et$y,"native"), r=et$dur/10000, 
                gp=gpar(fill="red", col=NA, alpha=0.1))
  } else if (style=="alpha"){
    grid.circle(x=unit(et$x, "native"), y=unit(et$y,"native"), r=0.03, 
                gp=gpar(fill="green", col=NA, alpha=et$dur/1000)) ##divide by 1000?
  } else if (style=="point"){
    grid.circle(x=unit(et$x, "native"), y=unit(et$y,"native"), r=0.01, 
                gp=gpar(fill="blue", col=NA, alpha=0.5))
  } else if (style=="subject"){
    grid.circle(x=unit(et$x, "native"), y=unit(et$y,"native"), r=0.01, 
                gp=gpar(fill=as.factor(et$subject), col=NA, alpha=0.5))
  }
}


