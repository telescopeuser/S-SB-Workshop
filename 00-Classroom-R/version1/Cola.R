##############################

##### working directory  #####

##############################
getwd()
setwd('/media/sf_vm_shared_folder/S-SB-Day1n2/R')
getwd()


## import data
Cola = read.csv("Cola.csv")

attach(Cola)

## visualise the sample data
boxplot(Normal, EndAisle, names=c("Normal", "End-Aisle"),
        ylab="Cola Sales Volume (Number of Cases)",
        main="Boxplot of Normal and End-Aisle Sales",
        col=c("gold", "light blue"))

#Testing for Normality on Normal Shelf data
shapiro.test(Normal)


#Testing for Normality on End Aisle Shelf data
shapiro.test(EndAisle)


#Testing for Equal variance
var.test(x=Normal, y=EndAisle)


## t test
t.test(Normal, EndAisle, var.equal=TRUE)


## F test
var.test(Normal, EndAisle)

detach(Cola)

