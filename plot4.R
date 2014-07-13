df<-read.table('household_power_consumption.txt',na.strings = "NA",sep=";",header=T,stringsAsFactors=F)
df$DateFrmted<-as.Date(df$Date,format="%d/%m/%Y")
df$TimeFrmted<-strftime(strptime(df$Time,format="%H:%M:%S"),format="%H:%M:%S" )
df_<-subset(df,DateFrmted==as.Date('01/02/2007',format="%d/%m/%Y") | DateFrmted==as.Date('02/02/2007',format="%d/%m/%Y"))


par(mfrow = c(2, 2), mar = c(2, 2, 2, 2), oma = c(1, 1,0, 0))
with(df_, {
  plot(as.POSIXct(paste(DateFrmted, TimeFrmted),
                  format="%Y-%m-%d %H:%M:%S"),Global_active_power,ylab="Global Active Power(kilowatts)"
       ,xlab="",type="n")
  lines(as.POSIXct(paste(DateFrmted, TimeFrmted), format="%Y-%m-%d %H:%M:%S"),Global_active_power)
  
  plot(as.POSIXct(paste(DateFrmted, TimeFrmted),
                  format="%Y-%m-%d %H:%M:%S"),Voltage,ylab="Voltage"
       ,xlab="",type="n")
  lines(as.POSIXct(paste(DateFrmted, TimeFrmted), format="%Y-%m-%d %H:%M:%S"),Voltage)
  
   plot(as.POSIXct(paste(DateFrmted, TimeFrmted),
                            format="%Y-%m-%d %H:%M:%S"),Sub_metering_1,ylab="Energy Sub Metering"
                 ,xlab="", type="n")
  
  lines(as.POSIXct(paste(DateFrmted,TimeFrmted), format="%Y-%m-%d %H:%M:%S"),Sub_metering_1
                  , col = "black")
  
  lines(as.POSIXct(paste(DateFrmted,TimeFrmted), format="%Y-%m-%d %H:%M:%S"),Sub_metering_2
                  , col = "red")
  lines(as.POSIXct(paste(DateFrmted,TimeFrmted), format="%Y-%m-%d %H:%M:%S"),Sub_metering_3
                  , col = "blue")
  legend("topright", pch =c(NA,NA,NA), lwd=1,lty=c(1,1,1),col = c("black","red","blue" ), 
         legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),merge=F)
  
  
  plot(as.POSIXct(paste(DateFrmted, TimeFrmted),
                  format="%Y-%m-%d %H:%M:%S"),Global_reactive_power,ylab="Global_reactive_power"
       ,xlab="",type="n")
  lines(as.POSIXct(paste(DateFrmted, TimeFrmted), format="%Y-%m-%d %H:%M:%S"),Global_reactive_power)
  
  
  
})
