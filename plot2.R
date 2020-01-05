NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

maryland<-NEI[NEI$fips==24510,]
Emi_maryland<-tapply(maryland$Emissions,maryland$year,sum)
png("plot2.png",width = 480, height = 480)
barplot(emissions,xlab="Year",ylab="Maryland PM2.5 emission")
dev.off()