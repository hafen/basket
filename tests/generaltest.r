library(testthat)
library(basket)
library(igraph)
library(foreach)


data(vemu_wide)

baskets <- 1:3

vemu_wide <- vemu_wide[baskets,]

# Full Bayes
fb <- mem_full_bayes_exact(responses = vemu_wide$responders, 
                     size = vemu_wide$evaluable,
                     name = vemu_wide$baskets, p0=rep(0.25, length(basket)))

print(fb$PEP)
print(fb$HPD)
print(fb$CDF)

print(fb$mean_est)
print(fb$median_est)
print(fb$ESS)

#rm(list=ls())
## Vectors of Observed number of Responses (X) and Patients (N)
Data <- dget("../inst/code-from-brian/MHAlgorithm/Vemu-data.txt") 

MHResult1 <- mem_full_bayes_mcmc(responses=Data$X, size=Data$N, 
                                 name=c("NSCLC ","CRC.v ","CRC.vc","  BD  ","ED.LH "," ATC  "),
                                 p0 = c(0.15, 0.15, 0.15, 0.2, 0.15, 0.15), Initial = NA)



print(MHResult1$call)

print(MHResult1$basketwise$PEP)
print(MHResult1$basketwise$MAP)
print(MHResult1$basketwise$CDF)
print(MHResult1$basketwise$HPD)
print(MHResult1$basketwise$ESS)
print(MHResult1$basketwise$ESS2)
print(MHResult1$basketwise$mean_est)
print(MHResult1$basketwise$median_est)


print(MHResult1$clusterwise$cluster)
print(MHResult1$clusterwise$CDF)
print(MHResult1$clusterwise$HPD)
print(MHResult1$clusterwise$ESS)
print(MHResult1$clusterwise$ESS2)
print(MHResult1$clusterwise$mean_est)
print(MHResult1$clusterwise$median_est)


OCTable.full_bayes <- function(res)
{
  #res <- MHResult1$clusterwise
  if (class(res$CDF) == "matrix")
  {
    cdfS <- c()
    for (i in 1:dim(res$CDF)[2])
    {
      ss <- paste("CDF ", rownames(res$CDF)[i])
      cdfS <- c(cdfS, ss)
    }
  } else {
    cdfS <- "CDF"
  }
  oct <- rbind(res$CDF, res$HPD, res$ESS, res$mean_est, res$median_est)
  rownames(oct) <- c(cdfS, "HPD LB", "HPD HB", "ESS",  "Mean", "Median")
  return(oct)
}

OCTable.full_bayes(MHResult1$basketwise)
OCTable.full_bayes(MHResult1$clusterwise)


result <- cluster_PEP(responses=Data$X, size=Data$N, 
            name=c("NSCLC ","CRC.v ","CRC.vc","  BD  ","ED.LH "," ATC  "),
            models=MHResult1$models, pweights=MHResult1$pweights, p0 = 0.15,
            PEP=MHResult1$PEP)

print(result$clusters)
print(result$HPD)
print(result$CDF)

print(result$mean_est)
print(result$median_est)
print(result$ESS)
print(result$ESS2)
plot(density(result$samples[,1]))
plot(density(result$samples[,2]))



#rm(list=ls())

#source("pep.r")

trial_sizes <- rep(15, 6)

# The response rates for the baskets.
resp_rate <- 0.15
# The trials: a column of the number of responses, a column of the
# the size of each trial.
trials <- data.frame(responses = c(1,4, 5,0, 1, 6),
                    size = trial_sizes
                    )
MHResult2 <- mem_full_bayes_mcmc(trials$responses, trials$size,
                                 name=c(" D1 "," D2 "," D3 "," D4 "," D5 "," D6 ")) 


result <- cluster_PEP(responses = trials$responses, size = trials$size,
                      name=c(" D1 "," D2 "," D3 "," D4 "," D5 "," D6 "),
                      models=MHResult2$models, pweights=MHResult2$pweights, p0 = 0.15,
                      PEP=MHResult2$PEP)
print(trials)
print(result$clusters)
print(result$HPD)
print(result$mean_est)
print(result$median_est)
print(result$ESS)
print(result$ESS2)
plot(density(result$samples[,1]))


