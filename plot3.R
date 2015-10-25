## Exploratory Data Analysis Course Project 2
# Assignment Question 03
library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
head(NEI)
head(SCC)

# Get Data for Baltimore City
BaltimoreNEI  <- NEI[NEI$fips=="24510", ]

# Get Total PM2.5 Emissions using aggregate function
TotalbyYear <- aggregate(Emissions ~ year + type, data=BaltimoreNEI, sum) 
 
# Plot using ggplot2
png("plot3.png")
qplot(year, Emissions, data=TotalbyYear, color=type, geom="line") +
     ggtitle("Baltimore City - Emissions by Source Type") +
     xlab("Year") +
     ylab("Total PM2.5 Emissions")
dev.off()

