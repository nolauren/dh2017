# Lab: Spatial Analysis

Goal: Georeference a HOLC map using ArcGIS.


## Data

Go to [Box.](https://tinyurl.com/introdhspatial). Pick a map. 
To download, click the  '...' by your city and select 'Download'. 
It will provide a zip file. Save to the Desktop.
Select the file and "Extract All".

Inside the folder are two files.
- Shape File
- Image of the Map


## ArcMap: Georeferencing 

We are connecting a paper map/ image to a base map with spatial coordinates.
It embeds these coordinates in the paper map.
We building spatial data. 
The power comes with the layers of data we build. 

What do you georefencing to?
Need to think about your end goal (Ex. Nautical use? Roads?).
There are different projections for different things. 
There will always be distortions (Ex. distance, direction).
For example, google uses Web Meractor. 
For some fun, see this [comic](https://xkcd.com/977/).

What are some challenges to georeferencing today? 
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


The image of the city will be at Lat 0/Long 0.
It also will be a layer in your table of contents. 

### Georeferencing

Right click in ArcGIs and a series of tools will appear.
Select "Georeferencing".
A toolbar will appear.

Now we want to add points. 
We want to make sure to select points across the map.
If you concentrate them, it will warp the map to that set of points.


Select "Georeferencing" and select "Fit to Display". 
The hardest part is finding your first point. 

#### Adding a Control Point 
Select the X->X icon in the georefering toolbar.

To make it easier to see our map, we can adjust the layer opacity.
Click on the Layer -> Properties -> 

A strategy is to use roads to find the first point.
Select a road to connect.
Select the X-> X icon and click on your map image.
Turn off the image map layer.
Click on the base map. 

#### Remove a Poiint
In the georeferencing toolkbar, select  "Link Table".
"Souce" - Historic map/ the jpeg
Target -  base map 
Select the point and hit delete. 



Go to "Connect to Folder". (It's the icon with the folder and plus sign.) 

"Browse to your folder. 
Click on the CITY_Shapefile folder.  
Add the shapefile. 

What do you see?

It is the 2010 Census Tiger line data set.

Next, we need to add our city map.  Go to 'Add Data' and select STATE_CITY_DATE.jpg.

Open the [ Georeferencing Training Manual](https://github.com/introdh2016/other/blob/master/HOLC%20Georeferencing%20Training%20Manual.pdf) and turn to "Step 4" on page 17 of the PDF.

When you are done, save your work back to Box. 

## Working with Georectified Map 

Download your city zip file from the Day_2 Folder. Save to desktop. Unzip the folder. 

Launch ArcMap. 

Select the 'Add Data' button.  Go to "Connect to Folder". (It's the icon with the folder and plus sign.) "Browse to your folder. Add the CITY_STATE_NEW.png.  Then add the census data. Go to state folder and click on Census_2010. Add the Census_track_2010.shp.

To see the city map, drag the city layer to the top.

##  Explore Census info

Right click on the Census_tract_2010. Select Properties -> Symbology. Change the "Show" on the left side to Quantities. Once there, you can change the "Value" to White, Black or another category. Make sure to normalize by total population ("Total"). You can adjust the number of buckets. Explore!

To make the city map transparent: Right click on the CITY_STATE_NEW.png. Select Properties -> Display -> Transparency and adjust as you see fit. 

## Information
 If you want to see more data about the census tract,  click on the "i" button next to the cursor button on the top toolbar (right below Geoprocessing). 
 
## Legends
On the botton right corner, there is a Layout view.  Click on Layout view.   Go to Insert -> Legend.  In "Legend Items" put "Census_tracts_2010".   Give your map a Title.  Play around with the Legend Frame.   If you want to zoom in to show a particular part of the map, you can go to the top left where there is a zoom buttom (magnifying glass with a + sign). 
 
## Export 
 File -> Export Map -> .JPG
 
##Explore Neighborhoods
To explore neighborhoods go to dsl.richmond.edu/panorama/redlining
 

