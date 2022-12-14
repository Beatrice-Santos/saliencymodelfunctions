##This script runs through how a user might use the collection of functions
##that have been created for the purpose of exploring saliency maps for
##data visualisations.

###Do to time constraints or data privacy, some R objects that would have been
###outputs of the functions have been provided.

#Source function files
source("functions/generateDVS.R")
source("functions/generateGBVS.R")
source("functions/writemfile.R")
source("functions/imagevis.R")
source("functions/imgr.R")
source("functions/vis.R")
source("functions/saliencyvis.R")
source("functions/eyetrackingvis.R")
source("functions/et.R")
source("functions/readMASSVIS.R")
source("functions/saliencyMap.R")
source("functions/roc.R")
source("functions/writerocfile.R")


##We will be using the economist_daily_chart_5.png image from the MASSVIS dataset.
imgname = "economist_daily_chart_5"
imgpath = paste0("source/",imgname,".png")
##Read in image
img = png::readPNG(imgpath)
##Convert image to an imgr object. 
###Ensures image is in the correct format for other functions.
imgraster = as.imgr(img)

##Read eye tracking data
#fixpath = "source/enc"
#etdata = readMASSVIS(dir=fixpath, subject=NULL)

###Eye tracking data that has been turned into an et object is provided below.
etdata = readRDS("source/etdata")

##Run DVS and GBVS model
#dvsModel = generateDVS(imgraster, outname=imgname, outpathM=outpathM)
#gbvsModel = generateGBVS(imgraster, outname=imgname, outpathM=outpathM)

##Since the above matlab code takes a long time to run, the following are
##saved outputs of the DVS and GBVS models
dvsModel = readRDS(paste0("source/dvs_", imgname))
gbvsModel = readRDS(paste0("source/gbvs_", imgname))

#Visualise saliency map
vis(type="saliency", imgr=imgraster, saliencyMap=dvsModel, 
    desaturated=TRUE)

#Visualise eyetracking data using different circle styles
vis(type="eyetracking", imgr=imgraster, et=etdata, style="size", 
    desaturated=TRUE)
vis(type="eyetracking", imgr=imgraster, et=etdata, style="point", 
    desaturated=TRUE)
vis(type="eyetracking", imgr=imgraster, et=etdata, style="subject", 
    desaturated=TRUE)

#Visualise both saliency map and eye-tracking
vis(type="both", imgr=imgraster, saliencyMap=dvsModel, et=etdata, 
    style="point", desaturated=TRUE)

##Calculate ROC values
#roc_dvs = roc(imgpath, dvsModel, etdata)
#roc_gbvs = roc(imgpath, gbvsModel, etdata)

##Since the above matlab code takes a long time to run, the following are
##saved ROC value outputs of the DVS and GBVS models
roc_dvs = readRDS(paste0("source/rocdvs_", imgname))
roc_dvs
roc_gbvs = readRDS(paste0("source/rocgbvs_", imgname))
roc_gbvs

##The DVS model has a higher ROC metric than the GBVS model, suggesting it 
##is a better performing model for this particular data visualisation.
