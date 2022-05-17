# Treemap comparing banned items between genders
install.packages("treemapify")
library("treemapify")

banned_items_gender_db <- read.csv("https://raw.githubusercontent.com/the-pudding/data/master/dress-codes/clothes_percentages.csv", stringsAsFactors = FALSE)

by_gender <-
  banned_items_gender_db %>%
  group_by(market) %>%
  summarize(total = n())

ggplot(by_gender, aes(area = total, fill = market, label = market)) +
  geom_treemap() + 
  geom_treemap_text(fontface = "italic", colour = "white", place = "centre", size = 50) + 
  ggtitle("Treemap showing proportion between banned male, female, and non-gendered \nclothing items")
