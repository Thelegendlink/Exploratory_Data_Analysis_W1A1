library(data.table)
library(dplyr)
library(lubridate)

##1. Load data from the source txt file
#Load raw data
data <- fread("household_power_consumption.txt")

#Using data from the dates 2007-02-01 and 2007-02-02. 
df <- 
  data %>%
  mutate(Date = dmy(Date)) %>%
  filter(Date>='2007-02-01',Date <= '2007-02-02') %>%
  mutate(DateTime = ymd_hms(paste(Date,Time)))

##2. Generating plot 3: Line chart  Energy sub metering by category by date

#Specify file name and format
png(filename = 'plot3.png')

#Plot 3 lines
with(df,{
  plot(DateTime,Sub_metering_1,xlab='',ylab = 'Energy sub metering',type = 'l',col='red')
  lines(DateTime,Sub_metering_2,xlab='',ylab = 'Energy sub metering',type = 'l',col='green')
  lines(DateTime,Sub_metering_3,xlab='',ylab = 'Energy sub metering',type = 'l',col='blue')
  legend("topright",lty = 1,legend = c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),col=c('red','green','blue'))
  })

#Check active graphic device
dev.cur()

##3. Turn off graphic device
dev.off()
