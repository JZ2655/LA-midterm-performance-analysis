#upload shiny library
library(shiny)

#Shiny App UI
shinyUI(fluidPage(
  titlePanel(title= h4("Midterm Results", align="left")),
  
  sidebarLayout(
    
    sidebarPanel(
      radioButtons("performance","Choose a type of performance", choices = c("Time"=4,"Click"=5), selected = "Time"),
      radioButtons("audit", "audit or not", c("Yes"="1","No"="0"),selected = "0"),
      selectInput("questionID","Select a question",choices = as.vector(unique(df$question)), selected= "1",selectize = FALSE)),
    
    mainPanel(
     htmlOutput("text"),
      plotOutput("hist")
     )
  )))
