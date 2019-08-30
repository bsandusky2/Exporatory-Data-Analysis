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

plot(df$date,unfactor(df$Sub_metering_1), ylab = "Global Acive Power (Kilowatts)", xlab = "Date",type = "l")
lines(df$date,unfactor(df$Sub_metering_2),col = "red")
lines(df$date,df$Sub_metering_3,col = "blue")
legend(df$date[2400],35,legend = c("Sub_metering_1","Sub_metering_2","sub_metering_3"),
       col = c("black","red","blue"),
       lty = 1:3,cex = .8
       )

png("Plot3.png") # default pixels are 480x480
dev.off()

