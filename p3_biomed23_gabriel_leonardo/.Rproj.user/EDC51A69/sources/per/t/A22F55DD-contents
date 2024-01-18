#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)
library(forcats)
library(dplyr)


spot2023


ui <- fluidPage(
  numericInput('number_input',
               'Enter a number: ',
               value = 0, min = 0, max = nrow(spot2023)), 
  
  mainPanel(
    tableOutput('my_table')
  )
)


server <- function(input, output, session) {
  
  output$my_table <- renderTable({
    spot2023$streams <- as.numeric(spot2023$streams)
    top_musics <- head(spot2023[order(-spot2023$streams), ], input$number_input)
    return(top_musics)
  })
  
}

shinyApp(ui = ui, server = server)







