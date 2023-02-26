library("ggplot2")
library("dplyr")

np_data <- read.csv("/Users/anyuchen/desktop/INFO201/2017-2023-10-Checkouts-SPL-Data 2.csv", stringsAsFactors = FALSE)

favorite_book <- np_data %>% filter(Title == "The House of Broken Angels")

most_favorite_book <- favorite_book %>% select(CheckoutYear, Checkouts)
most_favorite_book <- most_favorite_book %>%
  group_by(CheckoutYear) %>%
  summarise(Checkouts = sum(Checkouts, na.rm = TRUE))
favorite_book_bar_plot <- ggplot(data = most_favorite_book) +
  geom_col(mapping = aes(
    x = CheckoutYear,
    y = Checkouts
  )) +
  labs(title = "Checkouts for The House of Broken Angels")

