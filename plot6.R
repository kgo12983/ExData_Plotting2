#Plot 6

#Read initial files

library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Create the plot
png(file="C:/Users/A2962/OneDrive - Axtria/Exploratory_Data_Analysis_1/ExData_Plotting2/plot6.png",
    width=480, height=480)

Baltimore <- NEI[NEI$fips=="24510",]
LosAng <- NEI[NEI$fips=="06037",]

motor <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case = TRUE)
subSCC <- SCC[motor,]

mergeBalt <- merge(Baltimore, subSCC, by="SCC")
mergeBalt$city <- "Baltimore"
mergeLA <- merge(LosAng, subSCC, by="SCC")
mergeLA$city <- "Los Angeles"

bigmerge <- rbind(mergeBalt, mergeLA)

bigmerge <- aggregate(Emissions ~ year + city, bigmerge, sum)

ggplot(bigmerge,aes(year, Emissions, color = city)) + geom_line()+ xlab("year") + ylab("Total Motor Emissions") +ggtitle("Total Motor Emissions in LA and Baltimore")

dev.off()
