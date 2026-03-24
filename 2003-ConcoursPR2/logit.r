age = c("<55ans", "<55ans", ">55ans", ">55ans")
i = c(1, 1, 2, 2)
operation = c("aorte", "mitrale", "aorte", "mitrale")
j = c(1, 2, 1, 2)
morts = c(4, 1, 7, 9)
total = c(1259, 2082, 1417, 1647)
proportion = morts / total
plot(i[j=1], proportion[j=1], type="p", lwd = 5, col = "red", xlab="age")
points(i[j=2], proportion[j=2], type="p", lwd = 5, col = "blue")

p = seq(0.0001, 0.9999, 0.0001)
f = log(p/(1-p))

plot(p, f, type="l", col="blue", lwd=2, ylab="", 
	xlab="")
lines(c(0, 1), c(0, 0), type="l", col="black")
lines(c(0.5, 0.5), c(-10, 10), type="l", col="black")
