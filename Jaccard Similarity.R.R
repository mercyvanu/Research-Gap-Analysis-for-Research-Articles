Sys.setenv(NOAWT=TRUE)
require("tm")
my.corpus <- Corpus(DirSource("E:/text ds"))
getTransformations
my.corpus <- tm_map(my.corpus, removePunctuation)
my.list <- unlist(read.table("E:/stopwords.txt", stringsAsFactors=FALSE))
my.stops <- c(my.list)
my.corpus <- tm_map(my.corpus, removeWords, my.stops)
require("Snowball")
my.corpus <- tm_map(my.corpus, stemDocument)
my.tdm <- TermDocumentMatrix(my.corpus)
inspect(my.tdm)
my.dtm <- DocumentTermMatrix(my.corpus, control = list(weighting = weightTfIdf, stopwords = TRUE))
inspect(my.dtm)
findFreqTerms(my.tdm, 2)
findAssocs(my.tdm, 'mine', 0.20)
similarities <- sim2(my.df, method = "cosine", norm = "l0") 

get_similar_letters <- function(similarities, reference_letter, n_recommendations = 3){
  sort(similarities[reference_letter, ], decreasing = TRUE)[1:(2 + n_recommendations)]
}
