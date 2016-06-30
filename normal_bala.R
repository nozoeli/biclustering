#-----------Simulation------------------
source('shabalin.R')
source('randomMatrix.R')
#-----------Balanced setup--------------
M <- 5000
N <- 5000
m <- 200
n <- 400
mu <- max(log(M)/n, log(N)/m, (log(M) + log(N)) / (m + n))
theta <- (1 : 20) * 0.5 * mu
B <- 100  # repeat measuring the error rates
it <- 1000  # number of iteratives in using Shabalin's method
#----------Simulation------------------
errNormalBalaRow <- matrix(NA, B, length(theta))  # error rates 
errNormalBalaCol <- matrix(NA, B, length(theta))
errNormalBalaRankRow <- matrix(NA, B, length(theta))
errNormalBalaRankCol <- matrix(NA, B, length(theta))
for (j in 1 : length(theta)){
  for (i in 1 : B){
    X <- normalMatrix(M, N, m, n, theta[j])
    rankX <- rankMatrix(X)
    res <- iterativeShabalin(X, m, n, it)
    resRank <- iterativeShabalin(rankX, m, n, it)
    errNormalBalaRow[i, j] <- 1 - length(intersect(res$Rows, 1:m)) / m
    errNormalBalaCol[i, j] <- 1 - length(intersect(res$Cols, 1:n)) / n
    errNormalBalaRankRow[i, j] <- 1 - length(intersect(resRank$Rows, 1:m)) / m
    errNormalBalaRankCol[i, j] <- 1 - length(intersect(resRank$Cols, 1:n)) / n
  }
}

save(errNormalBalaRow, errNormalBalaCol, errNormalBalaRankRow, errNormalBalaRankCol, file = 'normalBala.Rdata')