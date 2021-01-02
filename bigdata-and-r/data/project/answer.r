## Calling Libraries
library('arules')
library('arulesViz')
library('dplyr')
library('tidyr')
library('highcharter')
library('rio')

setwd("/home/rstudio/project") # Change Working Directory
raw <-rio::import("~/project/data/10910.csv") # Import Raw Data - Variable = raw

row_refine <- select(raw, 年,月,日,區,死,受傷,天候,道路類別,速限,
               道路型態,事故位置,事故類型及型態,主要肇因,當事者區分,
               車輛用途,當事者行動狀態,飲酒情形,肇事因素個別,肇事因素主要,肇事逃逸,
               職業,旅次目的,車種,GPS緯度,GPS經度,事故類別)

## Setup Meta Data - Weather
WEATHER <-rio::import("~/project/metadata/WEATHER.csv")
WEATHER_LOOKUP <- WEATHER$意義
names(WEATHER_LOOKUP) <- WEATHER$代碼
## Map Meta Data
row_refine$天候意義 <- WEATHER_LOOKUP[row_refine$天候]

## Setup Meta Data - Path Category
PATH_CATEGORY <-rio::import("~/project/metadata/PATH_CATEGORY.csv")
PATH_CATEGORY_LOOKUP <- PATH_CATEGORY$意義
names(PATH_CATEGORY_LOOKUP) <- PATH_CATEGORY$代碼
## Map Meta Data
row_refine$道路類別意義 <- PATH_CATEGORY_LOOKUP[row_refine$道路類別]

## Setup Meta Data - Path Kind
PATH_KIND <-rio::import("~/project/metadata/PATH_KIND.csv")
PATH_KIND_LOOKUP <- PATH_KIND$意義
names(PATH_KIND_LOOKUP) <- PATH_KIND$代碼
## Map Meta Data
row_refine$道路型態意義 <- PATH_KIND_LOOKUP[row_refine$道路型態]

## Setup Meta Data - Accident Position
ACCIDENT_POSITION <-rio::import("~/project/metadata/ACCIDENT_POSITION.csv")
ACCIDENT_POSITION_LOOKUP <- ACCIDENT_POSITION$意義
names(ACCIDENT_POSITION_LOOKUP) <- ACCIDENT_POSITION$代碼
## Map Meta Data
row_refine$事故位置意義 <- ACCIDENT_POSITION_LOOKUP[row_refine$事故位置]

## Setup Meta Data - Accident Case
ACCIDENT_CAUSE <-rio::import("~/project/metadata/ACCIDENT_CAUSE.csv")
ACCIDENT_CAUSE_LOOKUP <- ACCIDENT_CAUSE$意義
names(ACCIDENT_CAUSE_LOOKUP) <- ACCIDENT_CAUSE$代碼
## Map Meta Data
row_refine$事故類別意義 <- ACCIDENT_CAUSE_LOOKUP[row_refine$事故類別]
row_refine$主要肇因意義 <- ACCIDENT_CAUSE_LOOKUP[row_refine$主要肇因]

## Setup Meta Data - Drive
DRIVE <-rio::import("~/project/metadata/DRIVE.csv")
DRIVE_LOOKUP <- DRIVE$意義
names(DRIVE_LOOKUP) <- DRIVE$代碼
## Map Meta Data
row_refine$車種意義 <- DRIVE_LOOKUP[row_refine$車種]
row_refine$當事者區分意義 <- DRIVE_LOOKUP[row_refine$當事者區分]

## Setup Meta Data - Car Use
CAR_USE <-rio::import("~/project/metadata/CAR_USE.csv")
CAR_USE_LOOKUP <- CAR_USE$意義
names(CAR_USE_LOOKUP) <- CAR_USE$代碼
## Map Meta Data
row_refine$車輛用途意義 <- DRIVE_LOOKUP[row_refine$車輛用途]

