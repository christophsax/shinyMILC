

shinyUI(fluidPage(
  
  # Application title
  titlePanel("The MILCy Way"),
  
  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
    #       age = 50
    # smkint = 100
    # pred_yrs = 40
    # gender = "male"
    # status = "current"
    # ts = 20
    # n = 50


      sliderInput("age", "age:", 10, 99, value = 55),
      sliderInput("smkint", "cigarettes per day", 1, 99, value = 25),
      sliderInput("pred_yrs", "prediction horizon:", 5, 50, value = 15),
      selectInput("status", label = "Status", choices = c("current", "former", "never")),
      selectInput("gender", label = "Gender", choices = c("female", "male")),
      sliderInput("tsqs", "start and quit smoking age:", 10, 99, value = c(15, 55)),
      sliderInput("n", "number of runs:", 10, 100, value = 15),
      helpText("Note: this is currently responsive: each input",
               "change triggers a new simulation. If we want to",
               "allow larger number of runs we should avoid that.")
    ),
    
    mainPanel(
      plotOutput("oSurvivalPlot")
    )
  )

))
