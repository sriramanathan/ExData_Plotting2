## Exploratory Data Analysis Course Project 2
# Assignment Question 02
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
head(NEI)
head(SCC)
# Get Data for Baltimore City
BaltimoreNEI  <- NEI[NEI$fips=="24510", ]
# Get Total PM2.5 Emissions using aggregate function
TotalbyYear <- aggregate(Emissions ~ year, data=BaltimoreNEI, sum) 
TotalEmission <- TotalbyYear$Emission
Year <- TotalbyYear$year
# Plot Bar Plot
barplot(TotalEmission,main="Total PM2.5 Emissions by Year for Baltimore",names.arg=Year,ylab="Total PM2.5 Emissions",xlab="Year")
dev.copy(png, file="plot2.png")
dev.off()
