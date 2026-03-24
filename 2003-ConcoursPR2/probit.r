dose = c(1.691, 1.724, 1.755, 1.784, 1.811, 1.837, 1.861, 1.884)
morts = c(6, 13, 18, 28, 52, 53, 61, 60)
total = c(59, 60, 62, 56, 63, 59, 62, 60)
proportion = morts / total
plot(dose, proportion, type="p", lwd=5)
x = seq(1.6, 2, 0.001)
z = -34.9561 + 19.741 * x
Phi = pnorm(z)
plot(x, Phi, type="l", lwd=2, col="red", xlab="dose")
points(dose, proportion, type="p", lwd=5)






x = seq(1.5, 2, 0.0005)
z = -34.9561 + 19.741 * x
x1 = 1.6
#x2 = 1.75
#x3 = 1.85
mu1 = -34.9561 + 19.741 * x1
#mu2 = -34.9561 + 19.741 * x2
#mu3 = -34.9561 + 19.741 * x3

f1 = dt(z-mu1, 10)
plot(z, f1, type="l", col="blue", lwd=2, ylab="densité", 
	xlab="E(Z) = a + b * dose")
lines(c(mu1, mu1), c(0, .4), type="l", col="blue")

#f2 = dt(z-mu2, 10)
#points(z, f2, type="l", col="red", lwd=2)
#lines(c(mu2, mu2), c(0, .4), type="l", col="red")

#f3 = dt(z-mu3, 10)
#points(z, f3, type="l", col="green", lwd=2)
#lines(c(mu3, mu3), c(0, .4), type="l", col="green")

lines(c(0, 0), c(0, .4), type="l", col="black", lwd=3)


plot(x, f1, type="l", col="blue", lwd=2, ylab="densité", 
	xlab="x = dose")
lines(c(x1, x1), c(0, .4), type="l", col="blue")

#points(x, f2, type="l", col="red", lwd=2)
#lines(c(x2, x2), c(0, .4), type="l", col="red")

#points(x, f3, type="l", col="green", lwd=2)
#lines(c(x3, x3), c(0, .4), type="l", col="green")

lines(c(1.77, 1.77), c(0, .4), type="l", col="black", lwd=3)

