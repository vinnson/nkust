source('~/project/main.r')
library('highcharter')

######## Zone Analysis
raw_tmp <- select(row_refine,車種意義,死,受傷)
raw_tmp <- raw_tmp %>% drop_na(車種意義)
raw_tmp$count <- 1
raw_tmp[is.na(raw_tmp)] <- 0
raw_tmp_summary <- (raw_tmp %>% group_by(車種意義) %>%
  summarise_all(sum)
)

raw_tmp_summary$死比率 <- raw_tmp_summary$死 / sum(raw_tmp_summary$死) * 100
raw_tmp_summary$受傷比率 <- raw_tmp_summary$受傷 / sum(raw_tmp_summary$受傷) * 100
raw_tmp_summary$意外比率 <- raw_tmp_summary$count / sum(raw_tmp_summary$count) * 100

# highchart() %>%
#   hc_chart(type ="column") %>%
#   hc_xAxis(categories = raw_tmp_summary$車種意義) %>%
#   hc_add_series(data = raw_tmp_summary$死比率, name = "死/總意外比率") %>%
#   hc_add_series(data = raw_tmp_summary$受傷比率, name = "受傷/總意外比率") %>%
#   hc_add_series(data = raw_tmp_summary$意外比率, name = "意外/總意外比率")

# rm(raw_tmp,raw_tmp_summary)
raw_tmp%>%
 count(車種意義)%>%
 arrange(n)%>%
 hchart(type = "treemap", hcaes(x = 車種意義, value = n, color = n))
