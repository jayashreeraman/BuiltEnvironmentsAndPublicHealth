# User Interface for Shiny app. 
# Team Members: Ishan Saksena, Jayashree Raman, Naga Soundari Balamurugan, Zubin Chopra

library(shiny)
library(plotly)

shinyUI(fluidPage(
  
  # Application title
  titlePanel("Social Determinants of Health : Built Environments"),
  
  tabsetPanel(type = "tabs",
  
    tabPanel("Introduction", 
             
             mainPanel(
               
               em("Team Members: Ishan Saksena, Jayashree Raman, Naga Soundari Balamurugan, Zubin Chopra"),
               
               h3("Built Environments: Neighbourhoods"),
               h5("A built environment includes, but is not limited to access to healthy food resources, parks, transportation facilities."),
               h5("For our analysis, we explored three main types of Built Environments and their effect on Public Health"),
               tags$ul(
                 tags$li("Parks"), 
                 tags$li("Transportation"), 
                 tags$li("Food Access")
               ),
               
               
               h5("We used aggregated scores for each of these built environments for different cities in the United States and correlated it with the physical and mental heath outcomes for those cities"),
               
               h3("Significance"),
               h5("With most of the population migrating towards urban areas, we feel that planning and building a sustainable urban environment is very critical and essential"),
               h5("Primarily, there is a growing interest in designing cities that support and help its residents live healthy lives."),
               h5("By analyzing the effect of different built environments and their effect on general public health, we want to emphasize what factors must be kept in mind while planning urban infrastructure."),
               h5("We also try to do a comparative study between cities to explore how they rank in terms of different built environment infrastructure."),
               
               h3("Target Audience"),
               tags$ul(
                 tags$li("Urban City Planners"), 
                 tags$li("Construction Firms"), 
                 tags$li("Non-Profit organizations"),
                 tags$li("Citizens")
               ),
               
               h5("Our goal is to explore the relation between neighbourhood built environments and public health through effective visualizations."),
               h5("Depending on how correlated these measures are, we could infer on how cities rank in these areas as well as set priorities for future research in this area.")
             )
    ),
    
    tabPanel("Data", 
             
             h2("500 Cities Health Data"),
             p(
               a(href="https://www.cdc.gov/500cities/", "The 500 cities health dataset"),
               " provides city and census tract level estimates on chronic disease factors, health outcomes and 
               clinical preventive services.",
               "From this dataset we used data on binge drinking, smoking, sleep durations, time for leisure and physical activities,
               blood pressure and mental health."
             ),
             p("The purpose of the 500 Cities Project is to provide city- and census tract-level small area estimates for chronic disease risk factors, health outcomes, and clinical preventive service use for the largest 500 cities in the United States."),
             
             h2("Park Quality"),
             p(
               a(href="http://parkscore.tpl.org/rankings_advanced.php#sm.0000kbft6m124iel6ufsl45r54oqa", "The Parkscore 2018 dataset"),
               " provides city level scores for the quality of parks measured by acreage, access, safety, amenities 
               for the 100 most populous cities in the US. 93 of these cities also appear in 500 Cities health dataset.",
               "From this dataset we used just the park score for each city. We then calculated correlations with 
               the above listed factors from the 500 Cities Health Dataset."
             ),
             p("The Trust for Public Land's ParkScore Index is the most comprehensive rating system ever developed to measure how well
               the 100 largest US cities are meeting the needs for parks."),
             p("Using an advanced GIS (Geographic Information System), ParkScore provides in-depth data to guide local park improvement efforts. Our mapping technology identifies which neighborhoods and demographics are underserved by parks and how many people are able to reach a park within a ten-minute walk. 
               Cities can earn a maximum ParkScore of 100."),
             
             h2("Walkability and Bikeability"),
             p(
               a(href="https://www.walkscore.com/cities-and-neighborhoods/", "The Walkability annd Bikeability dataset"),
               " ranks cities based on walkability and bikeabilty. It scores both measures on the basis of access to public transit, 
               distances to amenities, proximity to other people and places of interest. ",
               "From this dataset we used just the three scores i.e. walkability, bikeability, and transit scores for each city. 
               We then calculated correlations with the above listed factors from the 500 Cities Health Dataset."
             ),
             p("Distance to local resources (e.g., stores, public buildings, transportation) can be an indicator for community participation in that it shows access to participation in a city. The Walk Score (www.walkscore.com) is a publicly available system for determining scores based on the distance to and variety of community facilities. The score is available at different levels but has shown to be valid within a distance of a mile. 
               It is a score of 0-100, 100 being most accessible within a quarter mile and 0 being car dependent."),
             
             
             h2("Food Access"),
             p(
               a(href="https://www.ers.usda.gov/data-products/food-access-research-atlas/", "The Food Access Dataset"),
               " provides a census level overview for food access indicators and breaks it down further by race, age and income. 
               It provides measures for how many people have access to a grocery store within half a mile, 1 mile, and 10 miles.",
               "From this dataset we used just data on the share of people who live far away from grocery stores for each census tract. 
               We then calculated correlations with the above listed factors from the 500 Cities Health Dataset."
             )
             ),
    
    tabPanel("Parks",
      sidebarLayout(
        sidebarPanel(
           selectInput("select_condition", label = h3("Select Condition"), 
                       choices = list("Arthritis", "Binge Drinking", "Coronary Heart Disease", "Asthma", "Smoking", "High Blood Pressure", "High Cholestrol", "Mental Health", "Obesity", "Physical Health"), 
                       selected = 1),
           h3("Analysis"),
           tags$ul(
             tags$li("From the correlation plot, we see that diabetes, coronary heart disease, obesity, poor physical health and 
                     high cholesterol have a moderately negative correlation with increasing Park Score."), 
             tags$li("Similarly, poor mental health and lack of leisure time are also negatively correlated with increasing Park Scores."), 
             tags$li("This is an encouraging sign towards making sure that cities have better Park Scores, emphasizing that it would be wise 
                     to invest in the development of parks.")
             
             ),
           em("Note: We find that Binge Drinking has a positive correlation with Park Scores, which is not a very optimistic sign.
              It could be attributed to the small size of the dataset that we analyzed or really probable.")
        ),
        
        mainPanel(
           plotlyOutput("parkGraph"),
           plotlyOutput("parkBarGraph")
        )
      )
    ),
    
    tabPanel("Bikeability",
    
      sidebarLayout(
        sidebarPanel(
          selectInput("select_condition_bike", label = h3("Select Condition"), 
                      choices = list("Arthritis", "Binge Drinking", "Coronary Heart Disease", "Asthma", "Smoking", "High Blood Pressure", "High Cholestrol", "Mental Health", "Obesity", "Physical Health"), 
                      selected = 1),
          h3("Analysis"),
          tags$ul(
            tags$b(tags$li("Walk Scores:")),
            p("We found a very poor correlation for Walkability Scores of the cities and the prevalence of physical heath outcomes such as 
              Obesity, Coronary Heart Disease, High Blood Pressure, High Cholesterol, as well as mental health outcomes such as poor mental health and no leisure time."),
            tags$b(tags$li("Bike Scores:")), 
            p("We found that there was a moderate negative correlation between the Bike Score of a city and the prevalence of Diabetes
              and High Cholesterol in the city. Other than these outcomes, there weren't any significant relationships between the health outcomes and bike scores of the cities."),
            tags$b(tags$li("Transit Scores:")),
            p("Again, we found a very low correlation for the Transit Scores of the cities and the prevalence of physical heath outcomes such as 
              Obesity, Coronary Heart Disease, High Blood Pressure, High Cholesterol, as well as mental health outcomes such as poor mental health and no leisure time."),
            
            em("Note: We find that Binge Drinking has a positive correlation with all three of Walk Scores, Bike Scores and Transit Scores.")
          )
        ),
        
        mainPanel(
          plotlyOutput("bikeGraph"),
          plotlyOutput("bikeBarGraph")
        )
      )

    ),
    
    tabPanel("Food",
             
       sidebarLayout(
         sidebarPanel(
           selectInput("select_outcome", label = h3("Select health Outcome"), 
                       choices = list("Arthritis", "Binge Drinking", "Coronary Heart Disease", "Asthma", "Smoking", "High Blood Pressure", "High Cholestrol", "Mental Health", "Obesity", "Physical Health"), 
                       selected = 1),
           
           selectInput("select_distance", label = h3("Select Distance to Grocery Store"), 
                       choices = list("0.5 Mile", "1 Mile", "10 Miles", "20 Miles or More"), 
                       selected = 1),
           
           selectInput("select_race", label = h3("Select Race"), 
                       choices = list("White", "African American", "Asian", "Native Hawaiian / Pacific Islander ", "American Indian / Alaska Native", "Hispanic / Latino", "Other / Multiple Races"), 
                       selected = 1),
           
           h3("Analysis"),
           
           p("We found moderate negative correlations between high cholesterol levels, obesity and low access to stores more than 10 miles away.")
           
         ),
         
         mainPanel(
           plotlyOutput("foodAccessGraph")
         ),
       )
    )
  )
))
