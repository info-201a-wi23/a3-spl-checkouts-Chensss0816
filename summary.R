library("ggplot2")
library("dplyr")

spl_data <- read.csv("/Users/anyuchen/desktop/2017-2023-10-Checkouts-SPL-Data 2.csv", stringsAsFactors = FALSE)

most_checkout_each_year <- spl_data %>% group_by(CheckoutYear) %>% filter(Checkouts == max(Checkouts)) %>% pull(Checkouts)

distinct_checkout_each_year <- spl_data %>% group_by(CheckoutYear) %>% summarise(distinct_checkout = n_distinct(Title)) %>% pull(distinct_checkout)

month_most_checkouts <- spl_data %>% group_by(CheckoutYear, CheckoutMonth) %>% summarize(checkout_month = sum(Checkouts)) %>% filter(checkout_month == max(checkout_month)) %>% pull(CheckoutMonth)

item_types <- spl_data %>% summarise(item_types = n_distinct(MaterialType)) %>%  pull(item_types)

most_popular_book <- spl_data %>% group_by(CheckoutYear) %>% filter(MaterialType == "EBOOK") %>% filter(Checkouts == max(Checkouts)) %>% pull(Title)


 

