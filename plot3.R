# set working directory 
setwd("C:/Users/Bharat/Desktop/R/")

# create results folder
if (!file.exists('plots')) {
  dir.create('plots')
}

#load file
source('initialize_and_import.R')

# open device
png(filename='plots/plot3.png',width=480,height=480,units='px')

# plot data
leg_col<-c('black','red','blue')
leg_label<-c('Sub_metering_1','Sub_metering_2','Sub_metering_3')
plot(house.power$DateTime,house.power$SubMetering1,type='l',col=leg_col[1],xlab='',ylab='Energy sub metering')
lines(house.power$DateTime,house.power$SubMetering2,col=leg_col[2])
lines(house.power$DateTime,house.power$SubMetering3,col=leg_col[3])
legend('topright',legend=leg_label,col=leg_col,lty='solid')

# close device
x<-dev.off()
