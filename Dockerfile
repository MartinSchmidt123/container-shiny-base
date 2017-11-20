FROM rocker/r-ver:3.4
LABEL maintainer "Martin Schmidt <docker@private-data.de>"

RUN apt-get update && apt-get install -y \
  default-libmysqlclient-dev \
  --no-install-recommends \
&& rm -rf /var/lib/apt/lists/*

RUN R -e "install.packages(c('shiny','RMySQL', 'ggplot2', 'plyr'), repos='https://cloud.r-project.org/')"

RUN mkdir /app

COPY Rprofile.site /usr/local/lib/R/etc/

EXPOSE 3838

CMD ["R", "-e shiny::runApp('/app')"]
