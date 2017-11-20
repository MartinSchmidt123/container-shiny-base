# docker-shiny-base

This docker image can be used as a base image for shiny apps used
with ShinyProxy.
It includes a mysql database client required in most of our apps.


## Test environment
Run

```bash
docker run --rm  -v "${PWD}/app.R:/app/app.R" -p 3838:3838 shiny-base
```
and visit [`localhost:3838`](http://localhost:3838/).




## Build the image
To build the image yourself, clone this repository and run

```bash
docker build -t shiny-base .
```
