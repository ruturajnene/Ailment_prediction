library(shiny)
library(shinythemes)
library(dplyr)
library(plotly)
source("kmeans.R")
shinyUI(fluidPage(theme =shinytheme("cyborg"),
                  
                  titlePanel("Posture Ailment Predictor 1.0.0"),
                  
                  sidebarLayout(
                    
                    sidebarPanel(
                      # Inputs excluded for brevity
                      
                      helpText("Posture Ailment Predictor is an application that will give a detailed analysis of your
                               postures and will map it to the possible future ailments it may cause.It provides you an expert level diagnosis
                               along with measures to be taken to avoid the unsought health problems due to your bad postures. ")
                      
                      
                      
                      
                      
                      ),
                    
                    mainPanel(
                      
                      div(id = "form", 
                          
                          fluidRow(
                            
                            
                            
                            column(3, 
                                   radioButtons("sex", label = h5("SEX"),
                                                choices = list("Male" = 1, "Female" = 0),selected = 1)
                            ),
                            
                            
                            column(3,sliderInput("ht", label = h5("HEIGHT(cms)"),
                                                 min =120 , max = 200, value = 167)
                            ),
                            
                            column(3,
                                   
                                   sliderInput("wt", label = h5("WEIGHT(kg)"),
                                               min = 40, max = 110, value = 63)),
                            
                            column(3,sliderInput("age", label = h5("AGE"),
                                                 min = 18, max = 30, value = 20)
                            )
                            
                          ),
                          
                          
                          fluidRow(
                            helpText(h6("(Enter your answers in number of hours)")),
                            helpText(h4("NECK")), 
                            
                            column(3, 
                                   sliderInput("nfs", label = h6("Neck Forward Strained"),
                                               min = 0.0, max = 10,step = 0.5, value = 8.0)
                            ),
                            column(3, 
                                   sliderInput("nbs", label = h6("Neck Backward Strained"),
                                               min = 0.0, max = 10,step = 0.5, value = 2.0)
                            ),
                            column(3, 
                                   sliderInput("mb", label = h6("On Mobile Phone"),
                                               min = 0.0, max = 12,step = 0.5, value = 10.0)
                            ),
                            
                            column(3, 
                                   sliderInput("bag", label = h6("For how long do you carry a bag on your shoulders?"),
                                               min = 0.0, max = 6,step = 0.5, value = 2.0)
                            )
                            
                            
                            
                            
                          ),
                          
                          fluidRow(
                            
                            column(3, 
                                   sliderInput("feet", label = h6("how well are your feet rested while siting?(1-well rested , 10- not rested)"),
                                               min = 1.0, max = 10,step = 1, value = 7.0)
                            )
                            
                          ),
                          
                          
                          fluidRow(
                            
                            
                            helpText(h4("TORSO"))
                            
                          ),
                          
                          
                          fluidRow(
                            
                            column(3, 
                                   sliderInput("stback", label = h6("Sit with straight back"),
                                               min = 0.0, max = 12,step = 0.5, value = 2.0)
                            ),
                            column(3, 
                                   sliderInput("hback", label = h6("Sit with hunch back"),
                                               min = 0.0, max = 12,step = 0.5, value = 6.0)
                            ),
                            column(3, 
                                   sliderInput("slouch", label = h6("sit slouching"),
                                               min = 0.0, max = 12,step = 0.5, value = 4.0)
                            ),
                            
                            column(3,sliderInput("armrest", label = h6("How well are your arms rested while sitting?(1-well rested , 10- not rested)"),
                                                 min = 1.0, max = 10.0,step = 1, value = 1.0)
                            )
                            
                            
                          ),
                          
                          fluidRow(
                            
                            column(3, 
                                   sliderInput("over", label = h6("Over exertion"),
                                               min = 0.0, max = 6,step = 0.5, value = 2.0)
                            ),
                            column(3, 
                                   sliderInput("standst", label = h6("Standing Straight"),
                                               min = 0.0, max = 10,step = 0.5, value = 4.0)
                            ),
                            
                            column(3, 
                                   sliderInput("standsl", label = h6("Standing Slouched"),
                                               min = 0.0, max = 6,step = 0.5, value = 1.0)
                            ),
                            
                            
                            
                            
                            column(3,sliderInput("oneleg", label = h6("For how long do you stand with more pressure on one leg?"),
                                                 min = 0.0, max = 6,step = 0.5, value = 0.0)
                            )
                            
                            
                            
                          ),
                          
                          #actionButton("submit", "Submit", class = "btn-primary"),
                          actionButton("result","Predict", class ="btn-primary")
                          
                          
                      ),
                      
                      br(),
                      br(),
                      #responses table
                      
                      #DT::dataTableOutput("responses", width = 300),
                      
                      #plotlyOutput("Plot1", height = "600px"),
                      
                      fluidRow(
                        navlistPanel(
                        
                        tabPanel("Plot",column(12,plotlyOutput("Plot5"))), #graphplot
                        tabPanel("Sitting Problems",column(12,tableOutput("Plot1"))), #sit_clusternumber/diseasedetails
                         tabPanel("Tips to improve sitting",column(12,htmlOutput("Plot2"))), #sit_cluster_distance
                        tabPanel("Standing problems",column(12,tableOutput("Plot3"))), #stand_clusternumber/diseasedetails
                          tabPanel("Tips to improve Standing",column(12,htmlOutput("Plot4")))     #stand_cluster_distance
                        
                        
                        
                        )
                        
                        
                        
                        
                        
                      )
                      
                      
                      
                      
                    ))
                  )
)
