library(shiny)
shinyUI(fluidPage(
  #Main title
  titlePanel("Evolution rate vs. mutation rate"),
  #Sidebar
  sidebarLayout(position="right",
    sidebarPanel(
      selectInput("virus", "Choose virus of interest:", 
                  choices=c("TMV", "polio1", "HCV", "fluva", "HIV", "HSV1", "AHBV")),
      selectInput("print", "Choose a value to print:",
                  choices=c("None","Evolution rate", "Mutation rate", "Virus class")),
      br(),
      h5("Virus key"),
      p("TMV = tobacco mosaic virus"),
      p("polio1 = Poliovirus type 1"),
      p("HCV = hepatitis C virus"),
      p("fluva = Influenza A virus"),
      p("HIV = Human immunodeficiency virus"),
      p("HSV1 = herpes simplex virus 1"),
      p("AHBV = avian hepatitis B virus"),
      hr()
    ),
    #Spot for the plot
    mainPanel(
      h5("Virus evolution rates are highly correlated with mutation rates."),
      p("Viruses that have higher mutation rates, such as RNA viruses, typically evolve at a faster rate than
         their DNA counterparts. Likely because of this, RNA viruses dominate the increasing number of emerging pathogens."),
      p("Choose a virus you would like to highlight using the menu to the right. You can also choose to 
         display a certain empirical value of the virus.", style="color:blue"),
      plotOutput("virusPlot")
    )
  )))

