NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

maryland<-NEI[NEI$fips==24510,]
maryland_type <- aggregate(Emissions ~ year + type, maryland, sum)
png("plot3.png")
myplot<-ggplot(data=maryland_type,aes(x=year,y=Emissions,color=type))+geom_line()+ggtitle("Baltimore City Emissions")+scale_color_brewer(palette = "Set1") 
print(myplot)
dev.off()