library(shiny)
library(ggplot2)
library(datasets)

data("cars")

lm_model <- lm(dist ~ speed, cars)

plotBase <- qplot(x = speed, y = dist, data =  cars)
regressionLine <- geom_smooth(method="lm", col="red", lwd=1)

shinyServer(function(input, output) {
    output$predictedDist <- renderText({
        if (is.na(as.numeric(input$speed))) {
            return("Please enter the numeric value.")
        }
        
        predicted <- predict(lm_model, newdata = data.frame(speed = c(as.numeric(input$speed))))
        if (predicted < 0) {
            predicted <- 0
        }
        paste0(round(predicted, 1), " ft.")
    })
    
    output$speedDistPlot <- renderPlot({
        myPlot <- plotBase
        if (input$showRegression == TRUE) {
            myPlot <- myPlot + regressionLine
        }
        myPlot
    })
})