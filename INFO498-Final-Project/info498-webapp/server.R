# Server Logic for Shiny app
# Team Members: Ishan Saksena, Jayashree Raman, Naga Soundari Balamurugan, Zubin Chopra

library(shiny)
source("park_viz.R")
source("walkability_viz.R")
source("food_access_viz.R")
source("introduction_viz.R")
source("data_viz.R")


shinyServer(function(input, output) {
  
  # Render All Graphs
  output$parkGraph <- renderPlotly({
    parkViz(input$select_condition)
  })
  
  output$parkBarGraph <- renderPlotly({
    parkBarGraph(input$select_condition)
  })
  
  output$bikeGraph <- renderPlotly({
    bikeviz(input$select_condition_bike)
  })
  
  output$bikeBarGraph <- renderPlotly({
    bikeBarGraph(input$select_condition_bike)
  })
  
  output$foodAccessGraph <- renderPlotly({
    foodAccessGraph(input$select_distance, input$select_race, input$select_outcome)
  })
})
