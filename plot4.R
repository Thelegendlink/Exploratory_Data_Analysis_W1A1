library(data.table)
library(dplyr)
library(lubridate)

##1. Load data from the source txt file
#Load raw data
data <- fread("household_power_consumption.txt")

#Using data from the dates 2007-02-01 and 2007-02-02. 
df <- 
  data %>%
  mutate(Date = dmy(Date),
         DateTime = ymd_hms(paste(Date,Time))) %>%
  filter(Date>='2007-02-01',Date <= '2007-02-02') 

##2. Generating plot 4: plot 4 charts in one graphic device

#Specify file name and format
png(filename = 'plot4.png')

par(mfrow = c(2,2))
plot(df$DateTime,df$Global_active_power,xlab='',ylab = 'Global Active Power',type = 'l')
plot(df$DateTime,df$Voltage,xlab='datetime',ylab = 'Voltage',type = 'l')
with(df,{
  plot(DateTime,Sub_metering_1,xlab='',ylab = 'Energy sub metering',type = 'l',col='red')
  lines(DateTime,Sub_metering_2,xlab='',ylab = 'Energy sub metering',type = 'l',col='green')
  lines(DateTime,Sub_metering_3,xlab='',ylab = 'Energy sub metering',type = 'l',col='blue')
  legend("topright",lty = 1,legend = c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),col=c('red','green','blue'))
})
plot(df$DateTime,df$Global_reactive_power,xlab='datetime',type = 'l')

#Check active graphic device
dev.cur()

##3. Turn off graphic device
dev.off()