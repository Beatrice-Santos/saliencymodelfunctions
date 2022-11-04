#############################
R FILES, FUNCTIONS and INPUT
#############################

example.R 		Code example. Shows how a user might use the following
			collection of functions with the image
			economist_daily_chart_5.png from the MASSVIS collection.

<<<<<<< HEAD:.README.txt
#############################
Located in 'functions' folder
#############################	
=======
#########################
Located in 'edit' folder
#########################	
>>>>>>> 4c67c149ced643e56ab742cbc9d4632897f598e3:README.txt

* if starred, function can be used by user. Otherwise, helper function.

################# Generates saliency models and output

generateDVS.R*	> generateDVS(img, outname="img", outpathM=getwd())
 			Takes in an image, output name and output path.
			Writes the .m file required to generate saliency maps
			using writemfile(). Runs the code in Matlab to generate 				
			outputs and returns a saliencyMap object created using 				
			saliencyMap() for the DVS model. Can take a filepath, 				
			raster, array, or imgr object as image input.

generateGBVS.R*	> generateGBVS(img, outname="img", outpathM=getwd())
			Takes in an image, output name and output path.
			Writes the .m file required to generate saliency maps
			using writemfile(). Runs the code in Matlab to generate 				
			outputs and returns a saliencyMap object created using 				
			saliencyMap() for the GBVS model. Can take a filepath, 				
			raster, array, or imgr object as image input.

writemfile.R	> writemfile(imgpath, outname="img", outpathM="")
			Takes in an image path, output name and output path.
			Writes the .m file required to generate saliency maps
			in Matlab. Returns a list containing the paths for the
			DVS and GBVS Matlab saliency model output.

saliencyMap.R	> saliencyMap(matrix, model)
 			Takes in a matrix and type of saliency model. Stores the 				
			matrix and model information in a list and changes the 
			class object to 'saliencyMap'.

################# Turns image into an imgr object

imagevis.R*		> as.imgr(img)
			Takes in an image and turns it into a matrix in its original
			and desaturated form. Turns image into an imgr object using 				
			imgr().

imgr.R		> imgr(imgr, imgr2, dim)
			Takes in the matrix of an image and desaturated version of 
			the image, and its dimensions and turns it into an imgr object.

################# Reads in MASSVIS eye tracking data

readMASSVIS.R*	> readMASSVIS.R(dir, subject=NULL)
			Takes in path where MASSVIS eye tracking data are located
			and subject. If subject is NULL, reads all subjects' eye tracking
			data in, otherwise only reads the specified subject's eye tracking. 
			Returns eye tracking data as an et object using et().

et.R			> et(x, y, ...)
			Takes in eye tracking data in the form of a vector of x and y 
			coordinates. Returns an et object.

################# Visualises image, map and/or eye tracking data

vis.R*		> vis.R(type, imgr, saliencyMap="", et="", style="", desaturated=TRUE)
			Draws saliency map and/or fixations on top of an image. User 
			can specify the 'type' to change what to draw - "saliency", 
			"eyetracking" or "both". Takes in an imgr object, saliencyMap and eye
			tracking data. If wanting to visualise eye tracking data, can specify
			the style the dots should be in. Can also specify if they want
			to use the original or desaturated versions of the image. Uses
			saliencyvis() and/or eyetrackingvis() to create visualisation.

saliencyvis.R	> saliencyvis(saliencyMap, img)
			Takes in a saliencyMap object and image. Visualises the saliency 
			map on top of the image.

eyetrackingvis.R	> eyetrackingvis(imgr,
                           img,
                           et,
                           style="size",
                           etonly=FALSE,
                           ...)
			Takes in an imgr object, img, et object and style. 
			Visualises the eye tracking data on top of the image in 
			the style specified.

			> displayeyetracking(et, style="size", ...)
			Takes in et object and style. Sets parameters of 
			grid.circle() accordingly to draw desired style.

################# Calculate ROC metric

roc.R*		> roc(imgpath, map, et)
			Takes in image path, saliency map and et object. Writes and runs
			.m file required to calculate ROC metric in Matlab.

writerocfile.R	> writerocfile(imgpath, map, etTable)
			Writes the .m file required to calculate ROC metric in Matlab.

###########################
Located in 'source' folder
###########################
	
economist_daily_chart_5.png		Image used in example. From the MASSVIS data set.
						Shows cremations as a percentage of all deaths.

dvs_economist_daily_chart_5		R object of DVS model output from Matlab.
gbvs_economist_daily_chart_5		R object of GBVS model output from Matlab.

etdata					R object of all eye tracking data for
						economist_daily_chart_5.png including all subjects.

rocdvs_economist_daily_chart_5	R object of DVS model ROC value from Matlab.
rocgbvs_economist_daily_chart_5	R object of GBVS model ROC value from Matlab.