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
3. qplot makes it easy to make quick plots for exploratory analysis.

#### *In RStudio the ```plyr``` library was installed*

    library(plyr)

#### *Installed ggplot2 library*

    library(ggplot2)

### Questions / Tasks

The following questions and tasks are addressed in the exploratory analysis. For each question/task a single plot has been created. Plotting systems in R have been used to create six (6) plots to address each question.
 
> ### Question #1: Have total emissions from PM2.5 decreased in the United States from 1999 to 2008?

#### *Read the data file*


    NEI <- readRDS("summarySCC_PM25.rds")
    SCC <- readRDS("Source_Classification_Code.rds")

#### *Using the base plotting system, a plot showing the total PM2.5 emissions from all sources for each of the years 1999, 2002, 2005, and 2008 has been created.*

    emissionsByYear <- aggregate(NEI[c("Emissions")], list(year = NEI$year), sum)

#### *Plot1 has been made with the base plotting system*
#### *Run below in RStudio and export Plot to Plot1.png in your working directory*

    png('plot1.png')
    barplot(height=emissionsByYear$Emissions, names.arg=emissionsByYear$year, col="red",
    xlab="YEARS", ylab=expression('Total PM'[2]*' Emissions'),
    main=expression('Total PM'[2]*' Emissions from 1999 to 2008'))
    dev.off()

