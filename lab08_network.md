**Goal:** Today, we are going to build an interactive network of citations between
legal decisions constructed by the Supreme Court. The current data stretches from
1947 to 2001 and includes over 7000 cases.

### Step 1: Download R

The next step is to download and install R for your computer (most of you should
already have done this). To do so, following the following link and proceed with
the prompts:

- [https://cran.r-project.org/](https://cran.r-project.org/)

Once downloaded, install the dmg or exe file as you would any software.

### Step 2: Install R packages

Now, we need to install several add-ons to the R language. We can do this from
within R. Open the program. Then, copy and paste the following lines one by one
into the R terminal:

```{r}
install.packages("igraph")
install.packages("dplyr")
install.packages("readr")
install.packages("plotly")
install.packages("viridis")
install.packages("stringi")
```

It may ask you some questions and I'll help you answer those. Note that this may
take a few minutes as each of these packages requires other packages, none of
which you have yet.

Notice that I don't have to run these lines on my machine. These only has to be
run once and then they are installed for good.

### Step 3: Grab functions and data

This time we can grab all of the functions and datasets needed for our visualizations
directly from within R. No need to download any files or copy large amount of code.
Simply run the following line in R to download the required functions:

```{r}
source("https://statsmaths.github.io/dh-network-lab/funs.R")
```

Once that is done, the next bit of code will load the entire corpus of Supreme
Court Citations into R:

```{r}
load_data()
```

If there are no errors (warnings are okay) or messages about missing packages, you
should be ready to go.

### Step 4: Select topics of interest

Next, you will want to select which topics of law to visualize. Here, for the demo,
I'll select the two codes regarding de-segregation:

```{r}
select_topic_cites(20040, 20050)
```

For a list of all the available codes, see [this table](https://github.com/statsmaths/dh_network_lab/blob/master/issue_codes.csv).
You can select as many issues as you want by seperating them with commas in the
call to the function `select_topic_cites`. You can also re-run just this function
with new codes to modify the plots in the next step.

### Step 5: Plot the data

You can now create an interactive plot of your network!
There are several functions available for plotting the network using
different coloring schemes for the nodes. The graph shows links between
two cases where one case cited the other case in the decision.
Try these one at a time:

```{r}
plot_year()
plot_vote()
plot_issue()
plot_centrality()
plot_cluster()
plot_gatekeeper()
```

When you run the function, it should open a web browser with an interactive
graph. Hovoring over a node will show the name of the case, the year of the
case, and an id called USID. The latter is useful to looking up the case online.
You should find that the most central cases have lots of third-party information
about them. Wikipedia is a good place to look if a link shows up. For all cases,
the USID search should at a minimum turn up the original decision text.

The following are ways to color code the network based on metadata:

- **Year**: Color coded the node according to the year of the case. 
- **Issue**: Color coded the node according to the area of law. 
- **Vote**: Colod coded based on the number of justices casting a dissenting votes for the case.

The following are calculations based on network properties: 

- **Centrality**:  Identifies the most important node/ vertices in a network.   
- **Cluster**: A set of nodes that cluster together within a larger network. They are also known as communities. There can be muliple communities in one network.  The clusters are algorithmically learning groupings of nodes that are are cited by one another.
- **Gatekeeper**: Find nodes that links disparate parts of the citation network. They tend to be the node or set of nodes that connect different communities.  

### Step 6: Co-citations

Finally, you can also run the function `select_topic_cocites` instead of 
`select_topic_cites`, as such:

```{r}
select_topic_cocites(20040, 20050)
```

Graphics made after calling this data will link any two cases that were 
both cited by a third case a minimum of 9 different times. This is called
a co-citation graph (rather than a citation graph). Compare this with the
citation graph; which one do you think tells a more cohesive or interesting
story? Can you see different patterns in the two



