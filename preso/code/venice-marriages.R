library(dupNodes)
library(igraph)
load(url("https://raw.githubusercontent.com/JJ/Intra-family-networks/main/venice-marriages.Rda")) # loads marriages.raw
venice.marriages <- marriages.raw[ marriages.raw$wife_familyname_std != '',] # Eliminates those that are not noble
venice.marriages.sn <- graph_from_data_frame(data.frame(venice.marriages$wife_familyname_std, venice.marriages$husband_familyname_std), directed=FALSE)
V(venice.marriages.sn)$DNSLbetweenness <- betweenness.with.duplicated.nodes(dup.nodes.from.graph(venice.marriages.sn))

top.marriages <- V(venice.marriages.sn)[V(venice.marriages.sn)$DNSLbetweenness > 500]
top.marriages.sn <- simplify(induced_subgraph(venice.marriages.sn, top.marriages))

plot(top.marriages.sn,vertex.label.cex=0.7,vertex.size=V(top.marriages.sn)$DNSLbetweenness/250,vertex.color=rgb(0.7,0,0,0.5))
