## Code to construct plot1.
## histogram of global active power for the two days of interest

rm(list=ls())
graphics.off()

dir="C:/Users/dk/Documents/Coursera/Data science/ExploratoryDataAnalysis/ExData_Plotting1"
setwd(dir)

## read file
household_power_consumption=read.table("household_power_consumption.txt", sep=";", header=T, colClasses = "character")

## convert to the right class
# convert to numeric columns 3-9
for (i in 3:9) household_power_consumption[,i]=as.numeric(household_power_consumption[,i])
# convert column 1 to date 
household_power_consumption[,1]=as.Date(household_power_consumption[,1], "%d/%m/%Y")

## keep only the dates of interest (1st and 2nd of February 2007)
power_consumption_0102_02_07=household_power_consumption[household_power_consumption[,1]>="2007-02-01" & household_power_consumption[,1]<="2007-02-02", ]

## plot
png("plot1.png", width=480, height=480, type="cairo")

hist(power_consumption_0102_02_07$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")

dev.off()
