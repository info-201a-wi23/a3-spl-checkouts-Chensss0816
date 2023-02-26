library("ggplot2")
library("dplyr")

spl_data <- read.csv("/Users/anyuchen/desktop/2017-2023-10-Checkouts-SPL-Data 2.csv", stringsAsFactors = FALSE)

favorite_book <- spl_data %>% filter(Title == "The House of Broken Angels")

most_favorite_book <- favorite_book %>% select(CheckoutYear, Checkouts)
most_favorite_book <- most_favorite_book %>%
  group_by(CheckoutYear) %>%
  summarise(Checkouts = sum(Checkouts, na.rm = TRUE))

favorite_book_bar_plot <- ggplot(data = most_favorite_book) +
  geom_col(mapping = aes(
    x = CheckoutYear,
    y = Checkouts,
    fill = Checkouts
  )) +
  labs(
    title = "Checkouts for The House of Broken Angels",
    x = "Checkout Year",
    Y = "Checkouts",
    color = "Checkouts"
  )
