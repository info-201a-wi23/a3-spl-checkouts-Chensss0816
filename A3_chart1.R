library("ggplot2")
library("dplyr")

spl_data <- read.csv("/Users/anyuchen/desktop/2017-2023-10-Checkouts-SPL-Data 2.csv", stringsAsFactors = FALSE)

type_checkouts <- spl_data %>%
  filter(MaterialType %in% c("BOOK", "EBOOK", "MAGAZINE", "AUDIOBOOK", "SOUNDDISC", "VIDEODISC")) %>%
  select("MaterialType", "CheckoutYear", "Checkouts")

total_type_checkouts <- type_checkouts %>%
  group_by(CheckoutYear, MaterialType) %>%
  summarize(total_type_checkouts = sum(Checkouts))


stacked_bar_plot <- ggplot(data = total_type_checkouts) +
  geom_col(
    aes(
      x = CheckoutYear,
      y = total_type_checkouts,
      fill = MaterialType
    ),
    position = "fill"
  ) +
  labs(
    title = "Relative checkouts from 2017 to 2023",
    x = "Year",
    y = "Total Checkouts",
    fill = "Medium Type"
  )
