# Density of days and hours
library(reshape2)

citi$hour_trip_started <- strftime(citi$starttime, format= "%H")
citi$dow_trip_started  <- strftime(citi$starttime, format= "%a")
citi$date_of_trip      <- strftime(citi$starttime, format= "%D")

den <- melt(table(citi$hour_trip_started, citi$dow_trip_started))
names(den) <- c("hour", "day", "c")
#den$day <- factor(den$day, levels=c("Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"))

p <- ggplot(data=den, aes(x=factor(day, levels=c("Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat")), y=hour)) +
  geom_tile(aes(fill=c)) +
  scale_fill_gradient(low="blue", high="red2") +
  labs(x="Day of Week", title="Density of trips started", y="Hour of Day")
p