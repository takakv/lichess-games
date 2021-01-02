ramen_ratings <- read.csv("ramen-ratings.csv")

# Convert dataset to usable form
library(dplyr)
processed_data <- ramen_ratings[, c(2,4,5,6)]
processed_data$Stars <- as.numeric(processed_data$Stars)
processed_data <- na.omit(processed_data)

# Discrete frequency table of ratings
rating_freq <- table(processed_data$Stars)
barplot(rating_freq)

# Mean of ratings per brand
brand_freq <- group_by(processed_data, Brand) %>% summarize(mean = mean(Stars))
barplot(brand_freq$mean)

# Mean of ratings per type
type_freq <- group_by(processed_data, Style) %>% summarize(mean = mean(Stars))
barplot(type_freq$mean)

# Mean of ratings per country (style of ramen)
country_freq <- group_by(processed_data, Country) %>% summarize(mean = mean(Stars))
barplot(country_freq$mean)
