library(dogesr)
library(ggplot2)
data("doges.years")
doges.years$pre.serrata <- TRUE
doges.years[doges.years$Start >= 1297,]$pre.serrata <- FALSE
means <- aggregate(Years ~  pre.serrata, doges.years, mean)
medians <- aggregate(Years ~  pre.serrata, doges.years, median)
ggplot(doges.years, aes(x=pre.serrata, y=Years))+geom_boxplot(notch=T)+
  stat_summary(fun=mean, geom="point", shape=20, size=3, color="red", fill="red") +
  geom_text(data = means, aes(label = round(Years, 2), y = Years + 2), size = 3) +
  geom_text(data = medians, aes(label = round(Years, 2), y = Years - 1), size = 3)+theme_minimal()
