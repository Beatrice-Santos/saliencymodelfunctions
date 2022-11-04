writerocfile <- function(imgpath, map, etTable){
  
  write.csv(map$map, file="map_temp.csv", row.names=FALSE)
  write.csv(etTable, file="fix_temp.csv")
  
  t = paste0(
    "img = imread('", imgpath, "');\n",
    "map = table2array(readtable('map_temp.csv'));\n",
    "fix = readtable('fix_temp.csv');\n",
    "score = rocScoreSaliencyVsFixations(map, fix.x, fix.y, size(img));\n",
    "writematrix(score, 'roc_score.txt');\n"
  )
  #Write .m file in current directory. Will be deleted once roc() is run
  writeLines(t, "roc_temp.m")
}