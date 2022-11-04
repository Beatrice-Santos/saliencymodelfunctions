roc <- function(imgpath, map, et) {
  UseMethod("roc")
}
roc.character <- function(imgpath, map, et) {
  writerocfile(imgpath, map, et)
  system('matlab -batch roc_temp') 
  rocresult = read.table("roc_score.txt")[1,1]
  file.remove(c("roc_temp.m", "roc_score.txt", "fix_temp.csv","map_temp.csv"))
  rocresult
}

