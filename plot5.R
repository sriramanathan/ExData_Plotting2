## Exploratory Data Analysis Course Project 2
# Assignment Question 05
library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
head(NEI)
head(SCC)

# Get Data for Baltimore City
BaltimoreNEI  <- NEI[NEI$fips=="24510", ]

# Get Data for Coal Combustion Related SOurces 
OnRoad <- grep("On-Road", SCC$EI.Sector)
OnRoadSCC <- SCC[OnRoad, ]

# Get Data from NEI based on the SCC Code
FinalData <- BaltimoreNEI[BaltimoreNEI$SCC %in% OnRoadSCC$SCC,]  

# Get sum data  using aggregate function
TotalforOnRoad <- aggregate(Emissions ~ year + type, data=FinalData, sum)
 
# Plot using ggplot2
png("plot5.png")
qplot(year, Emissions, data=TotalforOnRoad, color=type, geom="line") +
     ggtitle("Emissions from motor vehicle sources changed in Baltimore City") +
     xlab("Year") +
     ylab("Total PM2.5 Emissions")
dev.off()
