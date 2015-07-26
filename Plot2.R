### Question #2: Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008? 
  
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

### Observation #2: Total emissions from PM2.5 appears to have decreased in the Baltimore City, Maryland from 1999 to 2008. The plot also suggests that there was an increase of PM2.5 again beginning in the year 2002 to 2005 (~3100 tons) and then back down to (~1800 tons) by 2008.   