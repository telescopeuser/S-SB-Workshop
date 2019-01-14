##############################
###### R INTRODUCTION ########
##############################

##############################
# Author: GU Zhan (Sam)
# https://github.com/telescopeuser/S-SB-Workshop
##############################

##############################
# Enquire R Working Directory
##############################
getwd()

##############################
# Update R Working Directory
##############################
setwd("H:/TelescopeUser/Downloads/R") 
setwd("H:\\TelescopeUser\\Downloads\\R")
getwd()

##############################
# [slide] How R Works
# expressions
##############################
1 + 1
"I’m learning R!"
3^2

##############################
# [slide] How R Works
# logical values
##############################
8 > 6
1 + 1 == 3
2 <= 3

##############################
# [slide] R Scripts
# To run a sample script
##############################
source ("start.R")

##############################
# [slide] Variables
# Assignment operator: <- or =
##############################
x <- 8 # assign 8 to the variable x
x =  8 # same as above
x # print the value of x
x / 2 # x can now be used in an expression
x <- 'I am learning R!' # assign a string to x
x =  'I am learning R!' # same as above

##############################
# [slide] Operators
# +-, /, <-, =, %%, =
##############################
x = 8
x == 3
x + 8
x = x + 1
x / 2
x - (2+3)
x %% 3

##############################
# [slide] Functions
# y = f(x)
##############################
sum (1, 2, 3) #add all the values
sqrt (25) #square root

rep ('hi!', times = 20)

##############################
# [slide] Using a Package in R
# package function's help documentation
##############################
library(ggplot2)
library(help="ggplot2")  # Documentation for a package

##############################
# [slide] Getting Help
# package function's help documentation
##############################
help(qplot)
?qplot
example(qplot)

##############################
# [slide] Cheatsheets
##############################
# Menu -> Help -> Cheatsheets

##############################
# [slide] Keyboard shortcuts
##############################
# Menu -> Help -> Keyboard Shortcuts Help

##############################
# THE END 
# https://www.iss.nus.edu.sg/executive-education/course/detail/nicf-statistics-bootcamp/analytics-and-intelligent-systems
##############################
