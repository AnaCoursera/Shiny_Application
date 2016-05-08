library(shiny);
library("ISOcodes")
data(ISO_3166_1)
shinyUI(fluidPage(
  includeCSS("style.css"),
  headerPanel("BMI Calculator"),
  sidebarPanel(
    radioButtons("Gender","Gender",c("Male"=1,"Female"=0)),
    br(),
    numericInput(inputId="Height",label="Height in centimeters",value=0, min=0),
    p("Note: 1 Ft = 30.48 cm, 1 In = 2.54 cm"),
    br(),
    numericInput(inputId="Weight",label="Weight in kg",value=0, min=0),
    p("Note: 1 lbs = 0.45 kg, 1 st = 6.35 kg"),
    submitButton("Calculate")
  ),
  mainPanel(
    h3('Your BMI coefficient is:', style = "color:red"),
    verbatimTextOutput("bmi"),
    verbatimTextOutput("bmiclass"),
    br(),
    h4('Reference'),
    p("Your BMI is a measurement of your body weight based on your height and weight. Although your BMI does not actually measure your percentage of body fat, it is a useful tool to estimate a healthy body weight based on your height. Due to its ease of measurement and calculation, it is the most widely used diagnostic indicator to identify a person's optimal weight depending on his height. Your BMI number will inform you if you are underweight, of normal weight, overweight, or obese. However, due to the wide variety of body types, the distribution of muscle and bone mass, etc., it is not appropriate to use this as the only or final indication for diagnosis"),
    br(),
    h4("Body Mass Index Formula"),
    p("BMI = weight (kg) / height^2 (m2)"))
))