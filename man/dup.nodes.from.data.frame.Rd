\name{dup.nodes.from.data.frame}
\alias{dup.nodes.from.data.frame}
\title{Creates an igraph object from a data frame with self-loops}
\usage{
dup.nodes.from.data.frame(df,first.node="V1",second.node="V2")
}
\arguments{
\item{df}{A data frame that should include at least two columns with the names of the nodes}
\item{first.node}{The column that indicates the node that's linked}
\item{second.node}{The column that indicates the other node that's linked}
}
\description{
This is an implementation of the method published in the paper "Intra-family links in the analysis of marital networks", which proposed a duplication of nodes that includes self-loops to get a reflect better (and include all information about) the status of all nodes in the network.

This method duplicates nodes with self-loops, and links the duplicated nodes with the original with a weight that is equal to the number of self-loops.

This can be applied to matrimonial networks where there are marriages among members of the same family, or any other type of network with self-loops, and allows to applicate centrality (and other) measures, obtaining a meaningful and more accurate result
}
\examples{
V1 <- c("A", "A","B","C","D","E")
V2 <- c("A", "B","C","D","E","A")
df <- data.frame(V1, V2)

dup.graph <- dup.nodes.from.data.frame(df)
}
