% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/accessors.r
\name{cluster_pep}
\alias{cluster_pep}
\title{Get the Clusterwise Posterior Exchangeability Matrix}
\usage{
cluster_pep(x)
}
\arguments{
\item{x}{either an exchangeability model or basket object.}
}
\description{
MEM analyses include the posterior exchangeability 
probability (PEP) of clusters of arms giving the probability
that any two arms are exchangeable. This function returns the matrix
of those probabilities.
}
\examples{
\donttest{
# Create an MEM analysis of the Vemurafenib trial data.
data(vemu_wide)

mem_analysis <- mem_exact(vemu_wide$responders, 
                          vemu_wide$evaluable,
                          vemu_wide$baskets)

# Get cluster PEPs.
basket_pep(mem_analysis)
}
}
