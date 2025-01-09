# Anova

## Dataset Import
install.packages("palmerpenguins")
library(palmerpenguins)

df <- penguins
colnames(df)

# find unique values
unique(df$species)
unique(df$island)

# ttest lgaye

t.test(df$bill_length_mm ~ df$sex)

library(tidyverse)
ggplot(df, aes(sex,bill_length_mm,fill = sex))+geom_boxplot()


data <- df %>%
  select(species, flipper_length_mm) %>%
  drop_na()

# summary
summary(data)


data %>%
  group_by(species) %>%
  summarize(mean(flipper_length_mm))


ggplot(data)+
  aes(species, flipper_length_mm, col = species)+
  geom_jitter() + theme(legend.position = "none")


# Normal Distribution
data %>%
  group_by(species) %>%
  summarize(shapiro_pvalue = shapiro.test(flipper_length_mm)$p.value)

s_w <- shapiro.test(data$flipper_length_mm)
summary(s_w)

# Anova
res_aov <- aov(flipper_length_mm ~ species, data = data)

# Normal
summary(res_aov)
hist(res_aov$residuals)
qqnorm(res_aov$residuals)


shapiro.test(res_aov$residuals)


# Homogeneous

install.packages("car")
library(car)
leveneTest(flipper_length_mm ~ species, data = data)

install.packages("lattice")
library(lattice)
dotplot(flipper_length_mm ~ species, data = data)


ggplot(data) +
  aes(species, flipper_length_mm, fill = species)+ 
  geom_boxplot()


# Calculate mean sd for plots and Aov figures

aggregate(flipper_length_mm ~ species, data = data,
          function(x) round(c(mean = mean(x), sd = sd(x)), 2))

# Another way
 
df1 <- group_by(data, species) %>%
  summarise(
    mean = mean(flipper_length_mm, na.rm = TRUE),
    sd = sd(flipper_length_mm,na.rm = TRUE))
df1

# Anova 
oneway.test(flipper_length_mm ~ species, data = data, var.equal = TRUE)

# Anova 2nd way
res_aov <- aov(flipper_length_mm ~ species, data = data)
summary(res_aov)


# Post Hoc test
install.packages("multcomp", dependencies = TRUE)
library(multcomp)

# Tukey HSD test

res_aov <- aov(flipper_length_mm ~ species, data = data)
summary(res_aov)
post_test <- glht(res_aov, linfct = mcp(species = "Tukey"))
summary(post_test)

plot(post_test)

# Dunnet Test

res_aov <- aov(flipper_length_mm ~ species, data = data)
summary(res_aov)
Dun <- glht(res_aov, linfct = mcp(species = "Dunnet"))
summary(Dun)

# Two way Anova 
library(ggthemes)
library(multCompView)
library(tidyverse)

df <- ToothGrowth

# Calculate two way Anova
anova <- aov(len ~ supp*dose, data = df)
summary(anova)

# Lettering

letters <- multcompLetters4(anova,tukey)
letters

# Convert them into a pdf

letters < data.frame(letters$"supp:dose"$Letters)
letters

# mean and sd
df_mean <-df %>%
  group_by(supp,dose) %>%
  summarise(len_mean =mean(len), sd = sd(len)) %>%
  arrange(desc(len_mean))

df_mean$letters  <- letters$letters..supp.dose..Letters
df_mean

