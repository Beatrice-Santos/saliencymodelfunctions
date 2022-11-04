writemfile <- function(imgpath, outname="img", outpathM="") {
  #Where to save model outputs
  outpathM = file.path(outpathM, outname)
  
  #Text for .m file
  t = paste0(
    '%Read in image\n',
    'img = imread("', imgpath, '");\n',
    '%DVS\n',
    'dvsout = dvs(img);\n',
    '%Saliency map output\n',
    'imwrite(heatmap_overlay(img, dvsout.master_map_resized), "', 
    outpathM, '_dvs.png");\n',
    '%Master map resized output\n',
    'writematrix(dvsout.master_map_resized, "', 
    outpathM, '_dvs.csv")\n',
    '%GBVS\n',
    'ikout = ittikochmap(img);\n',
    'imwrite(heatmap_overlay(img, ikout.master_map_resized), "', 
    outpathM, '_gbvs.png")\n',
    'writematrix(ikout.master_map_resized, "', 
    outpathM, '_gbvs.csv");'
  )
  
  #Write out .m file in current directory.
  writeLines(t, "dvs_temp.m")
  
  #Return file paths for both DVS and GBVS models
  dvspath = paste0(outpathM, '_dvs.csv')
  gbvspath = paste0(outpathM, '_gbvs.csv')
  list(dvs=dvspath, gbvs=gbvspath)
}
