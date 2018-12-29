##############################

##### working directory  #####

##############################
getwd()
setwd('/media/sf_vm_shared_folder/S-SB-Day1n2/R')
getwd()

# improving return rate at the hotels

#create a vector for response = will choose
WillChoose = c(163, 154)

#create a vector for total responses
TotalRespondents = c(227, 262)

#run a chi square proportions test
prop.test(WillChoose, TotalRespondents, correct = FALSE)
