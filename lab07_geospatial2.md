


**Goal**: Add block groups to a georectified map using GIS. 

**Tool**: ArcMap

## Accessing Data

Block Groups: Go to box -> Day 2 -> blk_group2010 data and download the folder to the Desktop.
Unzip the file.

Georectified Map: We are going to be using [Mapping Inequality](http://dsl.richmond.edu/panorama/redlining) maps.

In order for a map to be precise, it often needs hundreds of points.
To help facilitate the process, we already have maps that have been georectified.
Students working for the DSL have added hundreds of points to each of these maps.

Go to [Mapping Inequality](http://dsl.richmond.edu/panorama/redlining) and select a map. Download by clicking on the cloud and selecting `Georectified(zip)`. 
Once downloaded, unzip the file.


## Loading Data

Open ArcMap.

We are going to start stacking data. This is the power of GIS.

We do not need a base map this time as we've georectified our map.
You can add a base map, but it isn't necessary (Selection -> Add Basemap).

Go to `Add Data`. Select `Connect A Folder`. Select `Desktop`.
This gives us access to our `Desktop` files.
Now lets add in our block group information. Click through to the .shp file.


### Block Groups and Census Tracts

The census uses different variations of boundaries to collect data. It is usually counties and states.
What they have started to do is collect blocks. These are block groups.

Let's take a look at the data.
Go to the block group folders -> open the .csv file
Here is the data about race.
We can see what we are looking at by comparing the codes with the Codebook (codebook.txt in the folder).

GISJOIN - This is how you can join excel style data to spatial data.  
Each block has a unique GISJOIN that is unique to the block group.  
In other words, each block is a row and then we see the different variables.
We have already joined the blocks with the data about race for you.


## Add Data

Go to ArcMap.

Add `Data` -> Select your historic map (nameofcity.tif).

You may get a warning. This is ok.
Now select the historic map layer and select `Zoom To Layer`.


### Block Groups

Go the the Block Groups layer -> Right Click - Select `Open Attribute Table`
You'll see a bunch of headings.
We want to change this into something we understand.


Right click on `blck_gro_p` -> Go to  `Properties` -> Zoom all the way to the right.
Change blck_group fields at the end. Change the `alias` for each row. 
It corresponds to the codebook section called `NHGIS code: JMB`.

Once done, the final 7 left columns should be labeled:
Total
White alone
Black



### Adding Block Groups to the Historic Map
Right click on the block group layer -> `Properties` ->  `Symbology`  -> `Quantities` -> `Value`.
Now we see our labels.
Select `White Only`.  You'll see a set of buckets.
You can change the colors but by default what we see if that it the block is a dark red, it is very white.

To get actual numbers, click the identify button next to the arrow.
Scroll down and you'll see info about that exact block.



### See the Historic Map
Right click on the historic map layer.
Select `Properties` -> `Display` -> `Transparency`



## Saving Your Maps
We are moving everything into the block group folder.
Copy the rectified folder and past into the block group folder.

In ArcMap, go to `File` - `Save As` -> name it "STATECODE_NAMEOFCITY_map" and save it in the block group folder.

To open, go to ArcMap.

Select `File` -> `Map Document Properties`
Select `Pathnames` ->  `Store relative pathnames to data sources`. Hit `apply`, then `ok`.

Make sure your block group folder includes your name. Ex. blck_group_2_010data_lauren
Upload your folder to box. To speed it up, zip the file.


 ## Screenshots

There is screen capture tool called `Snipping Tool`.
It allows you to grab your screen and save the image.







