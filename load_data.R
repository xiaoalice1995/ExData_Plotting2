
setwd("./ExData_Plotting2")
# Load the data.
neiData <- readRDS("summarySCC_PM25.rds")
sccData <- readRDS("Source_Classification_Code.rds")

head(neiData)
head(sccData)
dim(neiData) # 6497651   6
dim(sccData) # 11717    15
