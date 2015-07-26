### Question 3: Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, which of these four sources have seen decreases in emissions from 1999-2008 for Baltimore #City? Which have seen increases in emissions from 1999-2008? 
  
#### *Read the data file*

library(ggplot2)
library(plyr)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#### *Using the ggplot2 plotting system a plot has been created a plot showing the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable to show which of these four sources have seen decreases in emissions from 1999-2008 for Baltimore City. The plot also shows which have seen increases in emissions from 1999-2008.*

BC<- NEI[NEI$fips=="24510",]

#### *Aggregate the Total Emissions for Baltimore City by Year*

aggTotalsBC <- aggregate(Emissions ~ year, BC,sum)

#### *Plot3 has been created using ggplot 
#### *Exploratory Data Analysis with R, The Book + Lecture Videos (HD) + Datasets + R Code Files by Roger D. Peng, PhD*

#### *Run below in RStudio and export Plot to Plot3.png in your working directory*

png("plot3.png",width=615,height=815,units="px",bg="transparent")

ggpd <- ggplot(BC,aes(factor(year),Emissions,fill=type)) +
  geom_bar(stat="identity") +
  theme_grey() + guides(fill=FALSE)+
  facet_grid(type~.,scales = "free",space="free") + 
  labs(x="year", y=expression("Total PM"[2.5]*" Emission (Tons)")) + 
  labs(title=expression("Total US Emissions from PM"[2.5]*", Baltimore City by Source Type"))

print(ggpd)

dev.off()

### Observation #3: Each of these sources appears to have seen decreases in emissions from 1999-2008 for Baltimore City. ```Point``` appears to have the largest increase in emissions from 2002 to 2005 (~600 to ~1200 tons).