#testando se está sincronizadoooooooo

my_packages <- (c(
  "gapminder", "ggforce", "gh", "globals", "openintro", "profvis", 
  "RSQLite", "shiny", "shinycssloaders", "shinyFeedback", 
  "shinythemes", "testthat", "thematic", "tidyverse", "vroom", 
  "waiter", "xml2", "zeallot" 
))

lapply(my_packages, require, character.only = T)


injuries
injuries <- vroom::vroom("neiss/injuries.tsv")
products <- vroom::vroom('neiss/products.tsv')
population <- vroom::vroom('neiss/population.tsv')

products
population
View(population)
View(products)
View(injuries)

selected <- injuries %>%
  filter(prod_code == 649)
nrow(selected)



selected %>%
  count(location, wt = weight, sort = TRUE)

selected %>%
  count(body_part, wt = weight, sort = T)

selected %>%
  count(diag, wt = weight, sort = T)

summary <- selected %>%
  count(age, sex, wt = weight)
summary

summary %>%
  ggplot(aes(age, n, color = sex))+
  geom_line()+
  labs(y = 'Estimated number of injuries')

summary <- selected %>%
  count(age, sex, wt = weight) %>%
  left_join(population, by = c('age', 'sex'))%>%
  mutate(rate = n / population * 1e4)
summary

summary %>%
  ggplot(aes(age, rate, color = sex))+
  geom_line()+
  labs(y = 'Injuries per 10.000 people')

selected %>%
  sample_n(10)%>%
  pull(narrative)

injuries %>%
  mutate(diag = fct_lump(fct_infreq(diag), n = 5))%>%
  group_by(diag)%>%
  summarise(n = as.integer(sum(weight)))
           
count_top <- function(df, var, n = 5) {
  df %>%
    mutate({{ var }} := fct_lump(fct_infreq({{ var }}), n = n)) %>%
    group_by({{ var }}) %>%
    summarise(n = as.integer(sum(weight)))
}
count_top(injuries)  
