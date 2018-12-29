##########################
# START                  #
##########################
print("Gu Zhan (Sam): Warm welcome!")
print('')
print("Current R Working Directory is:")
print(getwd())

# Invoke code from BondFunds_Hist.R
print('')
print('Start processing BondFunds_Hist.R')
source("BondFunds_Hist.R") 
print('E n d processing BondFunds_Hist.R')

# Invoke code from BondFunds_QQPlot.R
print('')
print('Start processing BondFunds_QQPlot.R')
source("BondFunds_QQPlot.R") 
print('E n d processing BondFunds_QQPlot.R')
