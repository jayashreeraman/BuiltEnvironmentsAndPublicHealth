library("dplyr")
library("ggplot2")
library("knitr")
library("plotly")

# Load Data
food_access_data = read.csv("../prepped_data/FoodAccess.csv")
food_access_data <- food_access_data[complete.cases(food_access_data), ]

# Create Dictionaries mapping from user options to dataset column names
original_health_columns <- c("City", "Arthritis.among.adults.aged...18.Years", "Binge.drinking.among.adults.aged...18.Years", "Coronary.heart.disease.among.adults.aged...18.Years", "Current.asthma.among.adults.aged...18.Years", "Current.smoking.among.adults.aged...18.Years", "High.blood.pressure.among.adults.aged...18.Years", "High.cholesterol.among.adults.aged...18.Years.who.have.been.screened.in.the.past.5.Years", "Mental.health.not.good.for...14.days.among.adults.aged...18.Years", "Obesity.among.adults.aged...18.Years", "Physical.health.not.good.for...14.days.among.adults.aged...18.Years", "ParkScore")
new_health_columns <- c("City", "Arthritis", "Binge Drinking", "Coronary Heart Disease", "Asthma", "Smoking", "High Blood Pressure", "High Cholesterol", "Mental Health", "Obesity", "Physical Health", "Park Score")

original_dist_columns <- c("half", "1", "10", "20")
new_dist_columns <- c("0.5 Mile", "1 Mile", "10 Miles", "20 Miles or More")

original_race_columns <- c("white", "black", "asian", "nhopi", "aian", "omultir", "hisp")
new_race_columns <- c("White", "African American", "Asian", "Native Hawaiian / Pacific Islander ", "American Indian / Alaska Native", "Hispanic / Latino", "Other / Multiple Races")

health_dictionary <- vector(mode="list", length=12)
names(health_dictionary) <- new_health_columns
for(i in 1:12) {
  health_dictionary[[i]] <- original_health_columns[[i]]
}

dist_dictionary <- vector(mode="list", length=4)
names(dist_dictionary) <- new_dist_columns
for(i in 1:4) {
  dist_dictionary[[i]] <- original_dist_columns[[i]]
}

race_dictionary <- vector(mode="list", length=7)
names(race_dictionary) <- new_race_columns
for(i in 1:7) {
  race_dictionary[[i]] <- original_race_columns[[i]]
}


# Create Visualization from dynamic selection of variables
food_prefix <- "la"
food_suffix <- "share"

foodAccessGraph <- function(food_distance, food_race, health_outcome) {
  
  health_outcome_name <- health_dictionary[[health_outcome]]
  access_name <- paste0(food_prefix, race_dictionary[[food_race]], dist_dictionary[[food_distance]], food_suffix, sep="")
  
  plot <- ggplot(food_access_data, aes(x = food_access_data[[access_name]], y = food_access_data[[health_outcome_name]])) + 
    geom_point(size=0.2, col = "indianred", aes(text = paste0("Food Access: ", food_access_data[[access_name]], "<br />", "Health Outcome", food_access_data[[health_outcome_name]]))) +
    geom_smooth(method = "lm", se = T, col = "deepskyblue3") +
    labs(x = paste("Race: ", food_race, " Radius: ", food_distance), y = health_outcome, title = paste0(health_outcome, " for ", food_distance, " miles or more for race: ", food_race)) + 
    theme(
      legend.position = "none",
      panel.background = element_rect(fill = "gray29",
                                      colour = "gray29",
                                      size = 0.5, linetype = "solid"),
      panel.grid.major = element_line(size = 0.5, linetype = 'solid',
                                      colour = "gray94"), 
      panel.grid.minor = element_line(size = 0.25, linetype = 'solid',
                                      colour = "gray94")
    )
  
  plot <- ggplotly(ggplotly(plot, tooltip = c("text")))
  
  return (plot)
}