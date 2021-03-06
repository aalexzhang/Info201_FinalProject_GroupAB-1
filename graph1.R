# Percentage of schools for each of the top 10 banned items
library(tidyverse)

banned_items_db <- read.csv("https://raw.githubusercontent.com/the-pudding/data/master/dress-codes/banned_items.csv", stringsAsFactors = FALSE)

top10 <-
  banned_items_db %>%
  group_by(item) %>%
  summarise(total = n()) %>%
  arrange(desc(total)) %>%
  slice(1:10)
  
ggplot(top10, aes(x = reorder(item, -total), y = total, fill = item)) +
  geom_bar(stat = 'identity') +
  coord_cartesian(ylim = c(315,410)) +
  scale_x_discrete(guide = guide_axis(n.dodge=3)) +
  xlab("banned dress item") + 
  ylab("number of schools") + 
  ggtitle("Top 10 most frequently banned dress items")
