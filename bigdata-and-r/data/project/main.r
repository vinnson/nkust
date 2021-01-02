## Calling Libraries
# library('arules')
# library('arulesViz')
library('dplyr')
library('tidyr')
# library('highcharter')
library('rio')

setwd("/home/rstudio/project") # Change Working Directory
raw10811 <-rio::import("~/project/data/10811.csv") # Import Raw Data - Variable = raw
raw10812 <-rio::import("~/project/data/10812.csv") # Import Raw Data - Variable = raw
raw10901 <-rio::import("~/project/data/10901.csv") # Import Raw Data - Variable = raw
raw10902 <-rio::import("~/project/data/10902.csv") # Import Raw Data - Variable = raw
raw10903 <-rio::import("~/project/data/10903.csv") # Import Raw Data - Variable = raw
raw10904 <-rio::import("~/project/data/10904.csv") # Import Raw Data - Variable = raw
raw10905 <-rio::import("~/project/data/10905.csv") # Import Raw Data - Variable = raw
raw10906 <-rio::import("~/project/data/10906.csv") # Import Raw Data - Variable = raw
raw10907 <-rio::import("~/project/data/10907.csv") # Import Raw Data - Variable = raw
raw10908 <-rio::import("~/project/data/10908.csv") # Import Raw Data - Variable = raw
raw10909 <-rio::import("~/project/data/10909.csv") # Import Raw Data - Variable = raw
raw10910 <-rio::import("~/project/data/10910.csv") # Import Raw Data - Variable = raw

raw <- rbind(raw10811, raw10812, raw10901, raw10902, raw10903, raw10904, raw10905, raw10906, raw10907, raw10908, raw10909, raw10910)
rm(raw10811, raw10812, raw10901, raw10902, raw10903, raw10904, raw10905, raw10906, raw10907, raw10908, raw10909, raw10910)

row_refine <- select(raw, 年,月,日,時,分,區,死,受傷,天候,道路類別,速限,
               道路型態,事故位置,事故類型及型態,主要肇因,當事者區分,保護裝備,
               車輛用途,當事者行動狀態,飲酒情形,肇事因素個別,肇事因素主要,肇事逃逸,
               職業,旅次目的,車種,GPS緯度,GPS經度,事故類別)

## Setup Meta Data - Weather
WEATHER <-rio::import("~/project/metadata/WEATHER.csv")
WEATHER_LOOKUP <- WEATHER$意義
names(WEATHER_LOOKUP) <- WEATHER$代碼
## Map Meta Data
row_refine$天候意義 <- WEATHER_LOOKUP[row_refine$天候]
rm(WEATHER, WEATHER_LOOKUP)

## Setup Meta Data - Path Category
PATH_CATEGORY <-rio::import("~/project/metadata/PATH_CATEGORY.csv")
PATH_CATEGORY_LOOKUP <- PATH_CATEGORY$意義
names(PATH_CATEGORY_LOOKUP) <- PATH_CATEGORY$代碼
## Map Meta Data
row_refine$道路類別意義 <- PATH_CATEGORY_LOOKUP[row_refine$道路類別]
rm(PATH_CATEGORY, PATH_CATEGORY_LOOKUP)

## Setup Meta Data - Path Kind
PATH_KIND <-rio::import("~/project/metadata/PATH_KIND.csv")
PATH_KIND_LOOKUP <- PATH_KIND$意義
names(PATH_KIND_LOOKUP) <- PATH_KIND$代碼
## Map Meta Data
row_refine$道路型態意義 <- PATH_KIND_LOOKUP[row_refine$道路型態]
rm(PATH_KIND, PATH_KIND_LOOKUP)

## Setup Meta Data - Accident Position
ACCIDENT_POSITION <-rio::import("~/project/metadata/ACCIDENT_POSITION.csv")
ACCIDENT_POSITION_LOOKUP <- ACCIDENT_POSITION$意義
names(ACCIDENT_POSITION_LOOKUP) <- ACCIDENT_POSITION$代碼
## Map Meta Data
row_refine$事故位置意義 <- ACCIDENT_POSITION_LOOKUP[row_refine$事故位置]
rm(ACCIDENT_POSITION, ACCIDENT_POSITION_LOOKUP)

## Setup Meta Data - Accident Case
ACCIDENT_CAUSE <-rio::import("~/project/metadata/ACCIDENT_CAUSE.csv")
ACCIDENT_CAUSE_LOOKUP <- ACCIDENT_CAUSE$意義
names(ACCIDENT_CAUSE_LOOKUP) <- ACCIDENT_CAUSE$代碼
## Map Meta Data
row_refine$事故類別意義 <- ACCIDENT_CAUSE_LOOKUP[row_refine$事故類別]
row_refine$主要肇因意義 <- ACCIDENT_CAUSE_LOOKUP[row_refine$主要肇因]
rm(ACCIDENT_CAUSE, ACCIDENT_CAUSE_LOOKUP)

