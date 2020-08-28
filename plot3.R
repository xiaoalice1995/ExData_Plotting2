getwd()
setwd("./Exploratory_Data_Analysis/ExData_Plotting2")
# Load the data.
neiData <- readRDS("summarySCC_PM25.rds")
sccData <- readRDS("Source_Classification_Code.rds")

head(neiData)
head(sccData)
dim(neiData) # 6497651   6
dim(sccData) # 11717    15
subset <- neiData[neiData$fips == "24510", ] 
# source("load_data.R")

library(ggplot2)
par("mar"=c(5.1, 4.5, 4.1, 2.1))
png(filename = "./figure/plot3.png", 
    width = 480, height = 480, 
    units = "px")
g <- ggplot(subset, aes(year, Emissions, color = type))
g + geom_line(stat = "summary", fun.y = "sum") + 
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle("Total Emissions in Baltimore City from 1999 to 2008")
dev.off()

# ## Another way of plotting (same result)
# 
# # Utilize plyr to split-apply-combine to simplify our dataset
# library(plyr)
# # Utilizing ggplot2 for this plot
# library(ggplot2)
# 
# # Summarize the emissions by year and Baltimore City to simplify the plot
# balt <- ddply(NEI[NEI$fips == "24510", ],
#               .(type,year), summarise, 
#               TotalEmissions = sum(Emissions))
# 
# # Set the graphics device to png
# png(filename = "./figure/plot32.png")
# 
# # Plot the data -- finding total emissions each year
# 
# ggplot(balt, aes(year, TotalEmissions, colour = type)) +
#     geom_line() + geom_point() +
#     labs(title = "Total Emissions by Type in Baltimore",
#          x = "Year", y = "Total Emissions")
# 
# # Decided against facets since the range for Baltimore is small
# #        facet_grid(type~., scales = "free") +
# 
# dev.off()