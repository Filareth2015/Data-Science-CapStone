#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(doParallel)
library(quanteda)
library(stringr)
library(tm)

load("topAll2Gram.RData")
load("topAll3Gram.RData")
load("topAll4Gram.RData")

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  ntext <- eventReactive(input$goButton, {
    
    input <- as.character(input$n)
    input <- removePunctuation(input)
    input <- removeNumbers(input)
    input <- tolower(input)
    input <- removeWords(input, stopwords("english"))
    input <- stripWhitespace(input)
    
    lastWords4 <- paste(tail(strsplit(input, split=" ")[[1]],3), collapse = " ")
    lastWords3 <- paste(tail(strsplit(input, split=" ")[[1]],2), collapse = " ")
    lastWords2 <- paste(tail(strsplit(input, split=" ")[[1]],1), collapse = " ")
    
    lastWordsWithReplacement4 <- str_replace_all(lastWords4, " ", "_")
    lastWordsWithReplacement3 <- str_replace_all(lastWords3, " ", "_")
    lastWordsWithReplacement2 <- str_replace_all(lastWords2, " ", "_")
    
    test4 <- topAll4Gram[grep(paste0("^", lastWordsWithReplacement4), names(topAll4Gram))]
    test3 <- topAll3Gram[grep(paste0("^", lastWordsWithReplacement3), names(topAll3Gram))]
    test2 <- topAll2Gram[grep(paste0("^", lastWordsWithReplacement2), names(topAll2Gram))]
    
    test <- c(names(test2[1:3]), names(test3[1:2]), names(test4[1:2]))
    test <- str_replace_all(test, "_", " ")
    
    if ( is.na(test[1]) == TRUE ) {
      test[1] <- as.character('No data')
    }
    if ( is.na(test[2]) == TRUE ) {
      test[2] <- as.character('No data')
    }
    if ( is.na(test[3]) == TRUE ) {
      test[3] <- as.character('No data')
    }
    if ( is.na(test[4]) == TRUE ) {
      test[4] <- as.character('No data')
    }
    if ( is.na(test[5]) == TRUE ) {
      test[5] <- as.character('No data')
    }
    if ( is.na(test[6]) == TRUE ) {
      test[6] <- as.character('No data')
    }
    if ( is.na(test[7]) == TRUE ) {
      test[7] <- as.character('No data')
    }

    output$text2 <- renderText({ 
      test[2]
    })
    
    output$text3 <- renderText({ 
      test[3]
    })
    
    output$text4 <- renderText({ 
      test[4]
    })
    
    output$text5 <- renderText({ 
      test[5]
    })
    
    output$text6 <- renderText({ 
      test[6]
    })
    
    output$text7 <- renderText({ 
      test[7]
    })
    
    test[1]

  })

   output$nText <- renderText({
    ntext()
   })

})
