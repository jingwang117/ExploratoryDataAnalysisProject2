## Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources 
## in Los Angeles County, California (fips == "06037"). Which city has seen greater changes over time 
## in motor vehicle emissions?

## Import emissions data and source classification code


NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## merge the two data sets

NEISCC <- merge(NEI, SCC, by = "SCC")

library(ggplot2)

## get vehicle sources records


SubNEI <- NEI[(NEI$fips=="24510" | NEI$fips=="06037") & NEI$type=="ON-ROAD",]

TotalVehicle <- aggregate(Emissions ~ year + fips, SubNEI, sum)

TotalVehicle$fips[TotalVehicle$fips=="24510"] <- "Baltimore, MD"
TotalVehicle$fips[TotalVehicle$fips=="06037"] <- "Los Angeles, CA"

## create plot6
png("plot6.png", width=800, height=400)
p <- ggplot(TotalVehicle, aes(factor(year), Emissions))
p <- p + geom_bar(stat="identity") +
        facet_grid(. ~ fips) +
        xlab("Years") +
        ylab(expression('Total PM2.5 Emissions')) +
        ggtitle('Total PM2.5 Emissions from motor vehicle in Baltimore City, Maryland and Los Angeles County, California" From 1999 to 2008')
print(p)
dev.off()
