library(sqldf) #To run sql query while reading file

### ----------------------- Reading Data from File ----------------------------------------------------------------------

#Read data from file, as data is huge: we will filter data only for relavent dates

data <- read.csv.sql("household_power_consumption.txt", , sql = "select * from file where Date = '1/2/2007' OR Date = '2/2/2007'", header=TRUE, sep = ";")
#head(data)


##Create a copy and do Data transformation (Date/ Time)

df <- data
df$Date <- as.Date(df$Date, "%d/%m/%Y") #Convert datatype to Date

df$datetime <- paste(df$Date, df$Time, sep = " ") #Create a new column to store datetime

df$datetime <- strptime(df$datetime, format = "%Y-%m-%d %H:%M:%S") #Convert datatype to datetime
#summary(df)

### -------------------------- Plot 2 --------------------------------------------------------------------------------------



png(file="plot2.png", width=480, height=480) #Define plot file properties
with(df, plot(datetime,Global_active_power, type="l", xlab ="", ylab = "Global Active Power (kilowatts)"))
dev.off()


