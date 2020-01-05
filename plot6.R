NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

veh  <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
SCC_veh<-SCC[veh,]
NEI_veh<-merge(NEI,SCC_veh,by="SCC")

data<-subset(NEI_veh,fips=='24510' | fips=='06037')
data$city <- ifelse(data$fips=="24510", "Baltimore", "Los Angeles")
emissions <- aggregate(Emissions ~ year + city,data, sum)

png("plot6.png", width = 480, height = 480)
g <- ggplot(emissions, aes(x=year, y=Emissions, color=city))
myplot<-g + geom_line()
print(myplot)

dev.off()