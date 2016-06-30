#-----------Simulation------------------
source('shabalin.R')
source('randomMatrix.R')
#-----------Unalanced setup--------------
M <- 100
N <- 10000
m <- 50
n <- 300
mu <- max(log(M)/n, log(N)/m, (log(M) + log(N)) / (m + n))
theta <- (1 : 20) * 0.5 * mu
B <- 100  # repeat measuring the error rates
it <- 1000  # number of iteratives in using Shabalin's method
#----------Simulation------------------
errNormalImbaRow <- matrix(NA, B, length(theta))  # error rates 
errNormalImbaCol <- matrix(NA, B, length(theta))
errNormalImbaRankRow <- matrix(NA, B, length(theta))
errNormalImbaRankCol <- matrix(NA, B, length(theta))
for (j in 1 : length(theta)){
  for (i in 1 : B){
    X <- normalMatrix(M, N, m, n, theta[j])
    rankX <- rankMatrix(X)
    res <- iterativeShabalin(X, m, n, it)
    resRank <- iterativeShabalin(rankX, m, n, it)
    errNormalImbaRow[i, j] <- 1 - length(intersect(res$Rows, 1:m)) / m
    errNormalImbaCol[i, j] <- 1 - length(intersect(res$Cols, 1:n)) / n
    errNormalImbaRankRow[i, j] <- 1 - length(intersect(resRank$Rows, 1:m)) / m
    errNormalImbaRankCol[i, j] <- 1 - length(intersect(resRank$Cols, 1:n)) / n
  }
}

save(errNormalImbaRow, errNormalImbaCol, errNormalImbaRankRow, errNormalImbaRankCol, file = 'normalImba.Rdata')