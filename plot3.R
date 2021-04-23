#Plot 3

#Read initial files

library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Create the plot
png(file="C:/Users/A2962/OneDrive - Axtria/Exploratory_Data_Analysis_1/ExData_Plotting2/plot3.png",
    width=480, height=480)

Baltimore <- NEI[NEI$fips=="24510",]
BaltEmissionsType <- aggregate(Emissions~year +type, Baltimore, sum)
g <- ggplot(BaltEmissionsType, aes(year, Emissions, color = type))
g+geom_line()+xlab("year")+ylab("Total Emissions")+ggtitle("Total Emissions by Type in Baltimore")

dev.off()