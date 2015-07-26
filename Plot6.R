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

### *Plot6 was created using qplot*
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

#### Observation #6: Assuming Motor Vehicles refers to "ON-ROAD" only, Baltimore City appears to have seen greater changes over time in motor vehicle emissions verses Los Angeles County.