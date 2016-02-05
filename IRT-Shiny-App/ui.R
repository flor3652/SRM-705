if(!require("shiny")) install.packages("shiny", dependencies-TRUE)
#update.packages(ask=FALSE)
library(shiny)

# Define UI for application that draws the logistic curve of an "item"
shinyUI(fluidPage(
  
  # Application title
  titlePanel("IRT Parameter Illustration App"),
  
  # Sidebar with a slider inputs for parameters
  sidebarLayout(
    sidebarPanel(
      sliderInput("a",
                  "Select your value for a, the discrimination parameter:",
                  min = 0,
                  max = 2,
                  value = 1,
                  step = .01),
      sliderInput("b",
                  "Select your value for b, the difficulty parameter:",
                  min = -4,
                  max = 4,
                  value = 0,
                  step = .01),
      sliderInput("c",
                  "Select your value for c, the guessing parameter:",
                  min = 0,
                  max = 1,
                  value = 0,
                  step = .01),
      sliderInput("d",
                  "Select your value for D, the SCaling constant:",
                  min = 0,
                  max = 2,
                  value = 1.7,
                  step = .01),
      checkboxInput("ncurve", "Please check to compare to the standard normal.")
    ),
    
    # Show a plot of the logistic curve
    mainPanel(
      plotOutput("distPlot")
    )
  )
))