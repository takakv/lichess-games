ramen_ratings <- read.csv("ramen-ratings.csv")
rating_vector <- ramen_ratings$Stars
rating_vector <- as.numeric(rating_vector)
rating_vector <- rating_vector[!is.na(rating_vector)]

# Discrete frequency table
factor(rating_vector)
rating_freq <- table(rating_vector)
barplot(rating_freq)
