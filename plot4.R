## Across the United States, 
## how have emissions from coal combustion-related sources changed from 1999–2008

## Import emissions data and source classification code


NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## merge the two data sets

NEISCC <- merge(NEI, SCC, by = "SCC")

library(ggplot2)

## get coal source records

CoalSource <- grepl("coal", NEISCC$Short.Name, ignore.case = TRUE)

SubCoal <- NEISCC[CoalSource,]

TotalCoal <- aggregate(Emissions ~ year, SubCoal, sum)

## create plot4
png("plot4.png")
p <- ggplot(TotalCoal, aes(factor(year), Emissions))
p <- p + geom_bar(stat="identity") +
        xlab("Years") +
        ylab(expression('Total PM2.5 Emissions')) +
        ggtitle('Total PM2.5 Emissions from coal sources From 1999 to 2008')
print(p)
dev.off()