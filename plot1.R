## Have total emissions from PM2.5 decreased in the United States 
## from 1999 to 2008? Using the base plotting system, 
## make a plot showing the total PM2.5 emission 
## from all sources for each of the years 1999, 2002, 2005, and 2008.

## Import emissions data and source classification code


NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## total emissions for each year (1999, 2002, 2005, and 2008)
SumByYear <- aggregate(Emissions ~ year, NEI, sum)

## create plot1
png("plot1.png")
barplot(height=SumByYear$Emissions, names.arg=SumByYear$year, 
     main = "Total PM2.5 Emissions by years",
     ylab = "Total emissions of PM2.5 (tons)",
     xlab = "Year")
dev.off()