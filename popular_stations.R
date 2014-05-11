# Most popular stations:

# First, set up the dataframe:
ss <- as.data.frame(table(citi$start.station.name))
names(ss) <- c("Station", "Count")
q <- quantile(ss$Count, .90) # "busy stations are in the 90% percentile

busiest <- subset(ss, Count > q)

# Looking this up in the station id
g <- ggplot(busiest, aes(reorder(busiest$Station, -busiest$Count, sum), Count, fill=Count)) +
  geom_bar() +
  labs(x="Station", title="Busiest Stations by # of Trips Started") +
  theme(axis.text.x=element_text(angle=90, hjust=1, vjust=0.5))
g