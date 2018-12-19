library(dplyr)
library(ggplot2)
library(tidyverse)
source("exploration_ishy.R")


#Function To Compute Correlation and return Correlation Value and Corresponding P-Value
#Arguments: 

compute_correlation <- function(dfName, col1, col2, subsetNum=NULL){
  print(is.null(subsetNum))
  if(!is.null(subsetNum)){
    dfName <- head(dfName, subsetNum)
  }
  c1 <- dfName[, (col1)]
  c2 <- dfName[, (col2)]
  #print(c1)
  corTestValue <- cor.test((c1), (c2))
  return(invisible(c(corVal=corTestValue$estimate, pVal=corTestValue$p.value)))
}

################# FUnction Usage Example Start ################
# list_of_outcomes <- c('','','','','')
# col1 <- score being tested
# corValuesForListOfOutcomes <- data.frame()
# for (i in 1:length(list_of_outcomes)) {
#   x <- compute_correlation(df, col1, list_of_outcomes[i], subsetVal)
#   rbind(corValuesForListOfOutcomes, x)
# }
#rownames(corValuesForListOfOutcomes) <- list_of_outcomes

################# FUnction Usage Example End ################



################### Food Access ###########################
foodaccess <- read.csv("prepped_data/FoodAccess.csv")



################### Park Rankings  #######################
park_rankings <- read.csv("prepped_data/ParkRankings.csv")

#park_rankings <- park_rankings %>% arrange((desc(POPN)))

outcome_list <- c('OBESITY','PHY_NOTGOOD','MENTAL_NOTGOOD','NO_LEISURE','HIGH_BP','DIAB')
col1 <- 'PARK_SCORE'
corValuesForListOfOutcomes <- data.frame()
names(corValuesForListOfOutcomes) <- c('corVal', 'pVal')

subsetVal <- NULL
for (i in 1:length(outcome_list)) {
   x <- compute_correlation(park_rankings, col1, outcome_list[i], subsetVal)
   names(x) <- c('corVal', 'pVal')
   #temp <- x
   corValuesForListOfOutcomes <- (rbind(corValuesForListOfOutcomes, as.data.frame(t(x))))
   print(corValuesForListOfOutcomes)
 }
rownames(corValuesForListOfOutcomes) <- outcome_list


mod_col_names <- c('X', 'CensusTract', 'City', 'ARTH', 'BINGE', 'CANCER', 'CHOLESTEROL', 'CHR_KIDNEY', 'CHR_PUL', 'COR_HD', 'ASTH', 'H_INS', 'SMOKE', 'DIAB', 'HIGH_BP', 'HIGH_CHOL', 'MENTAL_NOTGOOD', 'NO_LEISURE', 'OBESITY', 'PHY_NOTGOOD', 'STROKE', 'MED_BP', 'DOC', 'RANK','POPN', 'MEDIAN', 'PARKLAND', 'PERCENT','SPENDING','BASKETBALL', 'DOGPARK','PLAYGROUNDS','RECREATION','AMENITIES','RAW_TOT','PARK_SCORE', 'PS_RATING')
temp1 <- c()

for(i in (1:23)){
  temp1 <- mod_col_names[i]
  print(temp1)
  colnames(foodaccess)[i] <- mod_col_names[i]
}


#lawhitehalfshare, lablackhalfshare, laasianhalfshare, lanhopihalfshare, laaianhalfshare, laomultirhalfshare, lahisphalfshare
#1
#10

#head(city_level_walk_data)
test <- head(city_level_walk_data, 40)

x2 <- cor.test(as.numeric(test$BIKE_SCORE), test$NO_LEISURE)
apa(x2)
#"r = -0.52, t(38) = -3.75, p < 0.01 (2-tailed)"


x1 <- cor.test(as.numeric(city_level_walk_data$Transit.Score), city_level_walk_data$`No leisure-time physical activity among adults aged >=18 Years`)
#-0.05
x2 <- cor.test(as.numeric(city_level_walk_data$Transit.Score), city_level_walk_data$`High blood pressure among adults aged >=18 Years`)
#-0.07
x3 <- cor.test(as.numeric(city_level_walk_data$Transit.Score), city_level_walk_data$`Mental health not good for >=14 days among adults aged >=18 Years`)
#0.05
x4 <- cor.test(as.numeric(city_level_walk_data$Transit.Score), city_level_walk_data$`High blood pressure among adults aged >=18 Years`)
#-0.07(high p-value)
x5 <- cor.test(as.numeric(city_level_walk_data$Transit.Score), city_level_walk_data$`Taking medicine for high blood pressure control among adults aged >=18 Years with high blood pressure`)
#-0.1(high p-value)


