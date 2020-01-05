NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

veh  <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
SCC_veh<-SCC[veh,]
NEI_veh<-merge(NEI,SCC_veh,by="SCC")
emi_veh<-tapply(NEI_veh$Emissions,NEI_veh$year,sum)

png("plot5.png",width = 480, height = 480)
barplot(emi_veh, xlab = "Year", ylab = "Total Vehicle Emissions")
dev.off()