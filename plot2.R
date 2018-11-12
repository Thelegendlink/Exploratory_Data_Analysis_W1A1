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

##2. Generating plot 2: Global active power consumption 

#Specify file name and format
png(filename = 'plot2.png')

#Generating plot 2: Line graph
plot(df$DateTime,df$Global_active_power,xlab='',ylab = 'Global Active Power (kilowatts)',type = 'l')

#Check active graphic device
dev.cur()

##3. Turn off graphic device
dev.off()
