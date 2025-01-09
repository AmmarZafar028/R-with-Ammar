install.packages("ggplot2", dependencies = TRUE)
library(ggplot2)



#  Data import krna 

data("iris")
View(iris)

ggplot(data = iris, mapping = aes(x= Sepal.Length,y=Sepal.Width))+geom_point()

# Adding Colo
ggplot(data = iris, mapping = aes(x= Sepal.Length,y=Sepal.Width,col = Species))+geom_point()

# Changes Based on size
ggplot(data = iris, mapping = aes(x= Sepal.Length,y=Sepal.Width,size = Species))+geom_point()

# Changes based on shape 
ggplot(data = iris,mapping =aes(x= Sepal.Length,y= Sepal.Width,shape= Species))+geom_point()

# Changes based on shape and color
ggplot(data = iris,mapping =aes(x= Sepal.Length,y= Sepal.Width,
                                shape= Species,col = Species))
+geom_point()

# Changes based on shape and color
ggplot(data = iris,mapping =aes(x= Sepal.Length,y= Sepal.Width,
                                col = Species))+
geom_point(size=3)

# Plot on mpg
data(mpg)
p1 <- ggplot(data = mpg, mapping = aes(x=cty, y=hwy,
                                 col= manufacturer))+geom_point()
p1
# tidyverse
library(tidyverse)

# saving in pdf
ggsave("mpg_plot.pdf",plot = p1,width = 8, height = 10,
       units = "in")

# saving in png
ggsave("mpg_plot.png",plot = p1,width = 8, height = 10,
       units = "in", dpi = 300)








