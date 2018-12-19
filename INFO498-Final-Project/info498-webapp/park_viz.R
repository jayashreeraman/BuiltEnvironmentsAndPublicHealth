library("dplyr")
library("ggplot2")
library("knitr")
library("plotly")

park_data <- read.csv("prepped_data/ParkRankings.csv")

park_data <- park_data[unique(park_data$City), ]
park_data <- park_data[order(-park_data$ParkScore), ]
cols <- c("City", "Arthritis.among.adults.aged...18.Years", "Binge.drinking.among.adults.aged...18.Years", "Coronary.heart.disease.among.adults.aged...18.Years", "Current.asthma.among.adults.aged...18.Years", "Current.smoking.among.adults.aged...18.Years", "High.blood.pressure.among.adults.aged...18.Years", "High.cholesterol.among.adults.aged...18.Years.who.have.been.screened.in.the.past.5.Years", "Mental.health.not.good.for...14.days.among.adults.aged...18.Years", "Obesity.among.adults.aged...18.Years", "Physical.health.not.good.for...14.days.among.adults.aged...18.Years", "ParkScore")
park_data_viz <- park_data[, cols]
colnames(park_data_viz) <- c("City", "Arthritis", "Binge Drinking", "Coronary Heart Disease", "Asthma", "Smoking", "High Blood Pressure", "High Cholestrol", "Mental Health", "Obesity", "Physical Health", "Park Score")

parkViz <- function(condition) {
  
  mytext=paste("Park Score = ", park_data_viz$`Park Score`, "\n", "City: ", park_data_viz$City,  sep="")    
  
  plot <- ggplot(park_data_viz, aes(x = park_data_viz[condition], y = park_data_viz$`Park Score`)) + 
    geom_point(col = "indianred", aes(text = paste0("City: ", park_data_viz$City, "<br />", "Park Score: ", park_data_viz$`Park Score`))) +
    geom_smooth(method = "lm", se = T, col = "deepskyblue3") +
    labs(x = condition, y = "Park Score", title = paste0(condition, " VS Park Score")) + 
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

parkBarGraph <- function(condition) {
  df <- head(park_data_viz[order(-park_data_viz[condition]), ], 10)
  df <- df[, c("City", "Park Score", condition)]
  plot <- ggplot(df, aes(x = City, y = df[condition])) +
    geom_bar(stat = "identity", width = .5, fill = "lightcoral", aes(text = paste0("Disease: ", df[ ,condition], "%", "<br>", "Park Score: ", df$`Park Score`))) + 
    labs(x = "City", y = paste0(condition, "(%)"), title = paste0("Top 10 Cities with Highest Levels of ", condition)) +
    theme(
      legend.position = "none",
      panel.background = element_rect(fill = "gray29",
                                      colour = "gray29",
                                      size = 0.5, linetype = "solid"),
      panel.grid.major = element_line(size = 0.5, linetype = 'solid',
                                      colour = "gray94"), 
      panel.grid.minor = element_line(size = 0.25, linetype = 'solid',
                                      colour = "gray94"),
      axis.text.x = element_text(angle = 90, hjust = 1)
    )
  
  plot <- ggplotly(ggplotly(plot, tooltip = c("text")))
  
  return (plot)
}

parkCityBarGraph_top10 <- function() {
  score_park_data_viz <- distinct(park_data_viz, City, .keep_all = TRUE)
  arrange(score_park_data_viz, desc(`Park Score`))
  top10_score_park_data_viz <- head(score_park_data_viz, 10)
  bottom10_score_park_data_viz <- tail(score_park_data_viz, 10)
  plot <- ggplot(top10_score_park_data_viz, aes(x = City, y = `Park Score`)) +
    geom_bar(stat = "identity", width = .5, fill = "darkorchid3") + 
    labs(x = "City", y = "Park Score", title = "Cities vs Park Scores") +
    theme(
      legend.position = "none",
      panel.background = element_rect(size = 0.5, linetype = "solid"),
      panel.grid.major = element_line(size = 0.5, linetype = 'solid',
                                      colour = "gray94"), 
      panel.grid.minor = element_line(size = 0.25, linetype = 'solid',
                                      colour = "gray94"),
      axis.text.x = element_text(angle = 90, hjust = 1)
    )
  
  plot <- ggplotly(plot)
  style(plot, hoverinfo = "none")
  
  return (plot)
}

parkCityBarGraph_bottom10 <- function() {
  score_park_data_viz <- distinct(park_data_viz, City, .keep_all = TRUE)
  arrange(score_park_data_viz, desc(`Park Score`))
  top10_score_park_data_viz <- head(score_park_data_viz, 10)
  bottom10_score_park_data_viz <- tail(score_park_data_viz, 10)
  plot <- ggplot(bottom10_score_park_data_viz, aes(x = City, y = `Park Score`)) +
    geom_bar(stat = "identity", width = .5, fill = "darkorchid3") + 
    labs(x = "City", y = "Park Score", title = "Cities vs Park Scores") +
    theme(
      legend.position = "none",
      panel.background = element_rect(size = 0.5, linetype = "solid"),
      panel.grid.major = element_line(size = 0.5, linetype = 'solid',
                                      colour = "gray94"), 
      panel.grid.minor = element_line(size = 0.25, linetype = 'solid',
                                      colour = "gray94")
    )
  
  plot <- ggplotly(plot)
  style(plot, hoverinfo = "none")
  
  return (plot)
}

