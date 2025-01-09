


# How to save data frames to excel format

install.packages("writexl", dependencies = TRUE)
library(writexl)
write_xlsx(df, "mpg.xlsx")

library(tidyverse)

 
# data frame

data(mpg)
df <- mpg


install.packages("readxl", dependencies = TRUE)
library(readxl)


df <- read_excel("mpg.xlsx")

# Plotting in ggplot
ggplot(data = df,mapping = aes(x = cty, y = hwy,
                               col = class))+geom_point()+
  facet_wrap(.~class,nrow = 2)+ theme_bw()+
  labs(title = "This is a mindblowing plot",
       x = "City", y = "Height", col= "Legends")+
  theme(strip.background = element_rect(fill = "red"))+
  theme(strip.text = element_text(color = "white"))

# Data Transformation

install.packages("nycflights13", dependencies = TRUE)
library(nycflights13)
library(tidyverse)

df <- nycflights13::flights

summary(df)

# Filter lgaty hain

january <- filter(df, month==1, day==1)
feb <-filter(df,month==2 )
march <-filter(df,month==3)
april <-filter(df,month==4)
may <-filter(df,month==5)
june <-filter(df,month==6)

nrow(january)

january <- filter(df,month==1, carrier=="UA")

jan_feb <- filter(df,month %in% c(1,2))

jan_feb <-filter(df, month==1 | month==2)

filter(df, arr_delay > 120)
filter(df,arr_delay > 180)

filter(df,arr_delay > 120 & arr_delay <300)









