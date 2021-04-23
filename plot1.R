#Plot 1

#Read initial files

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Create the plot
png(file="C:/Users/A2962/OneDrive - Axtria/Exploratory_Data_Analysis_1/ExData_Plotting2/plot1.png",
    width=480, height=480)

totalEmissions <- tapply(NEI$Emissions, NEI$year, sum)

barplot(totalEmissions,main = "Total Emissions by Year", xlab="Year",ylab="Emissions", col="green")

dev.off()