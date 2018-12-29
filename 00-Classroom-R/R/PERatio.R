##############################

##### working directory  #####

##############################
getwd()
setwd('/media/sf_vm_shared_folder/S-SB-Day1n2/R')
getwd()

# import data
PERatio = read.csv("PERatio.csv")

attach(PERatio)

#Testing for Normality on Year1 data
shapiro.test(Year1)


#Testing for Normality on Year 2 data
shapiro.test(Year2)


#Testing for Equal variance
ansari.test(Year1, Year2)


# t test
t.test(Year1, Year2, paired = TRUE, var.equal=TRUE)

detach(PERatio)
