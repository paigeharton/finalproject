#rule for making report
FinalProjectReport.html: data.csv R_Code/FinalProjectCode.Rmd
	Rscript -e "rmarkdown::render('R_Code/FinalProjectCode.Rmd')" 

#rule for cleaning data
data.csv: R_Code/Final_Project_Clean_Data.R Raw_Data/surveydata.xlsx
	chmod +x R_Code/Final_Project_Clean_Data.R && \
	Rscript R_Code/Final_Project_Clean_Data.R

#rule for installing packages
install:
	chmod +x R_Code/InstallPackages.R && \
	Rscript R_Code/InstallPackages.R

#rule for building dockerfile
.PHONY:build
build: Dockerfile
	docker build -t image .

#rule for help
.PHONY: help
help: 
	@echo "FinalProjectReport.html: Generate final analysis report."
	@echo "install: Installed R packages needed for analysis."
	@echo "data.csv: Cleans raw dataset."
	@echo "build	: Build docker image."