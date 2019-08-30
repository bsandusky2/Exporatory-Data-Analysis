library(dplyr)
library(lubridate)
install.packages("varhandle")
library(varhandle)

power<- read.table("power.txt",header = TRUE, sep = ";")

new_df<- power
new_df$Date<- as.Date(strptime(new_df$Date,"%d/%m/%Y"))


#filter data frame
df<- new_df %>% 
  select_all() %>% 
  filter(Date>= as.Date("2007-02-01") & Date<= as.Date("2007-02-02"))

#Merge the date variable and timestamp together
df$date<- as.POSIXct(paste(df$Date,df$Time), format = "%Y-%m-%d %H:%M:%S")

#Plot global active power versus date. Need to unfactor the global active power variable
plot(df$date,unfactor(df$Global_active_power), ylab = "Global Acive Power (Kilowatts)", xlab = "Date",type = "l")

png("Plot2.png") # default pixels are 480x480
dev.off()






