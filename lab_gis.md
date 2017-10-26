# Lab: Spatial Analysis

This lab is designed with Justin Madron, UR Digital Scholarship Lab. 

Goal: Georeference a HOLC map using ArcGIS.


## Data

Go to [Box](https://tinyurl.com/introdhspatial). Pick a map. 
To download, click the  '...' by your city and select 'Download'. 
It will provide a zip file. Save to the Desktop.
Select the file and 'Extract All'.

Inside the folder are two files.
- Shape File
- Image of the Map


## ArcMap: Georeferencing 

Think of this as connecting a paper map/ image to a base map with spatial coordinates.
We are embedding coordinates in the paper map.
We are building spatial data. 
The power comes with the layers of data we build. 

So, what do you georefence to?
There are different projections for different things. 
Need to think about your end goal (ex. Nautical use? Roads?).
There will always be distortions (ex. distance, direction).
For example, google uses Web Meractor. 
For some humor about projections, see this  XKCD [comic](https://xkcd.com/977/).

We have historic maps but we are georeferncing to a base map from today. 
What are some challenges for georeferencing a historic map to a contemporary base map ? 
For example, there are new roads. 

### Adding Data 
Launceh ArcMap. 

#### Base Map

Select the 'Add Data' button.  
Then select 'Add Basemap'.
Select 'Topographic'.
Now we have the map we will be georeferencing to. 

####  City Data

Select the 'Add Data' button.  
Go to "Folder Connections".
Then click the folder with a plus sign on the right. 
Connect to Desktop and you should see your city folder. 
In "Add Data", select your .jpg map.

It will say you are missing spatial data. This is ok. 
If it asks if you should create pyramids, select yes.

So, where did my map go?
The image of the city will be at Lat 0/Long 0.
It also will be a layer in your table of contents. 

### Georeferencing

Right click in ArcGIs and a series of tools will appear.
Select "Georeferencing".
A toolbar will appear. This has  the tools we need to connect our two maps. 

Now we want to add points. 
We want to make sure to select points across the map.
Otherwise, of you concentrate them, it will warp the map to that set of points.

One way to make this process easier is to move your historic map as close as possible to the same area on the base map.
Zoom in on the base map so it appears to match the geographic area featured on your historic map.
Select "Georeferencing" and select "Fit to Display". 
You can't do this once you start adding Control Points, so make sure this looks like you want it.



#### Adding a Control Point 
The hardest part is finding your first point. 

Select the X->X icon in the georeferencing toolbar.

To make it easier to see our map, we can adjust the layer opacity.
Click on the Layer -> Properties -> Right click on a layer -> Layer Properties
Click on Display and there you can adjust the transparency. 
This will allow you to see both maps at once.

A strategy is to use roads to find the first point.
Select a road to connect.
Select the X-> X icon and click on your map image.
Turn off the image map layer.
Click on the base map. 

Make sure to tag the first point on the historic map (Source) and the second point on the base map (Target).
It must be done in this order. 

Now, add 5-10 points across the map!

#### Remove a Point
In the georeferencing toolkbar, select  "Link Table".
"Souce" - Historic map/ the jpeg
Target -  base map 
Select the point and hit delete. 

### Saving the Map

Georeferncing -> Rectify

A "Save AS" screen appears. 

NoData: [Make Sure this is blank]

Output Location:  Create a new folder and call it "NAMEOFCITY_LASTNAME_rectified"

Format: PNG

Name: NAMEOFCITY_LASTNAME_rectified.png

This creates a new file on your computer with multiple files in it. 
Load this folder to Box. 

For more on georeferencing HOLC maps, see the [Mapping Inequality guide](http://dsl.richmond.edu/projects/holc_manual/HOLC_manual.pdf). 

