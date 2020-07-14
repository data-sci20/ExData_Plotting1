
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

png("plot2.png", width = 480, height = 480)

with(s_df, plot( date_time, Global_active_power, 
                 type = "l", # lines
                 ylab = "Global Active Power (kilowatts)", 
                 xlab = "" ) )

dev.off()
