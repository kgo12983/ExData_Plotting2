#Plot 4

#Read initial files

library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Create the plot

png(file="C:/Users/A2962/OneDrive - Axtria/Exploratory_Data_Analysis_1/ExData_Plotting2/plot4.png",
    width=480, height=480)

coal <- grepl("coal", SCC$Short.Name, ignore.case = TRUE)
subSCC <- SCC[coal,]

mergeNEI <- merge(NEI, subSCC, by="SCC")

totalEmissions <- tapply(mergeNEI$Emissions, mergeNEI$year, sum)

barplot(totalEmissions,main = "Total Coal Emissions by Year", xlab="Year",ylab="Coal Emissions", col="gray")

dev.off()