## Setup Meta Data - Drive
DRIVE <-rio::import("~/project/metadata/DRIVE.csv")
DRIVE_LOOKUP <- DRIVE$意義
names(DRIVE_LOOKUP) <- DRIVE$代碼
## Map Meta Data
row_refine$車種意義 <- DRIVE_LOOKUP[row_refine$車種]
row_refine$當事者區分意義 <- DRIVE_LOOKUP[row_refine$當事者區分]
rm(DRIVE, DRIVE_LOOKUP)

## Setup Meta Data - Car Use
CAR_USE <-rio::import("~/project/metadata/CAR_USE.csv")
CAR_USE_LOOKUP <- CAR_USE$意義
names(CAR_USE_LOOKUP) <- CAR_USE$代碼
## Map Meta Data
row_refine$車輛用途意義 <- CAR_USE_LOOKUP[row_refine$車輛用途]
rm(CAR_USE, CAR_USE_LOOKUP)

## Setup Meta Data - Escape
ESCAPE <-rio::import("~/project/metadata/ESCAPE.csv")
ESCAPE_LOOKUP <- ESCAPE$意義
names(ESCAPE_LOOKUP) <- ESCAPE$代碼
## Map Meta Data
row_refine$肇事逃逸意義 <- ESCAPE_LOOKUP[row_refine$肇事逃逸]
rm(ESCAPE, ESCAPE_LOOKUP)

## Setup Meta Data - Escape
DRUNK <-rio::import("~/project/metadata/DRUNK.csv")
DRUNK_LOOKUP <- DRUNK$意義
names(DRUNK_LOOKUP) <- DRUNK$代碼
## Map Meta Data
row_refine$飲酒情形意義 <- DRUNK_LOOKUP[row_refine$飲酒情形]
rm(DRUNK, DRUNK_LOOKUP)

## Setup Meta Data - TRAVEL_PURPUSE
TRAVEL_PURPUSE <-rio::import("~/project/metadata/TRAVEL_PURPUSE.csv")
TRAVEL_PURPUSE_LOOKUP <- TRAVEL_PURPUSE$意義
names(TRAVEL_PURPUSE_LOOKUP) <- TRAVEL_PURPUSE$代碼
## Map Meta Data
row_refine$旅次目的意義 <- TRAVEL_PURPUSE_LOOKUP[row_refine$旅次目的]
rm(TRAVEL_PURPUSE, TRAVEL_PURPUSE_LOOKUP)

## Setup Meta Data - ACCIDENT_TYPE
ACCIDENT_TYPE <-rio::import("~/project/metadata/ACCIDENT_TYPE.csv")
ACCIDENT_TYPE_LOOKUP <- ACCIDENT_TYPE$意義
names(ACCIDENT_TYPE_LOOKUP) <- ACCIDENT_TYPE$代碼
## Map Meta Data
row_refine$事故類型及型態意義 <- ACCIDENT_TYPE_LOOKUP[row_refine$事故類型及型態]
rm(ACCIDENT_TYPE, ACCIDENT_TYPE_LOOKUP)

## Setup Meta Data - PATH_KIND
PATH_KIND <-rio::import("~/project/metadata/PATH_KIND.csv")
PATH_KIND_LOOKUP <- PATH_KIND$意義
names(PATH_KIND_LOOKUP) <- PATH_KIND$代碼
## Map Meta Data
row_refine$道路型態意義 <- PATH_KIND_LOOKUP[row_refine$道路型態]
rm(PATH_KIND, PATH_KIND_LOOKUP)

## Setup Meta Data - ACTION
ACTION <-rio::import("~/project/metadata/ACTION.csv")
# ACTION_LOOKUP <- ACTION$意義英文
ACTION_LOOKUP <- ACTION$意義
names(ACTION_LOOKUP) <- ACTION$代碼
## Map Meta Data
row_refine$當事者行動狀態意義 <- ACTION_LOOKUP[row_refine$當事者行動狀態]
rm(ACTION, ACTION_LOOKUP)

## Setup Meta Data - JOB
JOB <-rio::import("~/project/metadata/JOB.csv")
JOB_LOOKUP <- JOB$意義
names(JOB_LOOKUP) <- JOB$代碼
## Map Meta Data
row_refine$職業意義 <- JOB_LOOKUP[row_refine$職業]
rm(JOB, JOB_LOOKUP)

## Setup Meta Data - PROTECTION_EQUIP
PROTECTION_EQUIP <-rio::import("~/project/metadata/PROTECTION_EQUIP.csv")
PROTECTION_EQUIP_LOOKUP <- PROTECTION_EQUIP$意義
names(PROTECTION_EQUIP_LOOKUP) <- PROTECTION_EQUIP$代碼
## Map Meta Data
row_refine$保護裝備意義 <- PROTECTION_EQUIP_LOOKUP[row_refine$保護裝備]
rm(PROTECTION_EQUIP, PROTECTION_EQUIP_LOOKUP)
