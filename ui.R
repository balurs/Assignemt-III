# ui.R for Assignment_III

library(markdown)
shinyUI(navbarPage("Used car salse Price in NJ",
                   tabPanel("Home",
                            # Sidebar
                            sidebarLayout(
                              sidebarPanel(
                                helpText("Provide preferences on cars:"),
                                numericInput('MinP', 'Min Price :', 500,  min = 500, max = 1000000,step = 500),
                                numericInput('MaxP', 'Max Price :', 1000000, min = 1000, max = 1000000,step = 1000),
                                checkboxGroupInput('cyl', 'Number of cylinders:', c("Four"=4, "Six"=6, "Eight"=8), selected = c(4,6,8)),
                                sliderInput('disp', 'Displacement', min=70, max=480, value=c(70,480), step=10),
                                sliderInput('hp', 'Gross horsepower', min=50, max=340, value=c(50,340), step=10),
                                checkboxGroupInput('am', 'Transmission:', c("Automatic"=0, "Manual"=1), selected = c(0,1))
                              ),
                              mainPanel(
                                dataTableOutput('table')
                              )
                            )
                   ),
                   tabPanel("Help",
                            mainPanel(
                              includeMarkdown("Rhelp.Rd")
                            )
                   )

                                 
))   