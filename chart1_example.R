library("ggplot2")
library("dplyr")

np_data <- read.csv("/Users/anyuchen/desktop/2017-2023-10-Checkouts-SPL-Data 2.csv", stringsAsFactors = FALSE)

book <- np_data %>%
  group_by(MaterialType) %>%
  filter(MaterialType == "BOOK") %>%
  summarise(total_book = sum(Checkouts, na.rm = TRUE))
ebook <- np_data %>%
  group_by(MaterialType) %>%
  filter(MaterialType == "EBOOK") %>%
  summarise(total_book = sum(Checkouts, na.rm = TRUE))
magazine <- np_data %>%
  group_by(MaterialType) %>%
  filter(MaterialType == "MAGAZINE") %>%
  summarise(total_book = sum(Checkouts, na.rm = TRUE))
music <- np_data %>%
  group_by(MaterialType) %>%
  filter(MaterialType == "MUSIC") %>%
  summarise(total_book = sum(Checkouts, na.rm = TRUE))
movie <- np_data %>%
  group_by(MaterialType) %>%
  filter(MaterialType == "MOVIE") %>%
  summarise(total_book = sum(Checkouts, na.rm = TRUE))
audiobook <- np_data %>%
  group_by(MaterialType) %>%
  filter(MaterialType == "AUDIOBOOK") %>%
  summarise(total_book = sum(Checkouts, na.rm = TRUE))

material_types <- c("book", "ebook", "magazine", "music", "movie", "audiobook")
total_checkouts_1 <- c(book$total_book, ebook$total_book, magazine$total_book, music$total_book, movie$total_book, audiobook$total_book)
total_checkout_2 <- tibble(material_types , total_checkouts_1)

checkouts_bar_plot <- ggplot(data = total_checkout_2) +
  geom_col(mapping = aes(
    x = material_types,
    y = total_checkouts,
    fill = material_types
  )) +
  labs(title = "Total checkouts from 2017 to 2023")
