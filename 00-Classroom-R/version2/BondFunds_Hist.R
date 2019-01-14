## import data
BondFunds = read.csv("BondFunds.csv")

attach(BondFunds)

## histogram with normal curve
hist(Return2009, breaks=15, prob=T)
curve(dnorm(x, mean(Return2009), sd(Return2009)),
      add=TRUE, col="red", lwd=2)
lines(density(Return2009), col="blue")

detach(BondFunds)