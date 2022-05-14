# Word cloud for different banned items
install.packages("ggwordcloud")
library("ggwordcloud")

words_percentages_db <- read.csv("https://raw.githubusercontent.com/the-pudding/data/master/dress-codes/words_percentages.csv")

ggplot(words_percentages_db, aes(label = item, size = percent)) +
  geom_text_wordcloud(area_corr = TRUE) + 
  scale_radius(range = c(0, 20), limits = c(0, NA)) +
  ggtitle("Word cloud of most used words to describe banned clothing items")
