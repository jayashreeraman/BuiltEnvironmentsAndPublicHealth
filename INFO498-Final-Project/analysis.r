library(yarrr)
library(ggplot2)
library(dplyr)
library(plyr)

#Read files
parkRankings <- read.csv("prepped_data/ParkRankings.csv")
walkability <- read.csv("prepped_data/Walkability.csv")
vehicleperpub <- read.csv("prepped_data/perpub.csv")

city_codes <- c()

walkreason_valid <- vehicleperpub %>% filter(WALK_DEF > 0)
city_codes <- (unique(walkreason_valid$HH_CBSA))
#city_codes <- city_codes %>% filter(HH_CBSA_NOTNULL != 'XXXXX')
city_names <- c("NA", "Atlanta", "Austin", "Baltimore", "Birmingham", "Boston", "Buffalo","Charlotte", "Chicago", "Cincinnati", "Cleveland", "Columbus", "Dallas", "Denver", "Detroit", "Grand Rapids", "Hartford", "Houston", "Indianapolis", "Jacksonville", "Kansas City", "Las Vegas", "Los Angeles", "Louisville", "Memphis", "Miami", "Milwaukee", "Minneapolis", "Nashville", "New Orleans", "New York", "Oklahoma", "Orlando", "Philadelphia", "Phoenix", "Pittsburgh", "Portland", "Providence", "Raleigh", "Richmond", "Riverside", "Rochester", "Sacramento", "St. Louis", "Salt Lake City", "San Antonio", "San Diego", "San Francisco", "San Jose", "Seattle", "Tampa", "Virginia", "Washington")

citycode <- c()
count <- c()
 
for (i in 1:length(city_codes)) {
    citycode[[i]] <- as.vector(city_codes[i])
    count[i] <- nrow(vehicleperpub %>% filter(WALK_DEF > 0 & HH_CBSA == city_codes[i]))
}

x <- as.data.frame(cbind(citycode, count))

x$citycode = factor(x$citycode, 
                     levels = city_codes, 
                     labels = city_names)

walkreason_safety_valid <- vehicleperpub %>% filter(WALK_GKQ > 0)

######ParkScore
corval <- cor.test(parkRankings$ParkScore, parkRankings$Binge.drinking.among.adults.aged...18.Years) #0.5547509
corval <- cor.test(parkRankings$ParkScore, parkRankings$Current.smoking.among.adults.aged...18.Years) #-0.2167564
corval <- cor.test(parkRankings$ParkScore, parkRankings$Mental.health.not.good.for...14.days.among.adults.aged...18.Years) #-0.4265065
corval <- cor.test(parkRankings$ParkScore, parkRankings$High.blood.pressure.among.adults.aged...18.Years) #-0.3793297
corval <- cor.test(parkRankings$ParkScore, parkRankings$Taking.medicine.for.high.blood.pressure.control.among.adults.aged...18.Years.with.high.blood.pressure) #-0.207746 
corval <- cor.test(parkRankings$ParkScore, parkRankings$No.leisure.time.physical.activity.among.adults.aged...18.Years) #-0.4687821

########Recreation
corval <- cor.test(parkRankings$Recreation, parkRankings$Binge.drinking.among.adults.aged...18.Years) #-0.04509471 
corval <- cor.test(parkRankings$Recreation, parkRankings$Current.smoking.among.adults.aged...18.Years) #0.03505342
corval <- cor.test(parkRankings$Recreation, parkRankings$Mental.health.not.good.for...14.days.among.adults.aged...18.Years) #0.08557689 
corval <- cor.test(parkRankings$Recreation, parkRankings$High.blood.pressure.among.adults.aged...18.Years) #0.1860764
corval <- cor.test(parkRankings$Recreation, parkRankings$No.leisure.time.physical.activity.among.adults.aged...18.Years) #0.04075289
corval <- cor.test(parkRankings$Recreation, parkRankings$Taking.medicine.for.high.blood.pressure.control.among.adults.aged...18.Years.with.high.blood.pressure) #0.2622404

########WalkScore
corval <- cor.test(walkability$Walk.Score, walkability$Binge.drinking.among.adults.aged...18.Years) #0.2316557
corval <- cor.test(walkability$Walk.Score, walkability$Current.smoking.among.adults.aged...18.Years) #-0.03376847 
corval <- cor.test(walkability$Walk.Score, walkability$Mental.health.not.good.for...14.days.among.adults.aged...18.Years) #0.1344738
corval <- cor.test(walkability$Walk.Score, walkability$High.blood.pressure.among.adults.aged...18.Years) #0.01717222
corval <- cor.test(walkability$Walk.Score, walkability$No.leisure.time.physical.activity.among.adults.aged...18.Years) #0.05800555 
corval <- cor.test(walkability$Walk.Score, walkability$Taking.medicine.for.high.blood.pressure.control.among.adults.aged...18.Years.with.high.blood.pressure) #-0.01814264  

########BikeScore


corval <- cor.test(as.numeric(walkability$Bike.Score), walkability$Binge.drinking.among.adults.aged...18.Years) #0.3109519
corval <- cor.test(as.numeric(walkability$Bike.Score), walkability$Current.smoking.among.adults.aged...18.Years) #-0.1924141  
corval <- cor.test(as.numeric(walkability$Bike.Score), walkability$Mental.health.not.good.for...14.days.among.adults.aged...18.Years) #-0.03147091
corval <- cor.test(as.numeric(walkability$Bike.Score), walkability$High.blood.pressure.among.adults.aged...18.Years) #-0.277923
corval <- cor.test(as.numeric(walkability$Bike.Score), walkability$No.leisure.time.physical.activity.among.adults.aged...18.Years) #-0.2884379  
corval <- cor.test(as.numeric(walkability$Bike.Score), walkability$Taking.medicine.for.high.blood.pressure.control.among.adults.aged...18.Years.with.high.blood.pressure) #-0.2679057  


ggplot(parkRankings, aes(x = ParkScore, y =  Mental.health.not.good.for...14.days.among.adults.aged...18.Years)) + geom_point() + expand_limits(x = 0, y = 0)
ggplot(parkRankings, aes(x = ParkScore, y =  No.leisure.time.physical.activity.among.adults.aged...18.Years)) + geom_point()
ggplot(parkRankings, aes(x = ParkScore, y =  Binge.drinking.among.adults.aged...18.Years)) + geom_point()


