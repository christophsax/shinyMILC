
shinyServer(function(input, output) {

  rDta <- reactive({

    # each input change will trigger reevaluation
    age = input$age
    smkint = input$smkint
    pred_yrs = input$pred_yrs
    gender = input$gender
    status = input$status
    ts = input$tsqs[1]
    tq = input$tsqs[2]
    n = input$n
    
    z <- sim_nat_hist(age = age, smkint = smkint, pred_yrs = pred_yrs, gender = gender, status = status, ts = ts, tq = tq, n = n)
    z
  })
  
  output$oSurvivalPlot <- renderPlot({
    dta <- rDta()
    dta$dth <- dta$T_death == dta$T_final
    plot(survfit(Surv(T_final, dth) ~ cause, data = dta))
  })
  
})


