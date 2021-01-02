ramen_ratings <- read.csv("ramen-ratings.csv")

# Ratings total
rating_vector <- ramen_ratings$Stars
rating_vector <- as.numeric(rating_vector)
rating_vector <- rating_vector[!is.na(rating_vector)]

# Ratings per brand
brand_vector <- subset(ramen_ratings, ramen_ratings$Brand)

# Discrete frequency table of ratings
factor(rating_vector)
rating_freq <- table(rating_vector)
barplot(rating_freq)

# Convert dataset to usable form
library(dplyr)
processed_data <- ramen_ratings[, c(2,4,5,6)]
processed_data$Stars <- as.numeric(processed_data$Stars)
processed_data <- na.omit(processed_data)

# Mean of ratings per brand
brand_freq <- group_by(processed_data, Brand) %>% summarize(mean = mean(Stars))
barplot(brand_freq$mean)

# Mean of ratings per type
type_freq <- group_by(processed_data, Style) %>% summarize(mean = mean(Stars))
barplot(type_freq$mean)

# Mean of ratings per country (style of ramen)
country_freq <- group_by(processed_data, Country) %>% summarize(mean = mean(Stars))
barplot(country_freq$mean)
