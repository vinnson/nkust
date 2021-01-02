source('~/project/main.r')
library('highcharter')

raw_tmp <-arrange(filter(row_refine,車種=='C03'))

raw_tmp <- select(raw_tmp,當事者行動狀態意義,死,受傷)
raw_tmp <- raw_tmp %>% drop_na(當事者行動狀態意義)
raw_tmp$count <- 1
raw_tmp[is.na(raw_tmp)] <- 0
raw_tmp_summary <- (raw_tmp %>% group_by(當事者行動狀態意義) %>%
  summarise_all(sum)
)

raw_tmp_summary$死比率 <- raw_tmp_summary$死 / sum(raw_tmp_summary$count) * 100
raw_tmp_summary$受傷比率 <- raw_tmp_summary$受傷 / sum(raw_tmp_summary$count) * 100
raw_tmp_summary$意外比率 <- raw_tmp_summary$count / sum(raw_tmp_summary$count) * 100

# highchart() %>%
#   hc_chart(type ="column", options3d = list(enabled = TRUE, beta = 15, alpha = 15)) %>%
#   hc_xAxis(categories = raw_tmp_summary$當事者行動狀態意義) %>%
#   hc_add_series(data = raw_tmp_summary$死比率, name = "死/總意外比率") %>%
#   hc_add_series(data = raw_tmp_summary$受傷比率, name = "受傷/總意外比率") %>%
#   hc_add_series(data = raw_tmp_summary$意外比率, name = "意外/總意外比率")

raw_tmp_summary %>% hchart(
  "pie", hcaes(x = 當事者行動狀態意義, y = count),
  name = "Fruit consumption"
)

raw_tmp <-arrange(filter(row_refine,當事者行動狀態=='9'))

raw_tmp <- select(raw_tmp,事故類型及型態意義,死,受傷)
raw_tmp <- raw_tmp %>% drop_na(事故類型及型態意義)
raw_tmp$count <- 1
raw_tmp[is.na(raw_tmp)] <- 0
raw_tmp_summary <- (raw_tmp %>% group_by(事故類型及型態意義) %>%
  summarise_all(sum)
)

raw_tmp_summary %>% hchart(
  "pie", hcaes(x = 事故類型及型態意義, y = count),
  name = "Fruit consumption"
)
