imgr <- function(imgr, imgr2, dim){
  if(!(inherits(imgr,"matrix")))
    stop("imgr must be a matrix")
  imgr = list(img=imgr, desaturated=imgr2, dim=dim(imgr))
  class(imgr) = "imgr"
  imgr
}