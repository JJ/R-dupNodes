install.packages("dogesr")
library(dogesr)
library(igraph)
data("doges.marriages")
E(doges.marriages.sn)$width <- 1
E(doges.marriages.sn)[which_loop(doges.marriages.sn)]$width <- 2
E(doges.marriages.sn)$color <- "gray"
E(doges.marriages.sn)[which_loop(doges.marriages.sn)]$color <- "green"
plot(doges.marriages.sn,vertex.label.cex=0.7,vertex.size=8,vertex.color=rgb(0.7,0,0,0.5),edge.color=E(doges.marriages.sn)$color,edge.width=E(doges.marriages.sn)$width)

library(dupNodes)
doges.marriages.sn.dup <- dup.nodes.from.graph(doges.marriages.sn)
V(doges.marriages.sn)$DNSLbetweenness <- betweenness.with.duplicated.nodes(doges.marriages.sn.dup)

plot(doges.marriages.sn,vertex.label.cex=0.7,vertex.size=V(doges.marriages.sn)$DNSLbetweenness/100,vertex.color=rgb(0.7,0,0,0.5),edge.color=E(doges.marriages.sn)$color,edge.width=E(doges.marriages.sn)$width)
