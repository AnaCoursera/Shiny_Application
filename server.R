library(shiny);
bmivalue <- function(Height,Weight) {
  if (Weight ==0 |Height == 0) return(NA)
  else return(round(Weight/(Height/100)^2,digits = 2))
}
bmiclass <- function(bmiv) {
  if (is.na(bmiv)) {
    return ("")
  }
  if (bmiv < 18.5) {
    return ("Your BMI is under 18.5, you are considered UNDERWEIGHT")
  }
  if (bmiv >= 18.5 &  bmiv < 25) {
    return ("Your BMI is between 18.5 and 25, you are considered NORMAL")
  }
  if (bmiv >= 25 &  bmiv < 30) {
    return ("Your BMI is between 25 and 30, you are considered OVERWEIGHT")
  }
  if(bmiv >= 30 &  bmiv < 35) {
    return ("Your BMI is between 30 and 35, you are considered OBESE CLASS I")
  }
  if(bmiv >= 35 &  bmiv < 40) {
    return ("Your BMI is between 35 and 40, you are considered OBESE CLASS II")
  }
  if(bmiv >= 40) {
    return ("Your BMI is grather than 40, you are considered OBESE CLASS III")
  }
}

shinyServer(function(input,output){
  output$bmi <- renderText({bmivalue(input$Height,input$Weight)})
  output$bmiclass <- renderText({bmiclass(bmivalue(input$Height,input$Weight))})
  }
)