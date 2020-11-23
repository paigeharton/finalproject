/usr/bin/Rscript

pth <- read.csv(file='Raw_Data/surveydata.csv, na.strings=c("", "NA"))

surveydata <- read.xlsx(pth, sheet = 'Expat_307') %>% clean_names()

surveydata$teachingcountry <- recode(surveydata$teaching_at, '1' = "Indonesia", '2' = "Thailand", '3' = "Philippines", '4' = "Vietnam", '5' = "Singapore")

write.csv(x=surveydata, file = "data.csv")