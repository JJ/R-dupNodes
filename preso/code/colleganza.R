library(devtools)
install_github("JJ/serrata-families")
library(serrata.families)
data("colleganza.graph")
library(dupNodes)
colleganza.dup <- dup.nodes.from.graph(colleganza.graph)
V(colleganza.graph)$DNSLbetweenness <- betweenness.with.duplicated.nodes(colleganza.dup)

groups <- components(colleganza.graph, mode="weak")
biggest_cluster_id <- which.max(groups$csize)
vert_ids <- V(colleganza.graph)[groups$membership == biggest_cluster_id]

connected.colleganza.graph <- induced_subgraph(colleganza.graph, vert_ids)
plot(connected.colleganza.graph,vertex.label.cex=0.7,vertex.size=V(connected.colleganza.graph)$DNSLbetweenness/300,vertex.color=rgb(0.7,0,0,0.5))

colleganza.dup <- dup.nodes.from.graph(colleganza.graph)
V(colleganza.graph)$DNSLbetweenness <- betweenness.with.duplicated.nodes(colleganza.dup)

groups <- components(colleganza.graph, mode="weak")
biggest_cluster_id <- which.max(groups$csize)
vert_ids <- V(colleganza.graph)[groups$membership == biggest_cluster_id]

connected.colleganza.graph <- induced_subgraph(colleganza.graph, vert_ids)
plot(connected.colleganza.graph,vertex.label.cex=0.7,vertex.size=V(connected.colleganza.graph)$DNSLbetweenness/300,vertex.color=rgb(0.7,0,0,0.5))
