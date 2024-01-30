
library(igraph)

V1 <- c("A", "A","B","C","D","E")
V2 <- c("A", "B","C","D","E","A")

different.nodes <- unique(c(V1, V2))

df <- data.frame(V1, V2)
test <- graph_from_data_frame(df)

test_that("Graph with default values", {
  dup.graph <- dup.nodes.from.data.frame(df)
  expect_equal( length(V(dup.graph)), length(different.nodes)+1 )
})
