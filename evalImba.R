#------Result evaluation--------
#------Setup--------------------
load('normalImba.Rdata')
mu <- (1 : 20) * 0.5
#-------------------------------
mu1 <- mu
mu2 <- mu1 + 0.05
mu3 <- mu1 - 0.05

meanRow <- as.vector(apply(errNormalImbaRow, 2, mean))
meanCol <- as.vector(apply(errNormalImbaCol, 2, mean))
lowRow <- as.vector(apply(errNormalImbaRow, 2, quantile, probs = 0.05))
highRow <- as.vector(apply(errNormalImbaRow, 2, quantile, probs = 0.95))
lowCol <- as.vector(apply(errNormalImbaCol, 2, quantile, probs = 0.05))
highCol <- as.vector(apply(errNormalImbaCol, 2, quantile, probs = 0.95))

meanRowRank <- as.vector(apply(errNormalImbaRankRow, 2, mean))
meanColRank <- as.vector(apply(errNormalImbaRankCol, 2, mean))
lowRowRank <- as.vector(apply(errNormalImbaRankRow, 2, quantile, probs = 0.1))
highRowRank <- as.vector(apply(errNormalImbaRankRow, 2, quantile, probs = 0.9))
lowColRank <- as.vector(apply(errNormalImbaRankCol, 2, quantile, probs = 0.1))
highColRank <- as.vector(apply(errNormalImbaRankCol, 2, quantile, probs = 0.9))

plot.new()
plot(mu1, meanRow, pch = 4, col = 2, xlim = c(mu1[1] - 0.05, mu1[length(mu)] + 0.05), ylim = c(0,1), xlab="Elevated Mean",
     ylab="Error Rate", xaxt = 'n')
title('M = 100, N = 10000, m = 50, n = 300, Normal')
axis(side = 1, at = mu1)
segments(mu1, lowRow, mu1, highRow, col = 2, lwd = 2.5)
segments(mu1 - 0.1, lowRow, mu1 + 0.1, lowRow, col = 2, lwd = 2.5)
segments(mu1 - 0.1, highRow, mu1 + 0.1, highRow, col = 2, lwd = 2.5)
points(mu1, meanRow, pch = 4, col = 2)
lines(mu1, meanRow, lty = 1, col = 2, lwd = 2.5)

segments(mu2, lowCol, mu2, highCol, col = 3, lwd = 2.5)
segments(mu2 - 0.1, lowCol, mu2 + 0.1, lowCol, col = 3, lwd = 2.5)
segments(mu2 - 0.1, highCol, mu2 + 0.1, highCol, col = 3, lwd = 2.5)
points(mu2, meanCol, pch = 4, col = 3)
lines(mu2, meanCol, lty = 1, col = 3, lwd = 2.5)


leg.txt <- c('Row ER','Column ER')
legend('topright',legend = leg.txt, col = c(2,3), pch = c(4,4), lty = c(1,1) )


#------------Ranked Version------------------

plot.new()
plot(mu1, meanRowRank, pch = 4, col = 2, xlim = c(mu1[1] - 0.05, mu1[length(mu)] + 0.05), ylim = c(0,1), xlab="Elevated Mean",
     ylab="Error Rate", xaxt = 'n')
title('M = 100, N = 10000, m = 50, n = 300, Normal, Ranked')
axis(side = 1, at = mu1)
segments(mu1, lowRowRank, mu1, highRowRank, col = 2, lwd = 2.5)
segments(mu1-0.1, lowRowRank, mu1+0.1, lowRowRank, col = 2, lwd = 2.5)
segments(mu1-0.1, highRowRank, mu1+0.1, highRowRank, col = 2, lwd = 2.5)
points(mu1, meanRowRank, pch = 4, col = 2)
lines(mu1, meanRowRank, lty = 1, col = 2, lwd = 2.5)

segments(mu2, lowColRank, mu2, highColRank, col = 3, lwd = 2.5)
segments(mu2-0.1, lowColRank, mu2+0.1, lowColRank, col = 3, lwd = 2.5)
segments(mu2-0.1, highColRank, mu2+0.1, highColRank, col = 3, lwd = 2.5)
points(mu2, meanColRank, pch = 4, col = 3)
lines(mu2, meanColRank, lty = 1, col = 3, lwd = 2.5)


leg.txt <- c('Row ER','Column ER')
legend('topright',legend = leg.txt, col = c(2,3), pch = c(4,4), lty = c(1,1) )


