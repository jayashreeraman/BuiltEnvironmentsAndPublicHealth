library(dplyr)
library(ggplot2)
library(tidyverse)

# 500 Cities Health Statistics
# https://www.cdc.gov/500cities/

cities_health = read.csv("data/500Cities.csv")
View(head(cities_health))

seattle_health = filter(cities_health, CityName == "Seattle")
# View(head(seattle_health))

# National Household Travel Survey
# https://nhts.ornl.gov/documentation

hhpub= read.csv("data/NHTSData/hhpub.csv")
perpub= read.csv("data/NHTSData/perpub.csv")
trippub= read.csv("data/NHTSData/trippub.csv")
vehpub= read.csv("data/NHTSData/vehpub.csv")

# View(head(hhpub))
# View(head(perpub))
# View(head(tripub))
# View(head(vehpub))

# Food Access by Census Tract
food_access= read.csv("data/FoodAccess.csv")

View(head(food_access))

# Park Rankings by City
park_rankings = read.csv("data/ParkRankings.csv")

View(head(park_rankings))

# Walkability / Bikeability by City
walkability = read.csv("data/walk-bike-ability.csv")
View(head(walkability))

# Cities that appear across all three datasets
cities_of_interest = intersect(cities_health$CityName, intersect(walkability$City, park_rankings$City))
tracts_of_interest = intersect(cities_health$TractFIPS, food_access$CensusTract)

# Filter down to city
filtered_cities_health_city_level = filter(cities_health, CityName %in% cities_of_interest)
filtered_cities_health_city_level = filter(filtered_cities_health_city_level, GeographicLevel == "City")
filtered_cities_health_city_level = filter(filtered_cities_health_city_level, Year == 2015)
filtered_cities_health_city_level = filter(filtered_cities_health_city_level, Data_Value_Type == "Age-adjusted prevalence")
View(filtered_cities_health_city_level)

# Reshape Data
filtered_cities_health_city_level_subset = filtered_cities_health_city_level[, c("CityFIPS" ,"CityName", "Measure", "Data_Value")]
# View(filtered_cities_health_city_level_subset)
city_level_reshaped = spread(filtered_cities_health_city_level_subset, Measure, Data_Value)
View(city_level_reshaped)

# Combine with Walkability and park rankings
colnames(city_level_reshaped)[2] <- "City"
city_level_park_data = left_join(city_level_reshaped, park_rankings)
View(city_level_park_data)
write.csv(city_level_park_data, file = "prepped_data/ParkRankings.csv")

city_level_walk_data = left_join(city_level_reshaped, walkability)
View(city_level_walk_data)
write.csv(city_level_walk_data, file = "prepped_data/Walkability.csv")

# Filter down to census tract
filtered_cities_health_tract_level = filter(cities_health, TractFIPS %in% tracts_of_interest)
filtered_cities_health_tract_level = filter(filtered_cities_health_tract_level, GeographicLevel == "Census Tract")
filtered_cities_health_tract_level = filter(filtered_cities_health_tract_level, Year == 2015)
View(filtered_cities_health_tract_level)

# Reshape Data
filtered_cities_health_tract_level_subset = filtered_cities_health_tract_level[, c("TractFIPS" ,"CityName", "Measure", "Data_Value")]
View(filtered_cities_health_city_level_subset)
tract_level_reshaped = spread(filtered_cities_health_tract_level_subset, Measure, Data_Value)
View(tract_level_reshaped)

# Combine with Food Access Data
colnames(tract_level_reshaped)[1] <- "CensusTract" 
tract_level_food_data <- left_join(tract_level_reshaped, food_access)
View(head(tract_level_food_data, 50))
write.csv(tract_level_food_data, file = "prepped_data/FoodAccess.csv")


################################################################################
# Outcomes of interest (Variable names) @Jayashreeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
# Binge drinking among adults aged >=18 Years
# Current smoking among adults aged >=18 Years
# < 7 hours of sleep, 
# No leisure-time physical activity among adults aged >=18 Years
# High blood pressure among adults aged >=18 Years
# Taking medicine for high blood pressure control among adults aged >=18 Years with high blood pressure
# Mental health not good for >=14 days among adults aged >=18 Years


