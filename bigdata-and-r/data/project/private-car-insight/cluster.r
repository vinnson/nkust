source('~/project/main.r')
library(tidyverse)  # data manipulation
library(cluster)    # clustering algorithms
library(factoextra) # clustering algorithms & visualization

raw_tmp <-arrange(filter(row_refine,車種=='B03'))

raw_tmp <- select(raw_tmp,當事者行動狀態意義,死,受傷)
raw_tmp <- raw_tmp %>% drop_na(當事者行動狀態意義)
raw_tmp$count <- 1
raw_tmp[is.na(raw_tmp)] <- 0
raw_tmp_summary <- (raw_tmp %>% group_by(當事者行動狀態意義) %>%
  summarise_all(sum)
)

raw_tmp_summary$死比率 <- raw_tmp_summary$死 / sum(raw_tmp_summary$死) * 100
raw_tmp_summary$受傷比率 <- raw_tmp_summary$受傷 / sum(raw_tmp_summary$受傷) * 100
raw_tmp_summary$意外比率 <- raw_tmp_summary$count / sum(raw_tmp_summary$count) * 100

raw_tmp_cluster <- select(raw_tmp_summary, 當事者行動狀態意義,受傷比率,意外比率)
raw_tmp_cluster[,1] <- NULL
row.names(raw_tmp_cluster) <- raw_tmp_summary$當事者行動狀態意義

#distance <- get_dist(raw_tmp_cluster)
#fviz_dist(distance, gradient = list(low = "#00AFBB", mid = "white", high = "#FC4E07"))

k2 <- kmeans(raw_tmp_cluster, centers = 3, nstart = 1)
fviz_cluster(k2, main=NULL, data = raw_tmp_cluster, font.family="WenQuanYi Micro Hei Mono")