![](http://i.imgur.com/ABlHJrT.png)

> ### Observation #1: After plotting emissions by year, it is appears that the total emissions from PM2.5 have decreased in the United States from 1999 to 2008.

> ### Question #2: Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008? 
  
#### *Read the data file*
  
    NEI <- readRDS("summarySCC_PM25.rds")
    SCC <- readRDS("Source_Classification_Code.rds")
    
#### *Using the base plotting system a plot has been created showing the subset of data for the emissions by year for Baltimore City.*

    BC <- NEI[NEI$fips=="24510",]
    emissionsByYear <- aggregate(Emissions ~ year, BC, sum)

#### *Plot2 has been made with the base plotting system*
#### *Run below in RStudio and export Plot to Plot2.png in your working directory*

    png('plot2.png')
    barplot(height=emissionsByYear$Emissions, names.arg=emissionsByYear$year, col="blue",
    xlab="YEARS", ylab=expression('Total PM'[2]*' Emissions'),
    main=expression('Total PM'[2]*' Emissions from 1999 to 2008'))
    dev.off()

![](http://i.imgur.com/qFVpfZR.png)

> ### Observation #2: Total emissions from PM2.5 appears to have decreased in the Baltimore City, MD from 1999 to 2008. The decrease first occurred from 1999 to 2002. The plot also suggests that there was an increase of PM2.5 again beginning in the year 2002 to 2005 (~3100 tons) and then back down to (~1800 tons) by 2008. 

> ### Question 3: Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, which of these four sources have seen decreases in emissions from 1999-2008 for Baltimore #City? Which have seen increases in emissions from 1999-2008? 

#### *Read the data file*

    library(ggplot2)
    library(plyr)
    NEI <- readRDS("summarySCC_PM25.rds")
    SCC <- readRDS("Source_Classification_Code.rds")

#### *Using the ggplot2 plotting system a plot has been created a plot showing the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable to show which of these four sources have seen decreases in emissions from 1999-2008 for Baltimore City. The plot also shows which have seen increases in emissions from 1999-2008.*

    BC<- NEI[NEI$fips=="24510",]

#### *Aggregate the Total Emissions for Baltimore City by Year*

    aggTotalsBC <- aggregate(Emissions ~ year, BC,sum)

#### *Plot3 has been created using ggplot* 
#### *Exploratory Data Analysis with R, The Book + Lecture Videos (HD) + Datasets + R Code Files by Roger D. Peng, PhD*

#### *Run below in RStudio and export Plot to Plot3.png in your working directory*

    png("plot3.png",width=615,height=485,units="px",bg="transparent")
    
    ggpd <- ggplot(BC,aes(factor(year),Emissions,fill=type)) +
      geom_bar(stat="identity") +
      theme_grey() + guides(fill=FALSE)+
      facet_grid(type~.,scales = "free",space="free") + 
      labs(x="year", y=expression("Total PM"[2.5]*" Emission (Tons)")) + 
      labs(title=expression("Total US Emissions from PM"[2.5]*", Baltimore City by Source Type"))
    
    print(ggpd)
    
    dev.off()

    
![](http://i.imgur.com/kacYVQC.png)

> ### Observation #3: The source type ```Point``` appears to have the largest increase in emissions from 2002 to 2005 (~600 to ~1200 tons). The Chart has been stacked so that is it becomes apparent that point has changed the most over the other 3.

> ### Question 4: Across the United States, how have emissions from coal combustion-related sources changed from 1999-2008? 
 
#### *Read the data files*

    library(ggplot2)
    library(plyr)
    NEI <- readRDS("summarySCC_PM25.rds")
    SCC <- readRDS("Source_Classification_Code.rds")

#### *A subset of the emissions from coal combustion-related sources which have changed from 1999-2008 has been created. (See Descriptions of NEI Data Categories for Point and NonPoint data categories). References: http://www.epa.gov/ttn/chief/eiinformation.html.*

    CC_SCC <- subset(SCC, EI.Sector %in% c("Fuel Comb - Comm/Institutional - Coal", "Fuel Comb - Electric Generation - Coal",
    "Fuel Comb - Industrial Boilers, ICEs - Coal"))

#### *Compare to Short.Name matching both Comb and Coal*

    CC_SCC1 <- subset(SCC, grepl("Comb", Short.Name) & grepl("Coal",Short.Name))
    CC_SCC_Codes <- union(CC_SCC$SCC, CC_SCC1$SCC)
    CC <- subset(NEI, SCC %in% CC_SCC_Codes)
    CC_ByYear <- ddply(CC, .(year, type), function(x)sum(x$Emissions))
    colnames(CC_ByYear)[3] <- "Emissions"

#### *Plot4 was created using ggplot*
#### *Run below in RStudio and export Plot to Plot4.png in your working directory*

    png("plot4.png", width=640, height=480)
    ggpd <- ggplot(CC_ByYear, aes(factor(year), Emissions))
    ggpd <- ggpd + geom_bar(stat="identity", fill="#56B4E9") +
      xlab("YEAR") +
      ylab(expression('Total PM'[2.5]*" Emissions")) +
      ggtitle('Total Emissions from Coal Combustion-related Sources from 1999 to 2008')
    print(ggpd)
    dev.off()

![](http://i.imgur.com/edcIFwX.png)

> ### Observation #4: From 1999 to 2002 the data appears to have decreased between 1999 to 2008. 

> ### Question 5: How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City? 

#### *Read the data file*

    library(ggplot2)
    library(plyr)
    NEI <- readRDS("summarySCC_PM25.rds")
    SCC <- readRDS("Source_Classification_Code.rds")

#### *A subset showing Motor Vehicle Emissions (MVE) by year shows the changes from 1999 - 2008 in Baltimore City. Motor Vehicles refers to "ON-ROAD" only.*

    BC_MVE <- subset(NEI, fips == "24510" & type=="ON-ROAD")
    BC_MVEByYear <- ddply(BC_MVE, .(year), function(x) sum(x$Emissions))
    colnames(BC_MVEByYear)[2] <- "Emissions"

#### *Plot5 was created using qplot*
#### *Run below in RStudio and export Plot to Plot5.png in your working directory*
    
    png("plot5.png", width=615, height=485)
    ggpd <- ggplot(BC_MVEByYear, aes(factor(year), Emissions))
    ggpd <- ggpd + geom_bar(stat="identity", colour="black", fill="#D55E00") +
      xlab("YEARS") +
      ylab(expression('Total PM'[2.5]*" Emissions")) +
      ggtitle('Total Emissions from Motor Vehicles "ON-ROAD" in Baltimore City, MD from 1999 to 2008')
    print(ggpd)
    dev.off()

![](http://i.imgur.com/XyQaSnS.png)

> #### Observation #5: Assuming Motor Vehicles refers to "ON-ROAD" only, emissions from motor vehicle sources appear to have changed from 1999-2008 in Baltimore City in that emissions look to have decreased from 1999 to 2008.

#### Question 6: Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, California (fips == 06037). Which city has seen greater changes over time in motor vehicle emissions? 
  
#### *Read the data file and merge the data*
  
    library(ggplot2)
    library(plyr)
    NEI <- readRDS("summarySCC_PM25.rds")
    SCC <- readRDS("Source_Classification_Code.rds")
    NEI_SCC <- merge(NEI, SCC, by="SCC")

#### *A subset comparing emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, California (fips == 06037). It also depicts the city which has seen the greatest changes over time in motor vehicle emissions.

    subsetNEI <- NEI[(NEI$fips=="24510"|NEI$fips=="06037") & NEI$type=="ON-ROAD",  ]

    agg_ByYear_Fips <- aggregate(Emissions ~ year + fips, subsetNEI, sum)
    agg_ByYear_Fips$fips[agg_ByYear_Fips$fips=="24510"] <- "Baltimore City"
    agg_ByYear_Fips$fips[agg_ByYear_Fips$fips=="06037"] <- "Los Angeles County"

### *Plot6 was created using ggplot2*
#### *Run below in RStudio and export Plot to Plot6.png in your working directory*  
    
    png("plot6.png", width=960, height=480)
    pd <- ggplot(agg_ByYear_Fips, aes(factor(year), Emissions))
    pd  <- pd + facet_grid(fips ~ .)
    pd  <- pd + geom_bar(stat="identity", fill="#0072B2", colour="black") +
      theme_grey() + guides(fill=FALSE) + 
      xlab("YEARS") +
      ylab(expression('Total PM'[2.5]*" Emissions")) +
      ggtitle('Total Emissions from "ON-ROAD" Motor Vehicles in Baltimore City verses Los Angeles County')
    print(pd)
    dev.off()

![](http://i.imgur.com/3WlHmv0.png)

#### Observation #6: Assuming Motor Vehicles refers to "ON-ROAD" only, Los Angeles County appears to have seen greater changes over time in motor vehicle emissions verses Baltimore City, MD. 