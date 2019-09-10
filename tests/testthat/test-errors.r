
context("Errors")

expect_error(cluster_baskets(NULL))
expect_error(basket_pep(NULL))
expect_error(basket_map(NULL))
expect_error(cluster_pep(NULL))
expect_error(cluster_map(NULL))
expect_error(sample_posterior(NULL))
expect_error(basket_name(NULL))
expect_error(update_p0(NULL))
expect_error(plot_density(NULL))
expect_error(plot_pep(NULL))
expect_error(basket:::exchangeogram(matrix(c(1, 2, 3, 4), ncol = 2)))
expect_error(plot_mem(NULL))
expect_error(plot_map(NULL))
expect_error(mem_exact(c(1, 2, 3), 1))
expect_error(mem_mcmc(c(1, 2, 3), 1))

