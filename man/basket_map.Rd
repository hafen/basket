% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/accessors.r
\name{basket_map}
\alias{basket_map}
\title{Get the Basketwise Maximum A Posteriori Probability Matrix}
\usage{
basket_map(x)
}
\arguments{
\item{x}{either an exchangeability model or basket object.}
}
\description{
MEM analyses include the maximum a posterior exchangeability 
probability (MAP) of included arms indicating whether 
two arms in the trial are exchangeable. This function returns the matrix
of those relationships.
}
\examples{
\donttest{
# Create an MEM analysis of the Vemurafenib trial data.
data(vemu_wide)

mem_analysis <- mem_exact(vemu_wide$responders, 
                          vemu_wide$evaluable,
                          vemu_wide$baskets)

# Get basket MAPs.
basket_map(mem_analysis)
}
}
