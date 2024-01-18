my_packages <- c(
  "gapminder", "ggforce", "gh", "globals", "openintro", "profvis", 
  "RSQLite", "shiny", "shinycssloaders", "shinyFeedback", 
  "shinythemes", "testthat", "thematic", "tidyverse", "vroom", 
  "waiter", "xml2", "zeallot" 
)

lapply(my_packages, require, character.only = TRUE)

'''dir.create('dados_discentes')'''


dados <- vroom::vroom('dados_discentes/discentes_1_2023.tsv')
dados

injuries <- vroom::vroom('neiss/injuries.tsv')
injuries

population <- vroom::vroom('neiss/population.tsv')

products <- vroom::vroom('neiss/products.tsv')

dir.create('dados_spot')

spot2023 <- read.csv('dados_spot/spotify-2023.csv')
summary(spot2023)

glimpse(spot2023)

View(spot2023)
