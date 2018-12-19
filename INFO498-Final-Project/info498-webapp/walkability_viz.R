library("dplyr")
library("ggplot2")
library("knitr")
library("plotly")

bikeability_data <- read.csv("prepped_data/Walkability.csv")


bikeability_data <- bikeability_data[unique(park_data$City), ]
bikeability_data <- bikeability_data[order(-park_data$ParkScore), ]
cols <- c("City", "Arthritis.among.adults.aged...18.Years", "Binge.drinking.among.adults.aged...18.Years", "Coronary.heart.disease.among.adults.aged...18.Years", "Current.asthma.among.adults.aged...18.Years", "Current.smoking.among.adults.aged...18.Years", "High.blood.pressure.among.adults.aged...18.Years", "High.cholesterol.among.adults.aged...18.Years.who.have.been.screened.in.the.past.5.Years", "Mental.health.not.good.for...14.days.among.adults.aged...18.Years", "Obesity.among.adults.aged...18.Years", "Physical.health.not.good.for...14.days.among.adults.aged...18.Years", "Bike.Score")
#cols <- c("City", "CityFIPS", "City" , "ARTH", "BINGE" , "COR_HD", "ASTH", "SMOKE", "HIGH_BP", "HIGH_CHOL", "MENTAL_NOTGOOD", "OBESITY", "PHY_NOTGOOD", 
             #"BIKE_SCORE")
bike_data_viz <- bikeability_data[, cols]
colnames(bike_data_viz) <- c("City", "Arthritis", "Binge Drinking", "Coronary Heart Disease", "Asthma", "Smoking", "High Blood Pressure", "High Cholestrol", "Mental Health", "Obesity", "Physical Health", "Bike Score")

bike_data_viz$`Bike Score` = as.numeric(levels(bike_data_viz$`Bike Score`))[bike_data_viz$`Bike Score`]
bike_data_viz <- bike_data_viz %>% filter(is.na(bike_data_viz$`Bike Score`) == F)


bikeviz <- function(condition) {
  plot <- ggplot(bike_data_viz, aes(x = bike_data_viz[condition], y = bike_data_viz$`Bike Score`)) + 
    geom_point(col = "purple4", aes(text = paste0("City: ", bike_data_viz$City, "<br />", "Bike Score: ", bike_data_viz$`Bike Score`))) +
    geom_smooth(method = "lm", se = T, col = "deepskyblue3") +
    ylim(limits = c(30, 80)) +
    labs(x = condition, y = "Bike Score", title = paste0(condition, " VS Bike Score")) + 
    theme(
      legend.position = "none",
      panel.background = element_rect(size = 0.5, linetype = "solid"),
      panel.grid.major = element_line(size = 0.5, linetype = 'solid',
                                      colour = "gray94"),
      panel.grid.minor = element_line(size = 0.25, linetype = 'solid',
                                      colour = "gray94")

    )

  return (ggplotly(plot, tooltip = c("text")))
}


bikeBarGraph <- function(condition) {
  df <- head(bike_data_viz[order(-bike_data_viz[condition]), ], 10)
  df <- df[, c("City", "Bike Score", condition)]
  plot <- ggplot(df, aes(x = City, y = df[condition])) +
    geom_bar(stat = "identity", width = .5, fill = "purple2", aes(text = paste0("Disease: ", df[ ,condition], "%", "<br>", "Bike Score: ", df$`Bike Score`))) + 
    labs(x = "City", y = paste0(condition, "(%)"), title = paste0("Top 10 Cities with Highest Levels of ", condition)) +
    theme(
      legend.position = "none",
      panel.background = element_rect(size = 0.5, linetype = "solid"),
      panel.grid.major = element_line(size = 0.5, linetype = 'solid',
                                      colour = "gray94"), 
      panel.grid.minor = element_line(size = 0.25, linetype = 'solid',
                                      colour = "gray94"),
      axis.text.x = element_text(angle = 90, hjust = 1)
    )
  return(ggplotly(plot, tooltip = c("text")))
}