

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

# 南京復興 出站 - 所有入站
南京復興_出站 <-arrange(filter(raw_20200803_clean,出站=='南京復興'),desc(人次))
南京復興_出站_CLEAN = subset(南京復興_出站, select = -c(進站, 出站))
南京復興_出站_SUMMARY <- (南京復興_出站_CLEAN %>% group_by(時段) %>%
                              complete(時段 = 0:max(時段), fill = list(人次 = 0)) %>%
                              summarise_all(sum)
)
# 淡水 出站 - 所有入站
淡水_出站 <-arrange(filter(raw_20200803_clean,出站=='淡水'),desc(人次))
淡水_出站_CLEAN = subset(淡水_出站, select = -c(進站, 出站))
淡水_出站_SUMMARY <- (淡水_出站_CLEAN %>% group_by(時段) %>%
                          complete(時段 = 0:max(時段), fill = list(人次 = 0)) %>%
                          summarise_all(sum)
)
# 新店 出站 - 所有入站
新店_出站 <-arrange(filter(raw_20200803_clean,出站=='新店'),desc(人次))
新店_出站_CLEAN = subset(新店_出站, select = -c(進站, 出站))
新店_出站_SUMMARY <- (新店_出站_CLEAN %>% group_by(時段) %>%
                          complete(時段 = 0:max(時段), fill = list(人次 = 0)) %>%
                          summarise_all(sum)
)
highchart() %>% hc_xAxis(categories = 南京復興_出站_SUMMARY$時段)%>%
  hc_add_series(name = "南京復興出站", data = 南京復興_出站_SUMMARY$人次)%>%
  hc_add_series(name = "淡水出站", data = 淡水_出站_SUMMARY$人次)%>%
  hc_add_series(name = "新店出站", data = 新店_出站_SUMMARY$人次)