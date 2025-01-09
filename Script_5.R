df <-nycflights13::flights


# Plotting

library(ggplot2)

colnames(df)

ggplot(data = df,mapping = aes(x = distance, y = arr_delay, col =carrier))+
  geom_point()

# Normal Distribution

hist(df$distance)
qqnorm(df$distance)


# data generate

normal_data <-rnorm(200)

hist(normal_data, col = "red")

qqnorm(normal_data)

shapiro.test(normal_data)

# Corrplot

install.packages("corrplot", dependencies = TRUE)
library(corrplot)

df <- mtcars

m <- cor(df, method = "pearson")

corrplot(m)
corrplot(m, method = "number")
corrplot(m, method = "number", order = "alphabet")
corrplot(m, method = "number", order = "alphabet", type= "lower")

corrplot.mixed(m, lower = "number", upper = "pie")


# Clustering

corrplot(m, order = "hclust", addrect = 2)



