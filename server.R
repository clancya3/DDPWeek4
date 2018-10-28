#Slope/Int

library(shiny)

shinyServer(function(input, output) {
    library(datasets)
    modfit <- lm(mpg ~ wt, data = mtcars)

#Making Regression Plot
  output$regplot <- renderPlot({
    estb0 <- input$b0
    estb1 <- input$b1
    plot(mtcars$wt, mtcars$mpg, xlab = "Weight", ylab = "MPG", xlim = c(0,5), ylim = c(0,50))
    abline(a = estb0, b = estb1, col = "blue", lwd = 2)
    if(input$show_bestfitline)
    {abline(modfit, col = "red", lwd = 2)
     text(4,40, "MPG = 37.285 - 5.344Weight")}
  })

#Calculating RMSE
  output$RMSE <- renderText({
    estb0 <- input$b0
    estb1 <- input$b1
    sqrt(sum((mtcars$mpg - (estb0 + estb1*mtcars$wt))^2)/(length(mtcars$mpg)-2))
  })
})


