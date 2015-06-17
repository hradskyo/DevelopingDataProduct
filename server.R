library(shiny)
TelesnyPovrch <- function(weight,height) {(TP<-sqrt((height*weight)/3600))}
DavkaMTX <- function(weight,height,zobraz) {
    if (zobraz==TRUE) {
        TP<-sqrt((height*weight)/3600)
        (MTX<-paste0("Starting dose of methotrexate: ",
                     round(15*TP,0)," mg every week"))
    }
}
DavkaADA <- function(weight,height,zobraz) {
    if (zobraz==TRUE) {
      TP<-sqrt((height*weight)/3600)
      ADA1<-100*TP
      if (ADA1>160){ADA1=160}
      ADA2<-50*TP
      if (ADA2>80){ADA2=80}
      ADA3<-25*TP
      if (ADA3>40){ADA3=40}
      (ADA<-paste0("Induction of adalimumab: ",
                   "1. dose: " ,round(ADA1)," mg;"," 2. dose: ",
                   round(ADA2)," mg;"," 3. dose ",round(ADA3)," mg s.c." ))
    }
}

shinyServer(
  function(input, output) {
    output$inputValue1 <- renderPrint({input$height})
    output$inputValue2 <- renderPrint({input$weight})
    output$vysledek <- renderPrint({TelesnyPovrch(input$height,input$weight)})
    output$MTX <- renderPrint({DavkaMTX(input$height,input$weight,input$MTX.view)})
    output$ADA <- renderPrint({DavkaADA(input$height,input$weight,input$ADA.view)})
})
