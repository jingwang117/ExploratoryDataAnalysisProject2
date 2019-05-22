## Have total emissions from PM2.5 decreased 
## in the Baltimore City, Maryland (fips=="24510") from 1999 to 2008? 
## Use the base plotting system to make a plot answering this question.

## Import emissions data and source classification code


NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## total PM2.5 emissions decreased in the Baltimore City, Maryland (fips == "24510") 
## for 1999 to 2008)
SubSumNEI <- NEI[NEI$fips == "24510",]
SubTotal <- aggregate(Emissions ~ year, SubSumNEI, sum)

## create plot2
png("plot2.png")
barplot(height=SubTotal$Emissions, names.arg=SubTotal$year, 
        main = "Total PM2.5 Emissions in Baltimore City, Maryland by years",
        ylab = "Total emissions of PM2.5 (tons)",
        xlab = "Year")
dev.off()