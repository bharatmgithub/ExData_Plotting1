# set working directory 
setwd("C:/Users/Bharat/Desktop/R/")

# create results folder
if (!file.exists('plots')) {
  dir.create('plots')
}

#load file
source('initialize_and_import.R')


#open device
png(filename='plots/plot2.png',width=480,height=480,units='px')

#plot
plot(house.power$DateTime,house.power$GlobalActivePower,ylab='Global Active Power (kilowatts)', xlab='', type='l')


# Close device
x<-dev.off()
