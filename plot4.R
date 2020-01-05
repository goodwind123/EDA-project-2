NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

coal  <- grepl("coal", SCC$Short.Name, ignore.case=TRUE)
SCC_coal<-SCC[coal,]
NEI_coal<-merge(NEI,SCC_coal,by="SCC")
coal_emi<-tapply(NEI_coal$Emissions,NEI_coal$year,sum)

png("plot4.png")
barplot(coal_emi, xlab = "Year", ylab = "Total Coal Emissions")
dev.off()