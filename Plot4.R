### Question 4: Across the United States, how have emissions from coal combustion-related sources changed from 1999-2008? 
  
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

### Observation #4: From 1999 to 2002 the data appears to have decreased between 1999 to 2008. 