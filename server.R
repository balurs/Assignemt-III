# server.R  for Assignmet_II

library(shiny)
library(datasets)
library(dplyr)

shinyServer(function(input, output) {
  output$table <- renderDataTable({
    disp_seq <- seq(from = input$disp[1], to = input$disp[2], by = 0.1)
    hp_seq <- seq(from = input$hp[1], to = input$hp[2], by = 1)
    data <- transmute(mtcars, Car = rownames(mtcars), 
                      Price = (cyl * 500) + (hp * 100) + (am * 2500) + (carb * 5000),
                      MilesPerGallon = mpg, 
                      Cylinders = cyl, Displacement = disp, Horsepower = hp, 
                      Transmission = am)
    data <- filter(data, Price <=input$MaxP & Price >= input$MinP , Cylinders %in% input$cyl, 
                   Displacement %in% disp_seq, Horsepower %in% hp_seq, Transmission %in% input$am)
    data <- mutate(data, Transmission = ifelse(Transmission==0, "Automatic", "Manual"))
    data <- arrange(data, Price  )
    data
  }, options = list(lengthMenu = c(5, 15, 30), pageLength = 30))
})