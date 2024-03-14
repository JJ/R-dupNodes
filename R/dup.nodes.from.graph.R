library(igraph)

#' Duplicates nodes that have any self-loop
#' @param graph.with.self.loops graph that includes some selfloops.
#' @return Graph where all nodes with self-loops have been duplicated and linked to the original one and all those linked to it.
#' @export
#'
#

dup.nodes.from.graph <- function( graph.with.self.loops ) {
  if ( !any_loop(graph.with.self.loops) ) {
    return( graph.with.self.loops )
  }
  modified.graph <- graph.with.self.loops
  self.edges <- as_edgelist(modified.graph)[ which_loop(modified.graph),]

  nodes.with.self.loops <- unique(self.edges[,1])
  for ( node in nodes.with.self.loops ) {
    modified.graph <- add_vertices(modified.graph,1,name=paste0(node,"'"))
  }

  for ( node in  self.edges[,1]) {
    new.node <- paste0(node,"'")
    modified.graph <- add_edges(modified.graph, c(node,new.node))
    modified.graph <- delete_edges(modified.graph, paste0(node,"|",node))
  }


}
