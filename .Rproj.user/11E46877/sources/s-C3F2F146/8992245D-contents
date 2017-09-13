library(dplyr)
library(ggplot2)
library(viridis)
library(ggthemes)

#import all the files
temp <- list.files(pattern="*.csv")
alldata<- do.call(rbind, lapply(temp, function(x) read.csv(x, stringsAsFactors = FALSE)))


#Data manipulation / Munging
alldata$day <- strptime(alldata$starttime, format = "%m/%d/%Y")
alldata$day <- as.character(alldata$day)
rides.raw <- aggregate(alldata$trip_id ,by=list(alldata$day), length)


rides.raw$Group.1<-as.Date(rides.raw$Group.1,format='%Y-%m-%d')
rides.raw$days<-factor(weekdays(rides.raw$Group.1,T),levels = rev(c("Mon", "Tue", "Wed", "Thu","Fri", "Sat", "Sun")))
rides.raw$week<-as.numeric(format(rides.raw$Group.1,"%W"))
rides.raw$month<-as.numeric(format(rides.raw$Group.1,"%m"))
rides.raw$year<-as.numeric(format(rides.raw$Group.1,"%Y"))


#Create the heatmap
ggplot(rides.raw, aes(x = week, y = days, fill = x)) +
  scale_fill_viridis(name="Sales",option = "D", limits = c(0, max(rides.raw$x))) + 
  geom_tile(color = "white", size = 0.4) + facet_wrap("year", ncol = 1) + 
  scale_x_continuous(expand = c(0, 0), breaks = seq(1, 52, length = 12), 
                     labels = c("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"))+
  theme_tufte()