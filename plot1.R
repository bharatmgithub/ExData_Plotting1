# set working directory 
setwd("C:/Users/Bharat/Desktop/R/")

# create results folder
if (!file.exists('plots')) {
  dir.create('plots')
}

#load file
source('initialize_and_import.R')

#open device
png(filename='plots/plot1.png',width=480,height=480,units='px')

#plot
hist(house.power$GlobalActivePower,main='Global Active Power',xlab='Global Active Power (kilowatts)',col='red')

# Close device
x<-dev.off()
