ramen_ratings <- read.csv("ramen-ratings.csv")

# Convert dataset to usable form
library(dplyr)
processed_data <- ramen_ratings[, c(2,4,5,6)]
processed_data$Stars <- as.numeric(processed_data$Stars)
processed_data <- na.omit(processed_data)

# Discrete frequency table of ratings
rating_freq <- table(processed_data$Stars)
barplot(rating_freq, main = "Frequencies of discrete ratings", ylab = "count")

# Discrete frequency table of range ratings
rating_freq_ranges <- table(floor(processed_data$Stars))
barplot(rating_freq_ranges, main = "Frequencies of floored ratings", xlab = "5 point scale intervals", ylab = "count")

# Mean of ratings per brand
brand_freq <- group_by(processed_data, Brand) %>% summarize(mean = mean(Stars))
barplot(brand_freq$mean, main = "Mean of ratings per brand", ylab = "5 point scale")

# Mean of ratings per type (style of ramen)
type_freq <- group_by(processed_data, Style) %>% summarize(mean = mean(Stars))
barplot(type_freq$mean, names = type_freq$Style, horiz=T, las=1, main = "Mean of ratings per ramen type", xlab = "5 point scale")

# Mean of ratings per country (ramen available in that country)
country_freq <- group_by(processed_data, Country) %>% summarize(mean = mean(Stars))
barplot(country_freq$mean, names = country_freq$Country, horiz=T, las=1, space = 1, main = "Mean of ratings per country", xlab = "5 point scale")