foodaccess <- foodaccess[complete.cases(foodaccess), ]
foodaccess_non_urban <- foodaccess %>% filter(Urban==0)
foodaccess_urban <- foodaccess %>% filter(Urban==1)

outcome_list <- c('ARTH', 'BINGE', 'CANCER', 'CHOLESTEROL', 'CHR_KIDNEY', 'CHR_PUL', 'COR_HD', 'ASTH', 'H_INS', 'SMOKE', 'DIAB', 'HIGH_BP', 'HIGH_CHOL', 'MENTAL_NOTGOOD', 'NO_LEISURE', 'OBESITY', 'PHY_NOTGOOD', 'STROKE', 'MED_BP', 'DOC')
col1 <- 'lawhitehalfshare'
corValuesForListOfOutcomes <- data.frame()
names(corValuesForListOfOutcomes) <- c('corVal', 'pVal')

subsetVal <- NULL
for (i in 1:length(outcome_list)) {
  x <- compute_correlation(foodaccess_urban, col1, outcome_list[i], subsetVal)
  names(x) <- c('corVal', 'pVal')
  corValuesForListOfOutcomes <- (rbind(corValuesForListOfOutcomes, as.data.frame(t(x))))
  print(corValuesForListOfOutcomes)
}
rownames(corValuesForListOfOutcomes) <- outcome_list


outcome_list <- c('ARTH', 'BINGE', 'CANCER', 'CHOLESTEROL', 'CHR_KIDNEY', 'CHR_PUL', 'COR_HD', 'ASTH', 'H_INS', 'SMOKE', 'DIAB', 'HIGH_BP', 'HIGH_CHOL', 'MENTAL_NOTGOOD', 'NO_LEISURE', 'OBESITY', 'PHY_NOTGOOD', 'STROKE', 'MED_BP', 'DOC')
col1 <- 'lablackhalfshare'
corValuesForListOfOutcomes <- data.frame()
names(corValuesForListOfOutcomes) <- c('corVal', 'pVal')

subsetVal <- NULL
for (i in 1:length(outcome_list)) {
  x <- compute_correlation(foodaccess_urban, col1, outcome_list[i], subsetVal)
  names(x) <- c('corVal', 'pVal')
  corValuesForListOfOutcomes <- (rbind(corValuesForListOfOutcomes, as.data.frame(t(x))))
  print(corValuesForListOfOutcomes)
}
rownames(corValuesForListOfOutcomes) <- outcome_list

outcome_list <- c('ARTH', 'BINGE', 'CANCER', 'CHOLESTEROL', 'CHR_KIDNEY', 'CHR_PUL', 'COR_HD', 'ASTH', 'H_INS', 'SMOKE', 'DIAB', 'HIGH_BP', 'HIGH_CHOL', 'MENTAL_NOTGOOD', 'NO_LEISURE', 'OBESITY', 'PHY_NOTGOOD', 'STROKE', 'MED_BP', 'DOC')
col1 <- 'laasianhalfshare'
corValuesForListOfOutcomes <- data.frame()
names(corValuesForListOfOutcomes) <- c('corVal', 'pVal')

subsetVal <- NULL
for (i in 1:length(outcome_list)) {
  x <- compute_correlation(foodaccess_urban, col1, outcome_list[i], subsetVal)
  names(x) <- c('corVal', 'pVal')
  corValuesForListOfOutcomes <- (rbind(corValuesForListOfOutcomes, as.data.frame(t(x))))
  print(corValuesForListOfOutcomes)
}
rownames(corValuesForListOfOutcomes) <- outcome_list


ggplot(foodaccess_urban, aes(x = lawhitehalfshare, y =  MENTAL_NOTGOOD)) + geom_point() + expand_limits(x = 0, y = 0)

