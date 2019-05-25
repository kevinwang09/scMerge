context("Test-standardize function")
set.seed(1234)
L = ruvSimulate(m = 500, n = 2000, nc = 100, nCelltypes = 3, nBatch = 2, lambda = 0.1, sce = FALSE)
Y = t(log2(L$Y + 1L)); M = L$M; ctl = L$ctl; batch = L$batch;

s1 = standardize(Y, batch)
s2 = standardize2(Y, batch)
expect_equal(s1$s.data, 
             s2$s.data, tol = 1e-6)

# expect_equal(s1$stand.var, 
#              s2$stand.var, tol = 1e-6)
# library(profvis)
# profvis({
#   standardize(Y, batch)
#   standardize2(Y, batch)
# })
# 