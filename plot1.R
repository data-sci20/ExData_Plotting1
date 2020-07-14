
classes = c( rep("character", 2), rep("numeric", 7) )

df <- read.table( file = "household_power_consumption.txt", 
                  header = TRUE, 
                  sep = ';', 
                  na.strings = "?",
                  stringsAsFactors = FALSE,
                  comment.char = "",
                  colClasses = classes )

s_df <- df[ df$Date %in% c("1/2/2007", "2/2/2007"), ]

png("plot1.png", width = 480, height =480)

hist( s_df$Global_active_power, 
      xlab = "Global Active Power (kilowatts)", 
      ylab = "Frequency", 
      col  = "Red", 
      main = "Global Active Power" )

dev.off()

