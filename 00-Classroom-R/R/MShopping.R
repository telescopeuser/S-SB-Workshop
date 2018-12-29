##############################

##### working directory  #####

##############################
getwd()
setwd('/media/sf_vm_shared_folder/S-SB-Day1n2/R')
getwd()

## import data
MShopping = read.csv("MShopping.csv")

attach(MShopping)

## count the numbers of "Yes" and "No"
table(MShopping)

## 95% confidence interval
prop.test(325, n=465)

## 99% confidence interval
prop.test(325, n=465, conf.level = 0.99)

## chi-square test
prop.test(325, n=465, p=0.66, correct=FALSE)

detach(MShopping)
