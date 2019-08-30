# Read in power Consumption dataset
library(dplyr)
library(varhandle)

power<- read.table("power.txt",header = TRUE, sep = ";")
head(power)

new_df<- power
new_df$Date<- as.Date(strptime(new_df$Date,"%d/%m/%Y"))
class(new_df$Date)

df<- new_df %>% 
  select_all() %>% 
  filter(Date>= as.Date("2007-02-01") & Date<= as.Date("2007-02-02"))

which(df$Global_active_power =="?")

hist(as.numeric(levels(df$Global_active_power)[df$Global_active_power]),col = "red",ylab = "Frequency",
     xlab = "Global Active Power (kilowatts)",ylim = c(0,1500), main = "Global Active Power")
png("Plot1.png") # default pixels are 480x480
dev.off()
