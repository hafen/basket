% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/util.r
\name{cluster_membership}
\alias{cluster_membership}
\title{Cluster Baskets Base on the matrix's}
\usage{
cluster_membership(m)
}
\arguments{
\item{m}{the adjacency matrix.}
}
\value{
A factor variable with cluster memberships for each cohort in 
the study.
}
\description{
This is the default function used to cluster cohorts in the 
\code{basket}, \code{mem_mcmc}, and \code{mem_exact} functions. 
The approach creates a graph where each vertex is a cohort and the
weight between two cohorts is determined by their posterior exchangeability
probability. The graph is then clustered using \pkg{igraph}'s 
\code{louvain} function, which determines the number of clusters and
the cluster memberships, and has been shown to perform well with 
real clinical data.
}
\seealso{
basket mem_mcmc mem_exact
}
