
My Final Project

For my final project I will be analyzing survey data from individuals teaching abroad during the covid-19 pandemic. 
 
 - Raw_Data/surveydata.xlsx : This is the raw data file
 - R_Code/InstallPackages.R : This will download all packages needed for this analysis
 - R_Code/Final_Project_Clean_Data.R : This will cleant the data
 - R_Code/FinalProjectCode.Rmd : This is the Rmd file for generating the final report
 - Makefile : This is the makefile which contains the rules for installing packages and generating the report
 - Dockerfile : This is the Dockerfile to run the analysis through Docker

For this analysis, you will need the following R packages:

 - dplyr
 - tidyverse
 - open xlsx
 - epiDisplay
 - ggplot2
 - kableExtra

To install these packages to your computer, from the project folder you can run the following bash code:

make install
To execute the analysis, from the project folder you can run the following bash code:

make report
This makefile will install the necessary R packages, clean the data, generate a bar graph, and create a file called Cool_Project_Report.html output in your directory that contains the results of the analysis.

For information about the rules in the Makefile, you can run the following bash code from the project folder:

make help
To clean up the working directory, you can run the following bash code from the project folder:

make clean
