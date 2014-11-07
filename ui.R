library(shiny)
shinyUI(fluidPage(
  #Main title
  titlePanel("Evolution rate vs. mutation rate"),
  #Sidebar
  sidebarLayout(position="right",
    sidebarPanel(
      selectInput("virus", "Choose virus of interest:", 
                  choices=c("TMV", "polio1", "HCV", "fluva", "HIV", "HSV1", "AHBV")), 
      hr()
    ),
    #Spot for the plot
    mainPanel(
      plotOutput("virusPlot")
    )
  )))

