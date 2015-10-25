## Exploratory Data Analysis Course Project 2
# Assignment Question 01
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
head(NEI)
head(SCC)
# Get Total PM2.5 Emissions using aggregate function
TotalbyYear <- aggregate(Emissions ~ year, data=NEI, sum) 
TotalEmission <- TotalbyYear$Emission
Year <- TotalbyYear$year
# Plot Bar Plot
barplot(TotalEmission,main="Total PM2.5 Emissions by Year",names.arg=Year,ylab="Total PM2.5 Emissions",xlab="Year")
dev.copy(png, file="plot1.png")
dev.off()
