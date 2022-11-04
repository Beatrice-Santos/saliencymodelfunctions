et <- function(x, y, ...){
  et = data.frame(x, y, ...)
  class(et) = c("et", class(et))
  et
}
