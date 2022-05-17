library(tidyverse)

banned_items <- read.csv("https://raw.githubusercontent.com/the-pudding/data/master/dress-codes/banned_items.csv", stringsAsFactors = FALSE)

banned_item_frequency <- banned_items %>% 
  group_by(item) %>% 
  summarise(how_many_schools_banned_this_item = n())