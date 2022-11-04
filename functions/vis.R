vis <- function(type, imgr, saliencyMap="", et="", style="", desaturated=TRUE){
  if(!inherits(imgr, "imgr"))
    stop("Invalid raster image object")
  
  #Original or desaturated version of the image
  if (desaturated) img = imgr$desaturated
  else img = imgr$img
  
  #Visualise according to type specified
  if (type=="saliency") saliencyvis(saliencyMap, img)
  if (type=="eyetracking") eyetrackingvis(imgr, img, et, style, etonly=FALSE)
  if (type=="both"){
    saliencyvis(saliencyMap, img)
    eyetrackingvis(imgr, img, et, style, etonly=TRUE)
  }
}