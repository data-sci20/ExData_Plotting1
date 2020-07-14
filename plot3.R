
classes = c( rep("character", 2), rep("numeric", 7) )

df <- read.table( file = "household_power_consumption.txt", 
                  header = TRUE, 
                  sep = ';', 
                  na.strings = "?",
                  stringsAsFactors = FALSE,
                  comment.char="",
                  colClasses = classes )

s_df <- df[ df$Date %in% c("1/2/2007", "2/2/2007"), ]

s_df$date_time <- strptime( paste(s_df$Date, s_df$Time),
                            "%d/%m/%Y %H:%M:%S" )                       

png("plot3.png", width = 480, height = 480)

with(s_df, {
  plot(date_time, Sub_metering_1, type = "l", xlab = "", 
       ylab = "Energy sub metering")
  lines(date_time, Sub_metering_2, type = "l", col = "red")
  lines(date_time, Sub_metering_3, type = "l", col = "blue")
  } )

legend( "topright", "(x,y)", 
        legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
        col = c("black", "red", "blue"), lty = 1)

dev.off()
