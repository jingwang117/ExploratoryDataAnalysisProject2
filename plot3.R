## Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad)
## variable, which of these four sources have seen decreases in emissions 
## from 1999–2008 for Baltimore City? Which have seen increases in emissions from 1999–2008? 
## Use the ggplot2 plotting system to make a plot answer this question.

## Import emissions data and source classification code


NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

library(ggplot2)

## Of the four types of sources indicated by type
## (point, nonpoint, onroad, nonroad) variable, 
## which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? 
## Which have seen increases in emissions from 1999–2008? 
## Use the ggplot2 plotting system to make a plot answer this question.

## total PM2.5 emissions decreased in the Baltimore City, Maryland (fips == "24510") 
## for 1999 to 2008)
SubSumNEI <- NEI[NEI$fips == "24510",]
SubTotalByYearAndType <- aggregate(Emissions ~ year + type, SubSumNEI, sum)

## create plot3
png("plot3.png")
p <- ggplot(SubTotalByYearAndType, aes(year, Emissions, col=type))
p <- p + geom_line() +
        xlab("Years") +
        ylab(expression('Total PM2.5 Emissions')) +
        ggtitle('Total PM2.5 Emissions in Baltimore City From 1999 to 2008')
print(p)
dev.off()