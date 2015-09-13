# set working directory 
setwd("C:/Users/Bharat/Desktop/R/")

#  packages
library(data.table)
library(lubridate)

# creating source data folder
if (!file.exists('source data')) {
  dir.create('source data')
}

# download the zip file and unzip
file.url<-'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
download.file(file.url,destfile='source data/power_consumption.zip')
unzip('source data/power_consumption.zip',exdir='source data',overwrite=TRUE)

# creating classes and importing table
#colClasses takes care of classes 
#na.strings converts to NAs

class<-c(rep('character',2),rep('numeric',7))
house.power<-read.table('source data/household_power_consumption.txt',header=TRUE,  sep=';',na.strings='?',colClasses=class)



#subsetting table as per required dates
house.power<-subset(house.power,Date=='1/2/2007' | Date=='2/2/2007')

#changing column names 
cols<-c('Date','Time','GlobalActivePower','GlobalReactivePower','Voltage','Global Intensity',
        'SubMetering1','SubMetering2','SubMetering3')
colnames(house.power)<-cols

#converting date and time formats
#merge date and time to single column
house.power$DateTime<-dmy(house.power$Date)+hms(house.power$Time)
house.power$DateTime<-as.POSIXlt(house.power$DateTime)

#writing clean file
write.table(house.power,file='source data/house.power.txt',sep='|',row.names=FALSE)

