library(shiny)
 shinyServer(function(input,output){
  
#Output Title 
  output$question <- renderText(input$questionID)
  output$performance <- renderText(if_else(input$performance==4,"Time","Click"))
  
#subset question and audit group
  sub <- reactive({df %>% filter(df$question==input$questionID, df$audit==input$audit)})

#plot the performance
  
  output$hist <- renderPlot({
    h <- if_else(input$performance==4,"ms","number of click")
    colm <- as.numeric(input$performance)
    hist(sub()[,colm],breaks = 10, main = c("Histogram of Question",input$questionID), xlab = h)
    })
  output$text <- renderUI({
    HTML(paste("Question", input$questionID,"for", if_else(input$audit==1,"audit","registered"),"students on",if_else(input$performance==4,"time","click"),"used",sep = " "))
  })
})
 
