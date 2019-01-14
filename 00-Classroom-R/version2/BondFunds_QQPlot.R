attach(BondFunds)

## construct a q-q plot
qqnorm(Return2009, col="blue", xlab="z Value", 
       ylab="Return2009")
qqline(Return2009, col="red", lwd=2)

detach(BondFunds)