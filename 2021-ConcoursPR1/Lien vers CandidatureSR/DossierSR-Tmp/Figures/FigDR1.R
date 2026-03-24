library(mclust)
source('/home/robin/PgmR/HMM/FunctionsHMMGeneral.R')
source('/home/robin/PgmR/Mixture/FunctionsMclust.R')

# FDR
a = 1; b = 50; p0 = .9; p1 = 1-p0; n = 1e4
n0 = rbinom(1, n, p0); n1 = n-n0
X = c(runif(n0), rbeta(n1, a, b))
H = hist(X, breaks=sqrt(n), xlab='', ylab='', main='')
w = mean(diff(H$breaks))
x = seq(0, 1, by=1e-2)
f0 = dbeta(x, 1, 1)
f1 = dbeta(x, a, b)
f = p1*f1+p0*f0
lines(x, n*w*f, col=4, lwd=2)
lines(x, n*w*p0*f0, col=3, lwd=2)
lines(x, n*w*p1*f1, col=2, lwd=2)
lines(x, 1.2*max(n*w*f)*p1*f1/f, col=1, lty=2, lwd=2)

Y = qnorm(X)
H = hist(Y, breaks=sqrt(n), xlab='', ylab='', main='')
w = mean(diff(H$breaks))
y = seq(min(Y), max(Y), length.out=length(x))
g0 = dnorm(y)
g1 = dnorm(y)*dbeta(pnorm(y), a, b)
g = p1*g1+p0*g0
lines(y, n*w*g, col=4, lwd=2)
lines(y, n*w*p0*g0, col=3, lwd=2)
lines(y, n*w*p1*g1, col=2, lwd=2)
lines(y, 1.2*max(n*w*g)*p1*g1/g, col=1, lty=2, lwd=2)

# CGH
n = 1e4
p01 = 1e-3; p10 = 1e-2
K = 3
sigma = .3
P = matrix(c(1-p10, p01, 0, p10, 1-2*p01, p10, 0, p01, 1-p10), K, K)
set.seed(2)
Z = SimMC(n, StatDist(P), P)%*%((1:K))
Y = Z + sigma*rnorm(n)
Y = Y-mean(Y)
png(width=480, height=360, 'FigDR1-CGH.png')
plot(Y, pch=20, xlab='', ylab='', main='', cex=.2)
dev.off()