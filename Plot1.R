### Question #1: Have total emissions from PM2.5 decreased in the United States from 1999 to 2008?
  
#### *Read the data file*

library(ggplot2)
library(plyr)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#### *Using the base plotting system, a plot showing the total PM2.5 emissions from all sources for each of the years 1999, 2002, 2005, and 2008 has been created.*

emissionsByYear <- aggregate(NEI[c("Emissions")], list(year = NEI$year), sum)

#### *Plot1 has been made with the base plotting system*
#### *Run below in RStudio and export Plot to Plot1.png in your working directory*

png('plot1.png')
barplot(height=emissionsByYear$Emissions, names.arg=emissionsByYear$year, col="Red",
        xlab="YEARS", ylab=expression('Total PM'[2]*' Emissions'),
        main=expression('Total PM'[2]*' Emissions from 1999 to 2008'))
dev.off()

### Observation #1: After plotting emissions by year, it is appears that the total emissions from PM2.5 have decreased in the United States from 1999 to 2008.