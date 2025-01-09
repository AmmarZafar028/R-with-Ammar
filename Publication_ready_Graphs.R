# Library
install.packages("ggpubr")
library(tidyverse)
library(ggpubr)


# Importing a dataset
df <- ToothGrowth

# Plot

P <- ggboxplot(df, x = "dose", y = "len", color = "dose",
          add = "jitter",
          shape = "dose", xlab = "Dose",
          ylab = "Length", legend.title = "Dose",
          palette = c("Blue", "red", "green"));P

# Comparison

my_comparisons <- list(c("0.5", "1"),
                       c("0.5","2"),
                       c("1", "2"))

P + stat_compare_means(comparisons = my_comparisons,
                       label = "p.signif")+
  stat_compare_means(label.y = 50)+ylim(0,60)



p2 <- ggboxplot(ToothGrowth, x = "supp", y = "len",
                color = "supp", palette = "npg",
                add = "jitter",
                facet.by = "dose", short.panel.labs = FALSE);p2

# Use only p.format as label. Remove method name.
p2 <- p2 + stat_compare_means(
  aes(label = paste0("p = ", ..p.format..))
);p2



