saliencyMap <- function(matrix, model){
  saliencyMap = list(map=matrix, model=model)
  class(saliencyMap) = "saliencyMap"
  saliencyMap
}
