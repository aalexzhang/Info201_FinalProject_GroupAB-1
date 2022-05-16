library(tidyverse)
library(dplyr)

banned_items <- read.csv("https://raw.githubusercontent.com/the-pudding/data/master/dress-codes/banned_items.csv", stringsAsFactors = FALSE)

clothes_percentages <- read.csv("https://raw.githubusercontent.com/the-pudding/data/master/dress-codes/clothes_percentages.csv", stringsAsFactors = FALSE)

body_percentages <- read.csv("https://raw.githubusercontent.com/the-pudding/data/master/dress-codes/body_percentages.csv", stringsAsFactors = FALSE)

clothes_details <- read.csv("https://raw.githubusercontent.com/the-pudding/data/master/dress-codes/clothesDetails.csv", stringsAsFactors = FALSE)

words_percentages <- read.csv("https://raw.githubusercontent.com/the-pudding/data/master/dress-codes/words_percentages.csv", stringsAsFactors = FALSE)

# What is the most banned item? 
banned_item_frequency <- banned_items %>% 
  group_by(item) %>% 
  summarise(frequency = n())

most_banned_item <- banned_item_frequency %>% 
  filter(frequency == max(frequency, na.rm = TRUE)) %>% 
  pull(item)
  
# What is the gender that the most banned item is typically marketed to? 
most_banned_item_marketed <- clothes_percentages %>% 
  filter(n == max(n, na.rm = TRUE)) %>% 
  pull(market)

# What percentage of top banned item is marketed to female or male, or non-gender?
female_percentage_top_banned_item <- 
  nrow(clothes_percentages %>% 
         filter(market == "f")) / nrow(clothes_percentages)

male_percentage_top_banned_item <- 
  nrow(clothes_percentages %>% 
         filter(market == "m")) / nrow(clothes_percentages)

nongender_percentage_top_banned_item <- 
  nrow(clothes_percentages %>% 
         filter(market == "n")) / nrow(clothes_percentages)

# What is the percentage of items that female students are banned to wear, 
# and what is the percentage of items that male students are banned to wear
female_banned <- female_percentage_top_banned_item + nongender_percentage_top_banned_item

male_banned <- male_percentage_top_banned_item + nongender_percentage_top_banned_item

# What is the most banned body part? 
most_banned_body_part <- body_percentages %>% 
  filter(n == max(n, na.rm = TRUE)) %>% 
  pull(item)

# What is the most used word to describe the rationale that the dress code exists or that a specific item is prohibited?
most_used_word_rationale <- words_percentages %>% 
  filter(n == max(n, na.rm = TRUE)) %>% 
  pull(display)