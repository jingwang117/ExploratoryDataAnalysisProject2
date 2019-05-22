## How have emissions from motor vehicle sources changed
##  from 1999–2008 in Baltimore City?

## Import emissions data and source classification code


NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## merge the two data sets

NEISCC <- merge(NEI, SCC, by = "SCC")

library(ggplot2)

## get vehicle sources records


SubVehicle <- NEI[NEI$fips=="24510" & NEI$type=="ON-ROAD",]

TotalVehicle <- aggregate(Emissions ~ year, SubVehicle, sum)

## create plot5
png("plot5.png")
p <- ggplot(TotalVehicle, aes(factor(year), Emissions))
p <- p + geom_bar(stat="identity") +
        xlab("Years") +
        ylab(expression('Total PM2.5 Emissions')) +
        ggtitle('Total PM2.5 Emissions from motor vehicle sources From 1999 to 2008')
print(p)
dev.off()
