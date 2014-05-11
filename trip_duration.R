# Trip Duration

# remove outliers
duration <- subset(citi, tripduration < quantile(citi$tripduration, .99))

qplot(x=duration$tripduration, geom="histogram", xlab="Trip Duration (in seconds)") + theme_bw()