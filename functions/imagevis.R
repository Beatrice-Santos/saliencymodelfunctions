as.imgr <- function(img) {
  #Raster image
  imgr <- as.raster(img)
  imgr <- as.matrix(imgr)
  dim <- dim(imgr)
  #Desaturate the image
  imgr2 <- desaturate(imgr)
  imgr2 <- matrix(grey(imgr2[1,]/256), nrow=dim[1], ncol=dim[2])
  #Return imgr object
  imgr(imgr, imgr2, dim)
}