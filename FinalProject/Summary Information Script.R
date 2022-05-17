library(tidyverse)
library(dplyr)

banned_items <- read.csv("https://raw.githubusercontent.com/the-pudding/data/master/dress-codes/banned_items.csv", stringsAsFactors = FALSE)

clothes_percentages <- read.csv("https://raw.githubusercontent.com/the-pudding/data/master/dress-codes/clothes_percentages.csv", stringsAsFactors = FALSE)

body_percentages <- read.csv("https://raw.githubusercontent.com/the-pudding/data/master/dress-codes/body_percentages.csv", stringsAsFactors = FALSE)

clothes_details <- read.csv("https://raw.githubusercontent.com/the-pudding/data/master/dress-codes/clothesDetails.csv", stringsAsFactors = FALSE)

words_percentages <- read.csv("https://raw.githubusercontent.com/the-pudding/data/master/dress-codes/words_percentages.csv", stringsAsFactors = FALSE)


summary_info <- list()
summary_info$most_banned_item <- banned_items %>% 
  group_by(item) %>% 
  summarise(frequency = n()) %>% 
  filter(frequency == max(frequency, na.rm = TRUE)) %>% 
  pull(item)

summary_info$female_percentage_top_banned_item <- 
  nrow(clothes_percentages %>% 
         filter(market == "f")) / nrow(clothes_percentages)

summary_info$male_percentage_top_banned_item <- 
  nrow(clothes_percentages %>% 
         filter(market == "m")) / nrow(clothes_percentages)

summary_info$nongender_percentage_top_banned_item <- 
  nrow(clothes_percentages %>% 
         filter(market == "n")) / nrow(clothes_percentages)

summary_info$female_banned <- female_percentage_top_banned_item + nongender_percentage_top_banned_item

summary_info$male_banned <- male_percentage_top_banned_item + nongender_percentage_top_banned_item

summary_info$most_banned_body_part <- body_percentages %>% 
  filter(n == max(n, na.rm = TRUE)) %>% 
  pull(item)

summary_info$most_used_word_rationale <- words_percentages %>% 
  filter(n == max(n, na.rm = TRUE)) %>% 
  pull(display)