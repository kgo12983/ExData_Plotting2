#Plot 2

#Read initial files

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

png(file="C:/Users/A2962/OneDrive - Axtria/Exploratory_Data_Analysis_1/ExData_Plotting2/plot2.png",
    width=480, height=480)

Baltimore <- NEI[NEI$fips=="24510",]
BaltEmissions <- tapply(Baltimore$Emissions, Baltimore$year, sum)

barplot(BaltEmissions,main = "Baltimore City Total Emissions by Year", 
        xlab="Year",ylab="Emissions", col="orange")

dev.off()