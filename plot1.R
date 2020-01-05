NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

png("plot1.png", width = 480, height = 480)
emissions<-tapply(NEI$Emissions,NEI$year,sum)
barplot(emissions,xlab="Year",ylab="Total PM2.5 emission")
dev.off()

