# Defects detection - Bachelor thesis

The method proposed uses a machine vision system which involves the detection of surface defects in aluminum parts using image processing techniques in combination with an alternative method of edge detection. In addition, an advanced learning process has been developed to clearly identify and classify surface defects, based on feedforward neural networks used for pattern recognition.

## Table of contents

* [Technologies](#technologies)
* [General info](#general-info)

## Technologies
Project is created with:
* Mathworks Matlab

## General info
For the development of the algorithm, we designed in the laboratory a special base in order to better position the parts and decrease the influence of the environmental light. We also designed a lighting panel for their illumination which consists of LEDs placed uniformly, creating a diffused illumination of the parts. The picture of the examined part is captured by a phone camera.

This particular algorithm was created for this specific item. However with some changes it can be used for a variety of items. 
There is 2 versions one for the final project and one live demo.
Due to the low resolution of the camera, the size and the position of the defects, we chose to capture 6 pictures in total, 3 on each side
	
The input in the algorithm is added through Input.m and then the user only need to run the Run.m.
In Run.m different processes are taking place.

First the parts are classified as normal or defective.
 
Then in Basic_Processing.m , the images are transformed to acquire the same position and rotation and then they are pre-processed with usual image processing techniques such as grayscale conversion, contrast enhancement, sharpening and background removal.

Afterwards, in the preprocessed images, we define regions of interest (ROIs) which are the areas where empirically we know the defects typically appear (Regions_of_interest
.m) . Through numerical processing of the images, the ROIs are extracted from the rest of the part in order to minimize computational cost and maximize the processing speed. Then they are processed further in order to eliminate noise and remove the edges.

The edges consist of dark pixels, similarly to the defects, and as a result, it is preferable to remove them in order to prevent errors during the computation of the data. For the edge extraction, a binary mask and a filter were used. Specifically, the mask classifies image pixels as belonging to either the ROI or the background and then sets the pixel values of the background to zero. The filter sets to zero pixels values with brightness smaller than 140-180 (depending on the area and its characteristics).

Next, from the above areas, we compute the below statistical data as well as data derived from the modified edge detection(statistics_of_region.m). For every ROI, we calculate:
•	Mean values and standard deviation
•	The number and mean values of pixels from which the grey value is below a number
•	Mean value and standard deviation of the gradient magnitude
•	Number of white pixels which are derived from edge detection
In detail, during edge detection, the algorithm identifies the pixels where the magnitude of the gradient is higher. The image pixels of the defects are darker than the non-defective, and as a result, the gradient in those areas is greater. Thus, we apply MATLAB's function for edge detection to ROIs where the edges were removed and only the area under consideration is left. In the resulting image, we measure the white pixels.

For each side (front and back) we calculate the sum of the above attributes and we extract diagrams , where the non-defective parts are represented with a blue line and the defective parts with orange.

The above attributes are then used as input values for the machine learning algorithms developed. In the present study, we investigated two methods that are most commonly used for classification and pattern recognition, Artificial Neural Networks (ANN) and Support Vector Machines (SVM).
