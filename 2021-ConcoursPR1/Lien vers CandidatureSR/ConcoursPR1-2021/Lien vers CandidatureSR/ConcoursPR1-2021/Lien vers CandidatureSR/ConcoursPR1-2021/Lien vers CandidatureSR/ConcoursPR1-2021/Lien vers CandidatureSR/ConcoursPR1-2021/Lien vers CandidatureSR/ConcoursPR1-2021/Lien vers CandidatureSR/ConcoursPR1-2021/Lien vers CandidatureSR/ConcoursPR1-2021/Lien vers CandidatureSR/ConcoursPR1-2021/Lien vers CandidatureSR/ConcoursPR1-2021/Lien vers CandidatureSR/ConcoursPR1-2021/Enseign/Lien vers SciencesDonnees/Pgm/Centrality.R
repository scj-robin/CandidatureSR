# Minimiseur sum_i |x_i - m|^alpha

rm(list=ls()); par(mfrow = c(1, 1), pch=20)

# Donnees
# seed <- 0; set.seed(seed)
n <- 100
x <- sort(exp(rnorm(n)))
x <- rexp(n)
alphaList <- seq(1, 4, length.out=500); alphaNb <- length(alphaList)

loss <- function(m){sum(abs(x-m)^alpha)}
grad <- function(m){-sum((alpha*abs(x-m)^(alpha-1))*(sign(x-m)))}
m0 <- mean(range(x))

mList <- lossList <- rep(NA, alphaNb)
for(a in 1:alphaNb){
   alpha <- alphaList[a]
   fit <- optim(par=m0, fn=loss, gr=grad, method='BFGS')
   # fit <- optim(par=m0, fn=loss)
   mList[a] <- fit$par
   lossList[a] <- fit$value
   print(c(alpha, mList[a], lossList[a]))
}
par(mfrow=c(2, 1), mex=.6, pch=20)
plot(alphaList, mList, type='l', ylim=c(quantile(x, prob=.25), max(mList)))
points(rep(mean(alphaList), n), x)
abline(h=median(x), col=2); abline(h=mean(x), col=4)
plot(alphaList, lossList^(1/alphaList), type='l', log='y')

