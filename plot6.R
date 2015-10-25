## Exploratory Data Analysis Course Project 2
# Assignment Question 06
library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
head(NEI)
head(SCC)

# Get Source Code 
OnRoad <- SCC[grepl("On-Road", SCC$EI.Sector),]
OnRoad <- OnRoad$SCC

# GET NEI Data
dataNEI <- NEI[NEI$SCC %in% OnRoad,]
dataNEI <- NEI[NEI$fips %in% c("24510", "06037"),]

# Get sum data  using aggregate function
TotalforOnRoad <- aggregate(Emissions ~ year + fips, data=dataNEI, sum)

# Plot using ggplot2
png("plot6.png")
qplot(year, Emissions, data=TotalforOnRoad, color=fips, geom="line") +
     ggtitle("Emissions from motor vehicle sources for Baltimore & Los AngelsCity") +
     xlab("Year") +
     ylab("Total PM2.5 Emissions")
dev.off()
