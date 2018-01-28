#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
    # Application title
  titlePanel("Ozone and weather in  New York City"),
  
  sidebarLayout(
    sidebarPanel(
      h5("Getting Started - Documentation", a("Link", href="https://sasmira.shinyapps.io/SHD1/")),
                radioButtons("rd",
                    label="Select variable for X-Axis:",
                    choices=list("Wind","Solar","Temp"),
                    selected="Wind"),
      checkboxInput("showlm", "Show/Hide Linear Model ", value = FALSE)
      
    
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      h3("Graph of Weather Points"),
      plotOutput("distPlot"))
    
  )
))
