#! /usr/bin/Rscript

library(janitor)

surveydata <- read.csv(file='Raw_Data/surveydata.csv, na.strings=c("", "NA")) %>% clean_names()

surveydata$teachingcountry <- dplyr::recode(surveydata$teaching_at, '1' = "Indonesia", '2' = "Thailand", '3' = "Philippines", '4' = "Vietnam", '5' = "Singapore")

write.csv(x=surveydata, file = "data.csv")
