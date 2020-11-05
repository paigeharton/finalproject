---
output: html_document
---
#my final project

#for my final project I will be analyzing survey data from
#individuals teaching abroad during the covid-19 pandemic. 

#the following packages must be installed in
#order to run the analysis

#openxlsx, janitor, epiDisplay, ggplot2, kableExtra, dplyr, tidyverse

#utlize the make file and Final_Project_Clean_Data.R to clean the data first

/usr/bin/Rscript

#clean column names for easier formatting
#recode numeric country label to character country label

library(dplyr)
library(janitor)
library(tidyverse)
library(ggplot2)

surveydata <- read.xlsx(pth, sheet = 'Expat_307') %>% clean_names()

surveydata$teachingcountry <- recode(surveydata$teaching_at, '1' = "Indonesia", '2' = "Thailand", '3' = "Philippines", '4' = "Vietnam", '5' = "Singapore")

write.csv(x=surveydata, file = "data.csv")


#the below code will run the analysis. There is also a .Rmd 
#file included in this repository that should run the analysis

#! /usr/bin/Rscript 

#input libraries
```{r, setup, include=FALSE}

knitr::opts_chunk$set(echo=FALSE, message=FALSE, warning=FALSE)
library(openxlsx)
library(janitor)
library(epiDisplay)
library(ggplot2)
library(kableExtra)
library(dplyr)
library(tidyverse)
```

#read in data

```{r, read-data, echo=FALSE}
pth <- read.csv(file='data.csv, na.strings=c("", "NA"))
```

#compare confidence in host country response to COVID-19 by country
#print formatted table for comparision
#print political confidence response and display teaching countries
```{r, make-table}
tabl1 <- table(surveydata$poli_effect, surveydata$teachingcountry)

kable(tabl1, caption = "Confidence in Host Country Response to COVID-19 by Country") %>% kable_styling(bootstrap_options = c("striped", "hover"))

ggplot(surveydata, aes(poli_effect, colour = teachingcountry)) + 
  geom_histogram()
```

## End
