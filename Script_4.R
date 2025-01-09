library(nycflights13)
library(tidyverse)

df <- nycflights13::flights

summary(df)

glimpse(df)

# Iris Example
data("iris")

iris %>% 
  group_by(Species) %>%
  summarise(avg = mean(Sepal.Length)) %>%
  arrange(avg)


# Original data to calculate sum

df %>%
  group_by(carrier) %>%
  summarise(add = sum(hour)) %>%
  arrange(add)

df1 <-df %>% select(year,month,day) 
df2 <-df %>% select(year,month,day) %>% filter(month == 1)
df3 <-df %>% select(year,day,month) 


df %>% select(year:arr_delay)


df <- rename(df, dep_time=departure_time)

arr_time <- df %>% arrange(arr_time)

arr_time1 <-df %>% arrange(desc(arr_time))


df %>% distinct(df$carrier)
df %>% distinct(df$flight)
