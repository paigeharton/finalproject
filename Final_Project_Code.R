#! /usr/bin/Rscript 

#input libraries
library(openxlsx)
library(janitor)
library(epiDisplay)
library(ggplot2)
library(kableExtra)
library(dplyr)
library(tidyverse)

#read in data
pth <- 'https://github.com/paigeharton/finalproject.git/surveydata.xlsx'

#clean column names for easier formatting
surveydata <- read.xlsx(pth, sheet = 'Expat_307') %>% clean_names()

#recode numeric country label to character country label
surveydata$teachingcountry <- recode(surveydata$teaching_at, '1' = "Indonesia", '2' = "Thailand", '3' = "Philippines", '4' = "Vietnam", '5' = "Singapore")

#compare confidence in host country response to COVID-19 by country
tabl1 <- table(surveydata$poli_effect, surveydata$teachingcountry)

#print formatted table for comparision
kable(tabl1, caption = "Confidence in Host Country Response to COVID-19 by Country") %>% kable_styling(bootstrap_options = c("striped", "hover"))

#print political confidence response and display teaching countries
ggplot(surveydata, aes(poli_effect, colour = teachingcountry)) + 
  geom_histogram()

## End
