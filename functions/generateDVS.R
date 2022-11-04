generateDVS <- function(img, outname="img", outpathM=getwd()) {
  UseMethod("generateDVS")
}
#filepath
generateDVS.character <- function(img, outname="img", outpathM=getwd()) {
  #Write .m file and return paths for outputs
  paths = writemfile(img, outname, outpathM)
  #Run .m file
  system('matlab -batch dvs_temp') 
  file.remove("dvs_temp.m")
  #Return saliency map object containing matrix and model type
  saliencyMap(as.matrix(read.csv(paths$dvs, header=FALSE)), model="dvs")
}
#raster
generateDVS.raster <- function(img, outname="img", outpathM=getwd()) {
  #Save raster as a temporary image
  file = tempfile(fileext = ".png")
  png(file, width=ncol(img), heigh=nrow(img))
  grid.raster(img)
  dev.off()
  generateDVS(file)
}
#array
generateDVS.array <- function(img, outname="img", outpathM=getwd()) {
  #Change array into a raster
  generateDVS(as.raster(img))
}
#imgr
generateDVS.imgr <- function(img, outname="img", outpathM=getwd()) {
  #Save imgr object as temporary image
  file = tempfile(fileext = ".png")
  png(file, width=ncol(img), heigh=nrow(img))
  grid.raster(imgr$img)
  dev.off()
  generateDVS(file)
}
