readMASSVIS <- function(dir, subject=NULL){
  #All subjects' data or just one subject
  if (is.null(subject)) 
    files = list.files(dir, pattern="..?\\.csv")
  else 
    files = list.files(dir, pattern=paste0(subject,".csv"))
  
  df = lapply(paste0(dir,"/",files), read.csv)
  rows = unlist(lapply(df, nrow))
  subject = rep(substr(files, 1, nchar(files)-4), rows)
  df = data.table::rbindlist(df, use.names=FALSE)
  df = cbind(df, subject)

  names(df) = c("row","x","y","dur","subject")
  et(x=df$x, y=df$y, dur=df$dur, subjects=df$subject)
}

#Read in other type of data and create et object
#readOther <- function(...){
#df = read a file here
#et(x=.., y=.., ...)
#}
