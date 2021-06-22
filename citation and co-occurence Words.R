library(bibliometrix)
D <- readFiles("E:/datasets/level 1 dataset texts/My File.txt")

bib dataframe:
M <- convert2df(D, dbsource="wos",format="plaintext")
results <- biblioAnalysis(M)
summary(results, k=10, pause=F, width=130)
plot(x=results, k=10, pause=F)

co-citation:

CR <- citations(M, field = "article", sep = ";")
cbind(CR$Cited[1:20])

visualize:
NetMatrix <- biblioNetwork(M, analysis = "co-citation", network = "references", sep = ";")
net=networkPlot(NetMatrix, n = 50, Title = "Co-Citation Network", type = "fruchterman", size.cex=TRUE, size=20, remove.multiple=FALSE, labelsize=0.7,edgesize = 10, edges.min=5)

co-occurence Word

NetMatrix <- biblioNetwork(M, analysis = "co-occurrences", network = "keywords", sep = ";")
net=networkPlot(NetMatrix, normalize="association", n = 50, Title = "Keyword Co-occurrences", type = "fruchterman", size.cex=TRUE, size=20, remove.multiple=F, edgesize = 10, labelsize=3,label.cex=TRUE,label.n=30,edges.min=2)
