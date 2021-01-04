library(httr)
if (!exists('raw') || !is.data.frame(get('raw'))) {
  raw202010 <- GET("https://datacenter.taichung.gov.tw/swagger/OpenData/e1349cd4-62cb-407f-968f-cc6dd0e0da50")
  raw202010 = content(raw202010)
  raw202009 <- GET("https://datacenter.taichung.gov.tw/swagger/OpenData/7934314c-70cf-442e-8af5-be17ef252563")
  raw202009 = content(raw202009)
  raw202008 <- GET("https://datacenter.taichung.gov.tw/swagger/OpenData/7d75ec02-c15e-4e5b-93c4-126fbad4161d")
  raw202008 = content(raw202008)
  raw202007 <- GET("https://datacenter.taichung.gov.tw/swagger/OpenData/43e8835f-679e-446f-98a5-00e99dc0af45")
  raw202007 = content(raw202007)
  raw202006 <- GET("https://datacenter.taichung.gov.tw/swagger/OpenData/feeb65d3-15fa-49fb-b393-1f467e7f8fcc")
  raw202006 = content(raw202006)
  raw202005 <- GET("https://datacenter.taichung.gov.tw/swagger/OpenData/4c532cd5-e812-4cfb-8f30-92292ebc5a57")
  raw202005 = content(raw202005)
  raw202004 <- GET("https://datacenter.taichung.gov.tw/swagger/OpenData/dc1d49b4-e044-46ae-a817-417b5b4aef12")
  raw202004 = content(raw202004)
  raw202004 <- raw202004 %>% rename(
    當事者區分 = 當事者區分_類別,
    GPS緯度 = GPS座標_緯度,
    GPS經度 = GPS座標_經度
  )
  raw202003 <- GET("https://datacenter.taichung.gov.tw/swagger/OpenData/4fe2b264-1f40-401b-b717-7eeb7b38f026")
  raw202003 = content(raw202003)
  raw202003 <- raw202003 %>% rename(
    當事者區分 = 當事者區分_類別,
    GPS緯度 = GPS座標_緯度,
    GPS經度 = GPS座標_經度
  )
  raw202002 <- GET("https://datacenter.taichung.gov.tw/swagger/OpenData/fd29fb51-cc64-482e-92db-f2cddfff9d51")
  raw202002 = content(raw202002)
  raw202002 <- raw202002 %>% rename(
    當事者區分 = 當事者區分_類別,
    GPS緯度 = GPS座標_緯度,
    GPS經度 = GPS座標_經度
  )
  raw202001 <- GET("https://datacenter.taichung.gov.tw/swagger/OpenData/a80b4160-8b4c-491c-8e34-ac97b4f9634a")
  raw202001 = content(raw202001)
  raw202001 <- raw202001 %>% rename(
    當事者區分 = 當事者區分_類別,
    GPS緯度 = GPS座標_緯度,
    GPS經度 = GPS座標_經度
  )
  raw201912 <- GET("https://datacenter.taichung.gov.tw/swagger/OpenData/89bde10e-b9ea-4520-9cdb-ffccc4cc7b87")
  raw201912 = content(raw201912)
  raw201912 <- raw201912 %>% rename(
    當事者區分 = 當事者區分_類別,
    GPS緯度 = GPS座標_緯度,
    GPS經度 = GPS座標_經度
  )
  raw201911 <- GET("https://datacenter.taichung.gov.tw/swagger/OpenData/de52f9e3-e759-46de-9772-e599ec30b6ff")
  raw201911 = content(raw201911)
  raw201911 <- raw201911 %>% rename(
    當事者區分 = 當事者區分_類別,
    GPS緯度 = GPS座標_緯度,
    GPS經度 = GPS座標_經度
  )
  raw <- rbind(raw201911, raw201912, raw202001, raw202002, raw202003, raw202004, raw202005, raw202006,
    raw202007, raw202008, raw202009, raw202010)
  rm(raw201911, raw201912, raw202001, raw202002, raw202003, raw202004, raw202005, raw202006,
    raw202007, raw202008, raw202009, raw202010)
}
