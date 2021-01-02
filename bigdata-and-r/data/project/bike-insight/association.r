source('~/project/main.r')
library('highcharter')
library('arules')
library('arulesViz')

row_assoc <-arrange(filter(row_refine,車種=='C03'))
row_assoc <-arrange(filter(row_assoc,當事者行動狀態==9))
row_assoc <- select(row_assoc, 道路類別意義, 道路型態意義,事故位置意義,事故類型及型態意義,
                  道路型態意義)

rules=apriori(row_assoc, parameter = list(supp=0.2,conf=0.2,minlen=2))
rules=sort(rules,by="lift")
inspect(rules[1:10])
plot(rules,method = "graph", control=list(type="itemsets"), main=NULL)


## 事故類型及型態意義=車與車-路口交岔撞
row_assoc <-arrange(filter(row_refine,車種=='C03'))
row_assoc <-arrange(filter(row_assoc,當事者行動狀態==9))
row_assoc <-arrange(filter(row_assoc, 事故類型及型態==13)) #事故類型及型態意義=車與車-路口交岔撞 - 15

row_assoc <- select(row_assoc,道路類別意義,
                    事故位置意義,主要肇因意義,
                    旅次目的意義,事故類別意義)

# rules=apriori(row_assoc, parameter = list(supp=0.2,conf=0.2,minlen=2))
# rules <- apriori (data=row_assoc, parameter=list (supp=0.2,conf=0.2,minlen=1),
                 # appearance = list (default="lhs",rhs="事故類別意義=爭(搶)道行駛"), control = list (verbose=F))

rules=sort(rules,by="lift")
inspect(rules[1:10])
plot(rules,method = "graph", control=list(type="itemsets"), main=NULL)
