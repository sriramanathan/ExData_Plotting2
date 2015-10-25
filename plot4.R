## Exploratory Data Analysis Course Project 2
# Assignment Question 04
library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
head(NEI)
head(SCC)

# Get Data for Coal Combustion Related SOurces 
findcoal <- unique(grep("coal", SCC$EI.Sector, ignore.case=TRUE, value=TRUE))  
CoalSCC <- subset(SCC, EI.Sector %in% findcoal)    

# Get Data from NEI based on the SCC Code
CoalNEI <- subset(NEI, SCC %in% CoalSCC$SCC)   

# Get sum data  using aggregate function
TotalforCoalNEI <- aggregate(Emissions ~ year + type, data=CoalNEI, sum)
 
# Plot using ggplot2
png("plot4.png")
qplot(year, Emissions, data=TotalforCoalNEI, color=type, geom="line") +
     ggtitle("Coal combustion Related sources changed from 1999-2008 for US") +
     xlab("Year") +
     ylab("Total PM2.5 Emissions")
dev.off()
