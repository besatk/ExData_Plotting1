
df<-read.table('household_power_consumption.txt',na.strings = "NA",sep=";",header=T,stringsAsFactors=F)
df$DateFrmted<-as.Date(df$Date,format="%d/%m/%Y")
df$TimeFrmted<-strftime(strptime(df$Time,format="%H:%M:%S"),format="%H:%M:%S" )
df_<-subset(df,DateFrmted==as.Date('01/02/2007',format="%d/%m/%Y") | DateFrmted==as.Date('02/02/2007',format="%d/%m/%Y"))
par(mar=c(5.1,4.1, 4.1, 2.1),oma=c(0,0,0,0))

hist(as.numeric(df_$Global_active_power),main="Global Active Power", xlab="Global Active Power(kilowatts)",col="red")


