### Question 5: How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City? 
  
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


#### Observation #5: Assuming Motor Vehicles refers to "ON-ROAD" only, emissions from motor vehicle sources appear to have changed from 1999-2008 in Baltimore City in that emissions look to have decreased from 1999 to 2008. 