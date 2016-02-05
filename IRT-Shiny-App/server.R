if(!require("shiny")) install.packages("shiny", dependencies-TRUE)
#update.packages(ask=FALSE)
library(shiny)

# Define server logic required to draw a the logistic curve
shinyServer(function(input, output) {
  
  # Expression that generates the curve. The expression is
  # wrapped in a call to renderPlot to indicate that:
  #
  #  1) It is "reactive" and therefore should re-execute automatically
  #     when inputs change
  #  2) Its output type is a plot
  
  output$distPlot <- renderPlot({
    theta <- seq(-4,4,.01)
    # draw the logistic curve with specified parameters
    plot(theta, 
         input$c +(1-input$c)*(exp(input$d * input$a * (theta - input$b))/(1+exp(input$d * input$a*(theta - input$b)))), 
         type="l", col="black", xlab=expression(theta), ylab="p", xlim=c(-4,4), ylim=c(0,1))
    
    if(input$ncurve)
      lines(seq(-4,4,.01),pnorm(seq(-4,4,.01)), col="red")
  })
})