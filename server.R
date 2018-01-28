#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
# Define server logic 
shinyServer(function(input, output) {
  
  output$distPlot <- renderPlot({
   
    dataY<-airquality$Ozone
    dataX <- switch(input$rd,
                    Wind = airquality$Wind,
                    Solar = airquality$Solar.R,
                    Temp = airquality$Temp
                   )
    
    xlab<-input$rd
    ylab<-"Ozone"
    color <- ifelse(airquality$Month == 5, 'red',
                    ifelse(airquality$Month == 6, 'blue', 
                           ifelse(airquality$Month==7,'black',
                                  ifelse(airquality$Month==8,'yellow','green'))))
  if(input$rd=="Wind"){
    model <- lm(Ozone ~ Wind, data = airquality)

  }
    
    if(input$rd=='Solar'){
      model <- lm(Ozone ~ Solar.R, data = airquality)
      
    }
    if(input$rd=='Temp'){
      model <- lm(Ozone ~ Temp, data = airquality)
      
    }
    
     
   if(input$showlm){
     plot(dataX, dataY, xlab = xlab, ylab = ylab,col=color,pch=19 )
     legend('topright', legend = c('May','June','July','August','Sep'), col = c('red','blue','black','yellow','green'), cex = 0.8, pch = 19) 
     abline(model, col = "red", lwd = 2)
        }
      else{plot(dataX, dataY, xlab = xlab, ylab = ylab,col=color,pch=19 )
        legend('topright', legend = c('May','June','July','August','Sep'), col = c('red','blue','black','yellow','green'), cex = 0.8, pch = 19) 
      }
         
  })
  
})
