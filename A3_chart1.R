library("ggplot2")
library("dplyr")

spl_data <- read.csv("/Users/anyuchen/desktop/2017-2023-10-Checkouts-SPL-Data 2.csv", stringsAsFactors = FALSE)

sum_each_type <- spl_data %>%
  group_by(MaterialType) %>% summarise(total_num = sum(Checkouts, na.rm = TRUE))

type_checkouts <- sum_each_type %>%  filter(MaterialType %in% c("BOOK", "EBOOK", "MAGAZINE", "AUDIOBOOK", "SOUNDDISC", "VIDEODISC"))

bar_plot <- ggplot(data = type_checkouts) +
  geom_col(mapping = aes(
    x = MaterialType,
    y = total_num,
    fill = MaterialType
  )) +
  labs(title = "Total checkouts from 2017 to 2023",
       x = "Medium Type",
       y = "Total Checkouts",
       fill = "Medium Type")
