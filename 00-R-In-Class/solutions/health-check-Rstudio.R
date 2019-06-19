###########################################################
# working directory
###########################################################
getwd()
setwd("/home/iss-user/Desktop/workshop/")
getwd()

###########################################################
# distribution histogram
###########################################################
x <- rnorm(10000)
hist(x, breaks = 50)

###########################################################
# interactive visualization
###########################################################
library(shiny)
library(plotly)

ui <- fluidPage(
  plotlyOutput("plot"),
  verbatimTextOutput("event")
)

server <- function(input, output) {

  # renderPlotly() also understands ggplot2 objects!
  output$plot <- renderPlotly({
    plot_ly(mtcars, x = ~mpg, y = ~wt)
  })
  
  output$event <- renderPrint({
    d <- event_data("plotly_hover")
    if (is.null(d)) "Hover on a point!" else d
  })
}

shinyApp(ui, server)


###########################################################
# rattle for modeling
###########################################################
library("rattle")
rattle()
# rattleInfo()


##############################
# ggplot2 in R
##############################

library('ggplot2')
help('ggplot2')

ggplot(mpg, aes(displ, hwy, colour = class)) + 
  geom_point()


##############################
# Google Map in R
##############################

# Google map example
# install.packages('ggmap')
library('ggmap')

map = get_googlemap('chicago', zoom=14, color='bw')

df = data.frame(lon=rnorm(1000, mean=-87.62, sd=0.015), 
                lat=rnorm(1000, mean=41.88, sd=0.015))


ggmap(map, extent='device') +
  stat_density2d(
    aes(x=lon, y=lat, fill=..level.., alpha =..level..),
    size = 2, bins = 4, 
    data = df,
    geom = "polygon"
  ) +
  scale_fill_gradient(low='green', high='red') +
  scale_alpha(guide=FALSE)


# Warning messages:
# 1: `panel.margin` is deprecated. Please use `panel.spacing` property instead 
# 2: Removed 100 rows containing non-finite values (stat_density2d). 

# This is because some of randomly generated data points are outside of the map log/lat. rnorm()

# https://stackoverflow.com/questions/28303200/stat-density2d-removed-rows-containing-non-finite-values

bb <- attr(map, "bb")

sum(df$lat < bb$ll.lat | 
      df$lat > bb$ur.lat | 
      df$lon < bb$ll.lon | 
      df$lon > bb$ur.lon)


###########################################################
# 3D RGL Visualization
###########################################################

# install.packages('emdbook')
# install.packages('rgl')

library('emdbook')
library('rgl')
sfun <- function(x,y) {
  d <- 3 * sqrt(x^2 + y^2)
  exp(-0.02 * d^2) * sin(d)
}

cc <- curve3d(sfun(x,y),xlim=c(-pi,pi),ylim=c(-pi,pi),n=c(50,50),
              sys3d="rgl")

colvec <- colorRampPalette(c("pink","white","lightblue"))(100)
with(cc,persp3d(x,y,z,col=colvec[cut(z,100)],alpha=0.5))
pts <-   data.frame(x=c(2,2,2), y=c(-2,-2,-2), z=c(.5,0,-.5))
with(pts,spheres3d(x,y,z,col="blue",radius=0.1))
rgl.snapshot("rgltmp1.png")
