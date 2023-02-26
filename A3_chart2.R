library("ggplot2")
library("dplyr")

spl_data <- read.csv("/Users/anyuchen/desktop/2017-2023-10-Checkouts-SPL-Data 2.csv", stringsAsFactors = FALSE)


sum_checkouts <- spl_data %>%
  filter(MaterialType %in% c("BOOK", "EBOOK", "MAGAZINE", "AUDIOBOOK", "SOUNDDISC", "VIDEODISC")) %>%
  group_by(CheckoutYear, MaterialType) %>%
  summarize(total_checkouts = sum(Checkouts))

line_plot <- ggplot(data = sum_checkouts) +
  geom_line(mapping = aes(
    x = CheckoutYear,
    y = total_checkouts,
    color = MaterialType
  )) +
  labs(
    title = "Trends of Medium Type",
    x = "Checkout Year",
    y = "Total Checkouts",
    color = "Medium Type"
  )
