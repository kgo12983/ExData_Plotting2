#Plot 5

#Read initial files

library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Create the plot
png(file="C:/Users/A2962/OneDrive - Axtria/Exploratory_Data_Analysis_1/ExData_Plotting2/plot5.png",
    width=480, height=480)

Baltimore <- NEI[NEI$fips=="24510",]

motor <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case = TRUE)
subSCC <- SCC[motor,]

mergeNEI <- merge(Baltimore, subSCC, by="SCC")

totalEmissions <- tapply(mergeNEI$Emissions, mergeNEI$year, sum)

barplot(totalEmissions,main = "Total Motor Vehicle Emissions by Year", xlab="Year",ylab="Motor Vehicle Emissions", col="gray")

dev.off()