# Busiest Bikes

# First, set up the dataframe:
bikes <- as.data.frame(table(citi$bikeid))
names(bikes) <- c("BikeId", "Count")

# Are bikes used approximately evenly or are some worked more than others?
qqplot(y=bikes$Count, x=bikes$BikeId, geom="histogram")

# get busy bikes:
q <- quantile(bikes$Count, c(.25, .50, .75)) # "busy stations are in the 90% percentile
q


busiest <- subset(bikes, Count > q)

# Looking this up in the station id
g <- ggplot(busiest, aes(reorder(busiest$BikeId, -busiest$Count, sum), Count, fill=Count)) +
  geom_bar() +
  labs(x="BikeId", title="Busiest Bikes by # of Trips Started") +
  theme(axis.text.x=element_text(angle=90, hjust=1, vjust=0.5))
g