  library(testthat)
  library(basket)
#library(foreach)
#foreach::registerDoSEQ()


context("fit full Bayes MCMC models")

# Load the reference outputs.
#load("../../inst/test-data/fitMCMC1_reference.rda")
#load("../../inst/test-data/fitMCMC2_reference.rda")
#initdata <- dget("../../inst/test-data/MCMCtestInitial.txt")

#library(devtools)
#devtools::use_data(fit.MCMC.1, fit.MCMC.2, initdata)


data(vemu_wide)
data("fit.MCMC.1")
data("fit.MCMC.2")
data("initdata")


mem_fit1 <- mem_full_bayes_mcmc(
  responses = vemu_wide$responders, size = vemu_wide$evaluable,
  name = c("NSCLC ", "CRC.v ", "CRC.vc", "  BD  ", "ED.LH ", " ATC  "),
  p0 = 0.15, Initial = NA
)


expect_equal(mem_fit1$basketwise$PEP, fit.MCMC.1$PEP)
expect_equal(mem_fit1$basketwise$HPD, fit.MCMC.1$HPD, tolerance = 5e-2)
expect_equal(mem_fit1$basketwise$CDF, fit.MCMC.1$CDF)
expect_equal(mem_fit1$basketwise$ESS, fit.MCMC.1$ESS, tolerance = 5e-2)




mem_fit2 <- mem_full_bayes_mcmc(
  responses = vemu_wide$responders, size = vemu_wide$evaluable,
  name = c("NSCLC ", "CRC.v ", "CRC.vc", "  BD  ", "ED.LH ", " ATC  "),
  p0 = 0.15, Initial = initdata
)


expect_equal(mem_fit2$basketwise$PEP, fit.MCMC.2$PEP)
expect_equal(mem_fit2$basketwise$HPD, fit.MCMC.2$HPD, tolerance = 5e-2)
expect_equal(mem_fit2$basketwise$CDF, fit.MCMC.2$CDF)
expect_equal(mem_fit2$basketwise$ESS, fit.MCMC.2$ESS, tolerance = 5e-2)

  