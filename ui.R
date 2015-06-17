library(shiny)
shinyUI(
  pageWithSidebar(
    # Application title
      headerPanel("Calculation of body surface area"),
      sidebarPanel(h4("Entry data"),
                numericInput('height', 'Height cm', 160, min = 40, max = 210, step = 5),
                numericInput('weight', 'Weight kg', 50, min = 5, max = 200, step = 5),
                checkboxInput("MTX.view", "Metothrexate", FALSE),
                checkboxInput("ADA.view", "Adalimumab", FALSE),
                submitButton('Calculate')
                ),
    mainPanel(
      h4("Results: body surface area according to  Mosteller formula",
         span("(ref 1.)", style = "color:seagreen")),
      h5("Imupute data:"),
      verbatimTextOutput("inputValue1"),
      verbatimTextOutput("inputValue2"),
      h5("Body surface area:"),
      verbatimTextOutput("vysledek"),
      h4("Dosing of some of the drugs for patinets with inflammatory bowel disease"),
      verbatimTextOutput("MTX"),
      
      verbatimTextOutput("ADA"),
      helpText("NOTE: This function calculates body surface area and dosing of 
                some drugs for pediatric patients with Inflammatory Bowel 
                Disease according to body surface area"),
      helpText("NOTE: For calculation of drug dosing please tick off the metotheraxte or adalimumab."),
      p(span("References:", style = "color:seagreen")," 1. Mosteller RD. Simplified calculation of body-surface area. N Engl J Med. 1987 
                Oct 22;317(17):1098. PubMed PMID: 3657876.")
    )
  )
)
