library(shiny)

shinyUI(pageWithSidebar(
    headerPanel("Car Stopping Distance predictions"),
    sidebarPanel(
        textInput(
            inputId = "speed",
            label = "Speed (MPH)",
            value = "50"
        ),
        checkboxInput(
            inputId="showRegression", 
            label="Show regression line", 
            value = TRUE
        )
    ),
    mainPanel(
        p(paste0("This is a simple service for predicting the stopping distance of the car by its current speed.",
            "To find the stopping distance simply enter your speed on the left (in mph). Also you can add or remove the ",
            "regression line to/from the plot by clicking the respective checkbox.")),
        p("This service is based on the standard \"cars\" dataset."),
        h3("Distance by speed plot"),
        plotOutput("speedDistPlot"),
        h3("Predicted distance:"),
        h3(textOutput("predictedDist"))
    )
))
