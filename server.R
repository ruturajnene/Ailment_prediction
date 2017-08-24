library(shiny)
library(nnet)
library(klaR)
library(googlesheets)
library(dplyr)
library(curl)
library(DT)
library(RMySQL)
library(DBI)
library(plotly)
library(dplyr)
library(proxy)

source("global.R")
source("kmeans.R")
source("diseases.R")


shinyServer(
  function(input, output) {
    
    #sittingparam
        SliderValues1 <- reactive({
      sl1<-data.frame(
        #sex = as.numeric(input$sex), 
        age = as.numeric(input$age),
        ht = as.numeric(input$ht),
        wt = as.numeric(input$wt),
        nfs = as.numeric(input$nfs),
        nbs = as.numeric(input$nbs),
        mb =as.numeric(input$mb),
        stback =as.numeric(input$stback),
        hback =as.numeric(input$hback),
        slouch =as.numeric(input$slouch),
        feet =as.numeric(input$feet),
        armrest =as.numeric(input$armrest),
        
       stringsAsFactors = FALSE
      )
      sl1
    } )

            #standingparam
        SliderValues2 <- reactive({
          sl2<-data.frame(
            #sex = as.numeric(input$sex), 
            age = as.numeric(input$age),
            ht = as.numeric(input$ht),
            wt = as.numeric(input$wt),
            bag = as.numeric(input$bag),
            over = as.numeric(input$over),
            standst = as.numeric(input$standst),
            standsl = as.numeric(input$standsl),
            oneleg = as.numeric(input$oneleg),
            stringsAsFactors = FALSE
          )
          sl2
        } )
    
        #sittingclust
    saveData1 <- function(data) {
      ipdata <- as.data.frame(data)
      #ip_data<-ipdata[,2:12]
      data1= read.csv("D:/My files/VESIT/4th year/Project/PostMap/sitbc.csv")
      data1=data1[,2:12]
      pm1<-pca(data1)
      pmCluster1<-k_mean1(pm1)
      pmcenter1 <- reconCen(pm1,pmCluster1)
      distance<-predictDis(pm1,pmCluster1,ipdata)
      #returnsclusternumber
      clust<-which.min(distance)
      clust
    }
        
    #sittingdist
    saveData2 <- function(data) {
      ipdata <- as.data.frame(data)
      #ip_data<-ipdata[,2:12]
      data1= read.csv("D:/My files/VESIT/4th year/Project/PostMap/sitbc.csv")
      data1=data1[,2:12]
      pm1<-pca(data1)
      pmCluster1<-k_mean1(pm1)
      pmcenter1 <- reconCen(pm1,pmCluster1)
      distance<-predictDis(pm1,pmCluster1,ipdata)
      #returnsclusternumber
      min_din1<-min(distance)
      min_din1
      
    }

    #standingclust
    saveData3 <- function(data) {
      ipdata <- as.data.frame(data)
      #ip_data<-ipdata[,2:12]
      data1= read.csv("D:/My files/VESIT/4th year/Project/PostMap/standbc.csv")
      data1=data1[,2:9]
      pm1<-pca(data1)
      pmCluster1<-k_mean2(pm1)
      pmcenter1 <- reconCen(pm1,pmCluster1)
      distance<-predictDis(pm1,pmCluster1,ipdata)
      #returnsclusternumber
      clust<-which.min(distance)
      clust
    }
    #standingdist
    saveData4 <- function(data) {
      ipdata <- as.data.frame(data)
      #ip_data<-ipdata[,2:12]
      data1= read.csv("D:/My files/VESIT/4th year/Project/PostMap/standbc.csv")
      data1=data1[,2:9]
      pm1<-pca(data1)
      pmCluster1<-k_mean2(pm1)
      pmcenter1 <- reconCen(pm1,pmCluster1)
      distance<-predictDis(pm1,pmCluster1,ipdata)
      #returnsclusternumber
      min_din1<-min(distance)
      min_din1
      
    }
    
        
    #sit_disease_details
    op1<-eventReactive(input$result,{saveData1(SliderValues1())})
    
    output$Plot1 <- renderTable({ diseasesit(op1())},colnames = FALSE)
    
    
    #sit_dist
    op2<-eventReactive(input$result,{saveData2(SliderValues1())})
    
    
    output$Plot2 <- renderText({HTML(sittips(op1()))})
    #output$Plot2 <- renderText({op2()})
    
    #stand_disease_details
    op3<-eventReactive(input$result,{saveData3(SliderValues2())})
    
    output$Plot3<- renderTable({ diseasestand(op3())},colnames = FALSE)
    
    #stand_dist
    op4<-eventReactive(input$result,{saveData4(SliderValues2())})
    
    #output$Plot4 <- renderText({op4()})
    output$Plot4 <- renderText({HTML(standtips(op3()))})
    
    loadData <- function(z) {
      z <- data.frame("Categorie"=rownames(z), z)
      data <- z[,c('Categorie', 'z')]
      p <- plot_ly(data, labels = ~Categorie, values = ~z, type = 'pie') %>%
        layout(title = 'Severity of Sitting vs Standing',
               xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
               yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE))
      
    }
    output$Plot5 <- renderPlotly({loadData(swagRatio(op2(),op4(),SliderValues1(),SliderValues2()))})
    
    #store the fields in data
    #formData <- reactive({
    # data <- sapply(fields, function(x) input[[x]])
    #data
    #  })
    
    # When the Submit button is clicked 
    #observeEvent(input$submit, {
    # saveData(SliderValues1())
    #
    #  })
    
        
    #Plot1 <-reactive({
    # input$result
    #})
    
    #responses<- reactive({
     # input$submit
    #})
    
    
    
  }
)










