FROM privatedata/r-base
LABEL maintainer "Martin Schmidt <docker@private-data.de>"

RUN apt-get update && apt-get install -y \
  libmysqlclient-dev \
  --no-install-recommends \
&& rm -rf /var/lib/apt/lists/*

RUN R -e "install.packages(c('shiny','RMySQL', 'ggplot2', 'plyr'), repos='https://cloud.r-project.org/')"

RUN mkdir /app

COPY Rprofile.site /usr/lib/R/etc/

EXPOSE 3838

CMD ["R", "-e shiny::runApp('/app')"]
