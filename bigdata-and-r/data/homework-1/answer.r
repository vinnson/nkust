## Calling Libraries
library('dplyr')
library('tidyr')
library('highcharter')
library('rio')


setwd("/home/rstudio/homework-1") # Change Working Directory
raw <-rio::import("臺北捷運每日分時各站OD流量統計資料_202008_UTF8.csv") # Import Raw Data - Variable = raw
raw <- raw %>% rename(
  日期 = V1,
  時段 = V2,
  進站 = V3,
  出站 = V4,
  人次 = V5
)

raw = subset(raw, select = -c(日期))

# 南京復興 進站 - 所有出站
南京復興_進站 <-arrange(filter(raw,進站=='南京復興'))
南京復興_進站 = subset(南京復興_進站, select = -c(進站, 出站))
南京復興_進站 <- (南京復興_進站 %>% group_by(時段) %>%
  complete(時段 = 0:max(時段), fill = list(人次 = 0)) %>%
  summarise_all(sum)
)

# 淡水 進站 - 所有出站
淡水_進站 <-arrange(filter(raw,進站=='淡水'))
淡水_進站 = subset(淡水_進站, select = -c(進站, 出站))
淡水_進站 <- (淡水_進站 %>% group_by(時段) %>%
  complete(時段 = 0:max(時段), fill = list(人次 = 0)) %>%
  summarise_all(sum)
)

# 新店 進站 - 所有出站
新店_進站 <-arrange(filter(raw,進站=='新店'))
新店_進站 = subset(新店_進站, select = -c(進站, 出站))
新店_進站 <- (新店_進站 %>% group_by(時段) %>%
  complete(時段 = 0:max(時段), fill = list(人次 = 0)) %>%
  summarise_all(sum)
)

highchart() %>% hc_xAxis(categories = 南京復興_進站$時段, title = list(text = "小時(整點)")) %>%
  hc_yAxis(title = list(text = "人次")) %>%
  hc_add_series(name = "南京復興進站", data = 南京復興_進站$人次)%>%
  hc_add_series(name = "淡水進站", data = 淡水_進站$人次)%>%
  hc_add_series(name = "新店進站", data = 新店_進站$人次)
