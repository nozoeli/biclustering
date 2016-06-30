#-----------Simulation(Poisson)------------------
source('shabalin.R')
source('randomMatrix.R')
#-----------Setup--------------
M1 <- 5000
N1 <- 5000
m1 <- 200
n1 <- 400
M2 <- 100
N2 <- 10000
m2 <- 50
n2 <- 300
mu1 <- max(log(M1)/n1, log(N1)/m1, (log(M1) + log(N1)) / (m1 + n1))
theta1 <- (1 : 20) * 0.5 * mu1
mu2 <- max(log(M2)/n2, log(N2)/m2, (log(M2) + log(N2)) / (m2 + n2))
theta2 <- (1 : 20) * 0.5 * mu2
B <- 100  # repeat measuring the error rates
it <- 1000  # number of iteratives in using Shabalin's method
#----------Simulation------------------
errPoiBalaRow <- matrix(NA, B, length(theta1))  # error rates 
errPoiBalaCol <- matrix(NA, B, length(theta1))
errPoiImbaRow <- matrix(NA, B, length(theta2))
errPoiImbaCol <- matrix(NA, B, length(theta2))
for (j in 1 : length(theta1)){
  for (i in 1 : B){
    X1 <- poissonMatrix(M1, N1, m1, n1, theta1[j])
    X2 <- poissonMatrix(M2, N2, m2, n2, theta2[j])
    res1 <- iterativeShabalin(X1, m1, n1, it)
    res2 <- iterativeShabalin(X2, m2, n2, it)
    errPoiBalaRow[i, j] <- 1 - length(intersect(res1$Rows, 1:m1)) / m1
    errPoiBalaCol[i, j] <- 1 - length(intersect(res1$Cols, 1:n1)) / n1
    errPoiImbaRow[i, j] <- 1 - length(intersect(res2$Rows, 1:m2)) / m2
    errPoiImbaCol[i, j] <- 1 - length(intersect(res2$Cols, 1:n2)) / n2
  }
}

save(errPoiBalaRow, errPoiBalaCol, errPoiImbaRow, errPoiImbaCol, file = 'poi.Rdata')