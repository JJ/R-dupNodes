require("usethis")
require("igraph")

florentine <- read.csv("florentine-sn.csv", header=TRUE)
florentine.sn <- graph_from_data_frame(florentine, directed=FALSE)
use_data(florentine.sn, overwrite=TRUE)
