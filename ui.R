#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that calculates necessary sample size 
shinyUI(navbarPage("Navbar!", 
                   tabPanel("Text generator",
                            
                           
                            # Sidebar with input controls 
                            
                            textInput(inputId = "n", 
                                      width = '66%',
                                      label = h4("Input word or phrase"),
                                      placeholder = "Enter some text",
                                      value = ""
                            ),
                            br(),
                            actionButton("goButton", "Predict next word/s"),
                            br(),
                           
                            # Show output 
                            mainPanel(
                              br(),
                              h5('Possible continuation:'), 
                              verbatimTextOutput("nText"),
                              verbatimTextOutput("text2"),
                              verbatimTextOutput("text3"),
                              verbatimTextOutput("text4"),
                              verbatimTextOutput("text5"),
                              verbatimTextOutput("text6"),
                              verbatimTextOutput("text7")
                              
                            )
                            
                            
                   ),
                   
                   tabPanel("Instructions",
                            h3('About text generation:'),
                            h4('Step 1'),
                            h5('Enter one word or part of phrase and click "Predict next word/s"'),
                            h5('After few seconds will generated continuation for your input.'),
                            h4('Step 2'),
                            h5('Copy the appropriate continuation and add it to your input. Then repeat Step 1.')
                            )
)
)
