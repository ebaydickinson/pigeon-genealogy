##load packages###
library(tidyverse)
library(magrittr)
library(plyr)
library(dplyr)
library(ggplot2)
library(ggenealogy)
library(igraph)

install.packages("ggenealogy")
install_github("lindsayrutter/ggenealogy")
install.packages("igraph")

#pull up guide for ggenealogy
help(package="ggenealogy")

#want to build a genealogical tree
#make sure that parents that have repartnered are represented

#set working directory to your file
#Files -> More -> Set working directory

#read in file (pigeonGen.csv)
#Use tidyverse for all notation
gen = read_csv("pigeonGen.csv")
#reformatted data to what R will excel 
#two repeating child entries (one for each M/F parent)
newGen = read_csv("genFormat.csv")

#convert data fram (newGen) to a graph object
#name it ig
 ig <- dfToIG(newGen)
 class(ig)

#now you can find generational degree of separation
#pretty fun
getDegree("BY", "BB", ig, newGen)

#######plotting######

#using "plot ancestral descendents", 
#will plot a graph for pigeon BY.
# 1 & 2 represent generations you want
plotAncDes("BY", newGen, 1,2)

#you can change colors as well using ggplot2
plotAncDes("BY", newGen, vColor = "blue") + 
  ggplot2::labs(x = "Generation index", y = "")

#plot pi as a parent and see the number of children!
plotAncDes("pi", newGen, mAnc = 6, mDes = 6, vCol = "blue")

#Next steps, I want to use igraph to display the whole genealogy

##practice datasets#####
plotPathOnAll(pathNT, sbGeneal, ig, "devYear", bin = 3)

data("sbGeneal")
data("statGeneal")





