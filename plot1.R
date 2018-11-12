library(data.table)
library(dplyr)
library(lubridate)

##1. Load data from the source txt file
#Load raw data
data <- fread("household_power_consumption.txt")

#Using data from the dates 2007-02-01 and 2007-02-02. 
df <- 
  data %>%
  mutate(Date = dmy(Date),Global_active_power = as.numeric(Global_active_power)) %>%
  filter(Date>='2007-02-01',Date <= '2007-02-02')

##2. Generating plot 1: Histogram - Global Active Power

#Specify file name and format
png(filename = 'plot1.png')

#Plot histogram with required dataset 
hist(df$Global_active_power,col='red',main = 'Global Active Power',xlab ='Global Active Power (kilowatts)',ylab = 'Frequency')

#Check active graphic device
dev.cur()

##3. Turn off graphic device
dev.off()
