#rule for making report
FinalProjectCode.html: data.csv FinalProjectCode.Rmd
	Rscript -e "rmarkdown::render('FinalProjectCode.Rmd')" 

#rule for cleaning data
data.csv: Final_Project_Clean_Data.R surveydata.xlsx
	chmod +x Final_Project_Clean_Data.R && \
	Rscript Final_Project_Clean_Data.R

#rule for installing packages
install:
	chmod +x InstallPackages.R && \
	Rscript InstallPackages.R

#rule for building dockerfile
.PHONY:build
build: Dockerfile
		docker build -t image .

#rule for help
.PHONY: help
help: 
	@echo "FinalProjectCode.html: Generate final analysis report."
	@echo "install: Installed R packages needed for analysis."
	@echo "data.csv: Cleans raw dataset."
	@echo "build	: Build docker image."