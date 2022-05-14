# Bar Chart comparing banned items between genders

banned_items_gender_db <- read.csv("https://raw.githubusercontent.com/the-pudding/data/master/dress-codes/clothes_percentages.csv", stringsAsFactors = FALSE)

by_gender <-
  banned_items_gender_db %>%
  group_by(market) %>%
  summarize(total = n())

