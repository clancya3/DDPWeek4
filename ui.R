#Slope/Int

library(shiny)

shinyUI(fluidPage(

  #Title
  titlePanel("Finding Least Squares Regression Line"),

  #Side panel
  sidebarLayout(
    sidebarPanel(
       sliderInput("b1",
                   "Slope Estimate",
                   min = -10,
                   max = 0,
                   value = -5,
                   step = .1),
       sliderInput("b0",
                   "Intercept Estimate",
                   min = 0,
                   max = 50,
                   value = 25,
                   step = 1),
       checkboxInput("show_bestfitline", "Show Line of Best Fit", value = FALSE)
    ),

    # Show a plot of the generated distribution
    mainPanel(
       plotOutput("regplot"),
       h4("Root Mean Square Error"),
       textOutput("RMSE")
    )
  )
))
