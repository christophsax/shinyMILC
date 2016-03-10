library(shiny)
library(MILC)
library(survival)


# remarks on MILC

# - confusing in help: '7-dimensional numeric vector'. An array has dimensions,
# not a vector. In R parlance: 'a vector of length 7'
# - why feed the random number? Why not treating the number of cigarets and
# gender like the other args?


# simulation function
sim_nat_hist <- function(age, smkint, pred_yrs, gender, status, ts, tq, n = 50){
  # model parametrization
  m        <- 0.00042 
  cdiagn   <- c(3.91, 3.91)
  creg     <- c(1.1, 1.1)
  cdist    <- c(2.8, 2.8)

  ff <- function(x) data.frame(nat_hist(c(runif(5), age, smkint), pred_yrs, gender, status, ts, tq, m, cdiagn, creg, cdist))

  # could do some parallelization here
  do.call(rbind, lapply(1:n, ff))
}


# # example function call (this is what we put into shiny)
# dta <- sim_nat_hist(age = 50, smkint = 100, pred_yrs = 40, gender = "male", status = "current", ts = 20, n = 50)

# # Compare overall survival by cause #
# dta$dth <- dta$T_death == dta$T_final
# plot(survfit(Surv(T_final, dth) ~ cause, data = dta))





