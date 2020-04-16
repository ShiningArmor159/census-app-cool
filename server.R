
# server.R
source("helpers.R")
counties = readRDS("data/counties.rds")
library(maps)
library(mapproj)
shinyServer(
 function(input, output) {
 output$map = renderPlot({
 data = switch(input$var, "Percent White" = counties$white, "Percent Black" =
counties$black,"Percent Hispanic" = counties$hispanic, "Percent Asian" = counties$asian)
 color = switch(input$var, "Percent White" = "darkgreen", "Percent Black" = "black", "Percent Hispanic" = "chocolate4", "Percent Asian" = "blue")
 legend = switch(input$var, "Percent White" = "%White people", "Percent Black" = "%Black people",
"Percent Hispanic" = "%Hispanics", "Percent Asian" = "%Asian people")
 percent_map(data, color, legend, input$range[1], input$range[2])
 })
 }
) 