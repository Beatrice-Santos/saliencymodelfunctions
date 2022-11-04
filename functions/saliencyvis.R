#Load libraries
library(ggplot2)
library(grid)
library(jpeg)
library(png)
library(colorspace)

saliencyvis <- function(saliencyMap, img){
  if(!inherits(saliencyMap, "saliencyMap"))
    stop("Invalid saliency map object")
  
  #Matrix of colours according to saliency map
  saliencyMapalpha = rgb(0, 1, 0, alpha=saliencyMap$map)
  dim(saliencyMapalpha) = dim(saliencyMap$map)
  
  #Draws saliency map on top of image
  grid.newpage()
  grid.raster(img)
  grid.raster(saliencyMapalpha)
}

