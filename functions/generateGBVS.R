generateGBVS <- function(img, outname="img", outpathM=getwd()) {
  UseMethod("generateGBVS")
}
#filepath
generateGBVS.character <- function(img, outname="img", outpathM=getwd()) {
  #Write .m file and return paths for outputs
  paths = writemfile(img, outname, outpathM)
  #Run .m file
  system('matlab -batch dvs_temp') 
  file.remove("dvs_temp.m")
  #Return saliency map object containing matrix and model type
  saliencyMap(as.matrix(read.csv(paths$gbvs, header=FALSE)), model="gbvs")
}
#raster
generateGBVS.raster <- function(img, outname="img", outpathM=getwd()) {
  #Save raster as a temporary image
  file = tempfile(fileext = ".png")
  png(file, width=ncol(img), heigh=nrow(img))
  grid.raster(img)
  dev.off()
  generateGBVS(file)
}
#array
generateGBVS.array <- function(img, outname="img", outpathM=getwd()) {
  #Change array into a raster
  generateGBVS(as.raster(img))
}
#imgr
generateGBVS.imgr <- function(img, outname="img", outpathM=getwd()) {
  #Save imgr object as temporary image
  file = tempfile(fileext = ".png")
  png(file, width=ncol(img), heigh=nrow(img))
  grid.raster(imgr$img)
  dev.off()
  generateGBVS(file)
}
