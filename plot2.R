df<-read.table('household_power_consumption.txt',na.strings = "NA",sep=";",header=T,stringsAsFactors=F)
df$DateFrmted<-as.Date(df$Date,format="%d/%m/%Y")
df$TimeFrmted<-strftime(strptime(df$Time,format="%H:%M:%S"),format="%H:%M:%S" )
df_<-subset(df,DateFrmted==as.Date('01/02/2007',format="%d/%m/%Y") | DateFrmted==as.Date('02/02/2007',format="%d/%m/%Y"))
plot(as.POSIXct(paste(df_$DateFrmted, df_$TimeFrmted),
     format="%Y-%m-%d %H:%M:%S"),df_$Global_active_power,ylab="Global Active Power(kilowatts)"
     ,xlab="", type="n")
lines(as.POSIXct(paste(df_$DateFrmted, df_$TimeFrmted), format="%Y-%m-%d %H:%M:%S"),df_$Global_active_power)

