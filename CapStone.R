library(doParallel)
library(quanteda)
library(stringr)
library(tm)

CPU <- parallel::detectCores()
registerDoParallel(makeCluster(CPU))

load("topAllNGram.RData")

input <- as.character("last time will take felt")
input <- removePunctuation(input)
input <- removeNumbers(input)
input <- tolower(input)
input <- removeWords(input, stopwords("english"))
input <- stripWhitespace(input)

lastWords4 <- paste(tail(strsplit(input, split=" ")[[1]],3), collapse = " ")
lastWords3 <- paste(tail(strsplit(input, split=" ")[[1]],2), collapse = " ")
lastWords2 <- paste(tail(strsplit(input, split=" ")[[1]],1), collapse = " ")

# inputLength <- sapply(strsplit(input, " "), length)

lastWordsWithReplacement4 <- str_replace_all(lastWords4, " ", "_")
lastWordsWithReplacement3 <- str_replace_all(lastWords3, " ", "_")
lastWordsWithReplacement2 <- str_replace_all(lastWords2, " ", "_")

test4 <- topAllNGram[grep(lastWordsWithReplacement4, names(topAllNGram))]
test3 <- topAllNGram[grep(lastWordsWithReplacement3, names(topAllNGram))]
test2 <- topAllNGram[grep(lastWordsWithReplacement2, names(topAllNGram))]

test <- c(test4, test3, test2)
head(test, 7)

test <- topAllNGram
head(test, 100)
  
  