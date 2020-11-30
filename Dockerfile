FROM rocker/tidyverse

# install R packages like this
# put as close to top of script as possible to make best 
# use of caching and speed up builds
RUN Rscript -e "install.packages('ggplot2')"
RUN Rscript -e "install.packages('dplyr')"
RUN Rscript -e "install.packages('tidyverse')"
RUN Rscript -e "install.packages('janitor')"
RUN Rscript -e "install.packages('kableExtra')"
RUN Rscript -e "install.packages('epiDisplay')"


# make a project directory in the container
# mount our local project directory to this directory
RUN mkdir /finalproject
RUN mkdir /finalproject/report

# copy contents of local folder to project folder in container
COPY ./ /finalproject/

# make R scripts executable
RUN chmod +x /finalproject/R_Code/*.R


# make container entry point bash
CMD make -C finalproject
