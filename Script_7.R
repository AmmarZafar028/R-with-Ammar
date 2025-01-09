# data import

df <- iris


# One sample t test
t.test(df$Sepal.Length,mu = 6.5)


# Two sample t test
# t test/unpaired

t.test(df$Sepal.Length,df$Petal.Length,paired = TRUE)

# paired t test kab lgna

pre_treatment <- c(rnorm(2000,mean =150, sd =10))
post_treatment <- c(rnorm(2000, mean = 144, sd =9))

# t test ab lagna h paired wala
t.test(pre_treatment,post_treatment,paired = TRUE)


library(tidyverse)
df <- iris
df <- df %>%
  filter(Species %in% c("setosa", "versicolor")) 
  
  t.test(df$Petal.Width ~ df$Species) 

