## Coursera Course Project 2 - "Exploratory Data Analysis" Johns Hopkins University, Bloomberg School of Public Health ##

**Date:** 07-26-2015

**Course Student:** [DataRacer11](https://github.com/DataRacer11)

**File Name:** ExploratoryTotalNEI.R (contains all plotting code for all six questions in one .R file).

**Project Location:** [https://class.coursera.org/exdata-030/human_grading/view/courses/975125/assessments/4/submissions](https://class.coursera.org/exdata-030/human_grading/view/courses/975125/assessments/4/submissions)

**Data file location:** [https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip]( https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip)

**References:** 

**Exploratory Data Analysis with R, The Book + Lecture Videos (HD) + Datasets + R Code Files** [by Roger D. Peng, PhD](https://leanpub.com/exdata)

**ggplot2 and plyr** [by Hadley Wickham](http://had.co.nz/) 

##Introduction 
###Information about the study design

Fine particulate matter (PM2.5) is an ambient air pollutant for which there is strong evidence that it is harmful to human health. In the United States, the Environmental Protection Agency (EPA) is tasked with setting national ambient air quality standards for fine PM and for tracking the emissions of this pollutant into the atmosphere. Approximately every 3 years, the EPA releases its database on emissions of PM2.5. This database is known as the National Emissions Inventory (NEI). You can read more information about the NEI at the [EPA National Emissions Inventory web site.](http://www.epa.gov/ttn/chief/eiinformation.html)

For each year and for each type of PM source, the NEI records how many tons of PM2.5 were emitted from that source over the course of the entire year. The data that you will use for this assignment are for 1999, 2002, 2005, and 2008.

### Data

The data for this assignment are available from the course web site as a single zip file:

- [Data for Peer Assessment [29Mb]](https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip)

The zip file contains two files:

PM2.5 Emissions Data ```(summarySCC_PM25.rds)```: This file contains a data frame with all of the PM2.5 emissions data for 1999, 2002, 2005, and 2008. For each year, the table contains number of tons of PM2.5 emitted from a specific type of source for the entire year. Here are the first few rows.

#### Information about the variables:

![](http://i.imgur.com/vnbfQQh.png)


```fips:``` A five-digit number (represented as a string) indicating the U.S. county

```SCC:``` The name of the source as indicated by a digit string (see source code classification table)

```Pollutant:``` A string indicating the pollutant

```Emissions:``` Amount of PM2.5 emitted, in tons

```type:``` The type of source (point, non-point, on-road, or non-road)

```year:``` The year of emissions recorded

Source Classification Code Table ```(Source_Classification_Code.rds)```: This table provides a mapping from the SCC digit strings in the Emissions table to the actual name of the PM2.5 source. The sources are categorized in a few different ways from more general to more specific and you may choose to explore whatever categories you think are most useful. ***For example, source “10100101” is known as “Ext Comb /Electric Gen /Anthracite Coal /Pulverized Coal”.***

Read each of the two files using the ```readRDS()``` function in R. For example, reading in each file can be done with the following code:

![](http://i.imgur.com/EBo8HcF.png)

Each of those files must be in the current working directory (check by calling ```dir()``` and see if those files are in the listing).

### Assignment

The overall goal of this assignment was to explore the National Emissions Inventory database and see what it say about fine particulate matter pollution in the United states over the 10-year period 1999–2008. Use R packages to support the analysis.

### Making and Submitting Plots

For each plot the following was developed to make simple observations in an effort to respond to each of the assignment questions:

1. Constructed the plots and saved plots to PNG files.

2. Created a separate R code file (plot1.R, plot2.R, etc.) that constructs the corresponding plot, i.e. code in plot1.R constructs the plot1.png plot. Code includes code for reading the data so that the plot can be fully reproduced. Included the code that creates the PNG file. Only included the code for a single plot (i.e. plot1.R only includes code for producing plot1.png)
 
3. Uploaded the PNG files on the Assignment submission page
 
4. Copied and pasted the R code from the corresponding R files into the text box at the appropriate point in the peer assessment.

### Installing the R Packages in RStudio

#### Information about the summary choices made for R packages used:
R packages [by Hadley Wickham](http://had.co.nz/) were used below because ```dplyr``` makes data manipulation easy by:

1. Elucidating the most common data manipulation operations, so that options are helpfully constrained when thinking about how to tackle a problem.
2. Providing simple functions that correspond to the most common data manipulation verbs, to help easily translate thoughts into code.
3. Using efficient data storage backends, to spend as little time waiting for the computer as possible.

```ggplot``` was used [because](https://github.com/hadley/ggplot2/wiki/Why-use-ggplot2):

1. ggplot2 is an intuitive library that is founded on a logical mapping between data and graphical elements, building plots up not by thinking in terms of dots on paper, but in terms of what the data means. Think about your data and what you want to communicate, not the mechanics of drawing.
2. In addition, ggplot holds the hand of the user by proposing great graphical representations (geoms) and easy transformations.
3. qplot makes it easy to make quick plots for exploratory analysis.# Exploratory-Data-Analysis-Project2