## Setup Meta Data - Escape
ESCAPE <-rio::import("~/project/metadata/ESCAPE.csv")
ESCAPE_LOOKUP <- ESCAPE$意義
names(ESCAPE_LOOKUP) <- ESCAPE$代碼
## Map Meta Data
row_refine$肇事逃逸意義 <- ESCAPE_LOOKUP[row_refine$肇事逃逸]

## Setup Meta Data - Escape
DRUNK <-rio::import("~/project/metadata/DRUNK.csv")
DRUNK_LOOKUP <- DRUNK$意義
names(DRUNK_LOOKUP) <- DRUNK$代碼
## Map Meta Data
row_refine$飲酒情形意義 <- DRUNK_LOOKUP[row_refine$飲酒情形]

## Setup Meta Data - TRAVEL_PURPUSE
TRAVEL_PURPUSE <-rio::import("~/project/metadata/TRAVEL_PURPUSE.csv")
TRAVEL_PURPUSE_LOOKUP <- TRAVEL_PURPUSE$意義
names(TRAVEL_PURPUSE_LOOKUP) <- TRAVEL_PURPUSE$代碼
## Map Meta Data
row_refine$旅次目的意義 <- TRAVEL_PURPUSE_LOOKUP[row_refine$旅次目的]

## Setup Meta Data - ACCIDENT_TYPE
ACCIDENT_TYPE <-rio::import("~/project/metadata/ACCIDENT_TYPE.csv")
ACCIDENT_TYPE_LOOKUP <- ACCIDENT_TYPE$意義
names(ACCIDENT_TYPE_LOOKUP) <- ACCIDENT_TYPE$代碼
## Map Meta Data
row_refine$事故類型及型態意義 <- ACCIDENT_TYPE_LOOKUP[row_refine$事故類型及型態]

## Setup Meta Data - PATH_KIND
PATH_KIND <-rio::import("~/project/metadata/PATH_KIND.csv")
PATH_KIND_LOOKUP <- PATH_KIND$意義
names(PATH_KIND_LOOKUP) <- PATH_KIND$代碼
## Map Meta Data
row_refine$道路型態意義 <- PATH_KIND_LOOKUP[row_refine$道路型態]

## Setup Meta Data - ACTION
ACTION <-rio::import("~/project/metadata/ACTION.csv")
ACTION_LOOKUP <- ACTION$意義
names(ACTION_LOOKUP) <- ACTION$代碼
## Map Meta Data
row_refine$當事者行動狀態意義 <- PATH_KIND_LOOKUP[row_refine$當事者行動狀態]

## Setup Meta Data - JOB
JOB <-rio::import("~/project/metadata/JOB.csv")
JOB_LOOKUP <- JOB$意義
names(JOB_LOOKUP) <- JOB$代碼
## Map Meta Data
row_refine$職業意義 <- JOB_LOOKUP[row_refine$職業]

# row_assoc <- select(row_refine, 天候,天候意義,道路類別,道路類別意義,速限,
#                     道路型態,事故位置,事故位置意義,事故類型及型態,主要肇因,當事者區分,當事者區分意義,
#                     車輛用途,當事者行動狀態,飲酒情形,肇事因素個別,肇事因素主要,肇事逃逸,
#                     職業,旅次目的,車種,車種意義,事故類別,事故類別意義)

# row_assoc <- select(row_refine, 天候,道路類別,速限,
#                     道路型態,事故位置,事故類型及型態,主要肇因,當事者區分,
#                     車輛用途,當事者行動狀態,飲酒情形,肇事因素個別,肇事因素主要,肇事逃逸,
#                     職業,旅次目的,車種, 事故類別)

# row_assoc <- select(row_refine, 天候意義,道路類別意義,道路型態意義,
#                     事故位置意義,事故類型及型態意義,主要肇因意義,當事者區分意義,
#                     車輛用途意義,當事者行動狀態意義,飲酒情形意義,肇事逃逸意義,
#                     職業意義,旅次目的意義,事故類別意義)

#rules=apriori(row_assoc, parameter = list(supp=0.2,conf=0.5,minlen=4))
#rules=sort(rules,by="lift")
#inspect(rules)
