##############################

##### working directory  #####

##############################
getwd()
setwd('/media/sf_vm_shared_folder/S-SB-Day1n2/R')
getwd()

##########################
# SAMPLING AND NORMALITY #
##########################

## randomly select 20 distinct states
sample(1:50, 20)
sample(state.name, 20)

#Evaluating Normality
y = rnorm(500, 50, 10) 
# generate 500 random variates from a normal distribution with mean=50, sd =10

hist(y) 
# histogram of y

qqnorm(y) 
# make a qq plotqqline(y) # add a straight line to the qq plot


z = rchisq(500, df=6) 
# generate 500 random variates from chisquare distribution with 6 degrees of freedom

hist(z) 
# histogram of y

qqnorm(z) 
# make a qq plot

qqline(z) 
# add a straight line to the qq plot

source("BondFunds_Hist.R") #invoke code from BondFunds_Hist.R

source("BondFunds_QQPlot.R") #invoke code from BondFunds_QQPlot.R
