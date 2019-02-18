
#' @title Make the summary table
#'
#' @description From the input full_bayes class object, summarize the CDF, HPD, ESS, Mean, and Median results.
#' @param res the full_bayes class object..
#'
#' @examples
#' 
#' @export


#' @export
summary.full_bayes <- function(res) {
  # res <- MHResult1$clusterwise
  if (class(res$post.prob) == "matrix") {
    cdfS <- c()
    for (i in 1:dim(res$post.prob)[1])
    {
      ss <- paste("Post.Prob ", rownames(res$post.prob)[i])
      cdfS <- c(cdfS, ss)
    }
  } else {
    cdfS <- "Post.Prob"
  }
  oct <- rbind(res$post.prob, res$HPD, res$ESS, res$mean_est, res$median_est)
  rownames(oct) <- c(cdfS, "HPD LB", "HPD HB", "ESS", "Mean", "Median")
  oct <- round(oct, 3)
  return(oct)
}
