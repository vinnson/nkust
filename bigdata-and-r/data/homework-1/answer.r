## Installation
install.packages("dplyr")
install.packages("tidyr")
install.packages("highcharter")
install.packages("rio")

## Calling Libraries
library('dplyr')
library('tidyr')
library('highcharter')
library('rio')


setwd("/home/rstudio/homework-1") # Change Working Directory
raw <-rio::import("臺北捷運每日分時各站OD流量統計資料_202008_UTF8.csv") # Import Raw Data - Variable = raw
raw_20200803 <-arrange(filter(raw,日期=='2020-08-03'),desc("2020-08-03"))
raw_20200803_clean = subset(raw_20200803, select = -c(日期))

rm (raw, raw_20200803)

# 南京復興 入站 - 所有出站
南京復興_入站 <-arrange(filter(raw_20200803_clean,進站=='南京復興'),desc(人次))
南京復興_入站_CLEAN = subset(南京復興_入站, select = -c(進站, 出站))
南京復興_入站_SUMMARY <- (南京復興_入站_CLEAN %>% group_by(時段) %>%
  complete(時段 = 1:max(時段), fill = list(人次 = 0)) %>%
  summarise_all(sum)
)

highchart() %>% hc_xAxis(categories = 南京復興_入站_SUMMARY$時段)%>%
  hc_add_series(name = "南京復興進站", data = 南京復興_入站_SUMMARY$人次)
