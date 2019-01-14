##############################

##### working directory  #####

##############################
getwd()
setwd('/media/sf_vm_shared_folder/S-SB-Day1n2/R')
getwd()

###############################
###### DATA PREP WORKSHOP #####
###############################

#install.packages("dplyr")
# above installation required if not installed earlier

library(dplyr)


GSS2012 = read.csv("GSS2012.csv")
head(GSS2012)  # display the first few lines and see the actual data
names(GSS2012) # display variable names

#############################################
#
#   missing values
#
#############################################
table(GSS2012$marital) # counts for unique values

sum(GSS2012$marital == 0) # counts for missing values
sum(GSS2012$age == 0)
sum(GSS2012$sex == 0)
sum(GSS2012$race == 0)
sum(GSS2012$hompop == 0)
sum(GSS2012$happy == 0)
sum(GSS2012$health == 0)
sum(GSS2012$satjob == 0)
sum(GSS2012$fincome == 0)



GSS2012$marital[GSS2012$marital == 0] = NA
GSS2012$age[GSS2012$age == 0] = NA
GSS2012$hompop[GSS2012$hompop == 0] = NA
GSS2012$happy[GSS2012$happy == 0] = NA
GSS2012$health[GSS2012$health == 0] = NA
GSS2012$satjob[GSS2012$satjob == 0] = NA
GSS2012$fincome[GSS2012$fincome == 0] = NA
## same
#GSS2012[GSS2012==0] = NA

# if import data set is used, the above is guided by GUI

sum(complete.cases(GSS2012))

sum(is.na(GSS2012$fincome))
sum(is.na(GSS2012$happy))

#############################################
#
#         Encode as factor
#
#############################################

str(GSS2012$marital)  # check the data structure
class(GSS2012$marital) # class or type of an object
GSS2012$marital = factor(GSS2012$marital, 
                          levels = c(1, 2, 3, 4, 5),
                          labels = c("Married", "Widowed", "Divorced",
                                     "Separated", "Never married"))

class(GSS2012$sex)

GSS2012$sex = factor(GSS2012$sex, levels = c(1, 2),
                      labels = c("Male", "Female"))

class(GSS2012$race)
GSS2012$race = factor(GSS2012$race, 
                      levels = c(1, 2, 3),
                      labels = c("White", "Black", "Other"))

class(GSS2012$happy)
GSS2012$happy = factor(GSS2012$happy, 
                        levels = c(1, 2, 3),
                        labels = c("Very happy", "Pretty happy",
                                   "Not too happy"))

class(GSS2012$health)
GSS2012$health = factor(GSS2012$health, 
                        levels = c(1, 2, 3, 4),
                        labels = c("Excellent", "Good",
                                   "Fair", "Poor"))

class(GSS2012$satjob)
GSS2012$satjob = factor(GSS2012$satjob, 
                         levels = c(1, 2, 3, 4),
                         labels = c("Very satisfied",
                                    "moderately satisfied",
                                    "A little dissatisfied",
                                    "Very dissatisfied"))

# note that you dont need to have the levels if you have factored using the import wizard, you might still have to add the labels


#############################################
#
#         Create a new variable
#
#############################################
GSS2012$pcincome = GSS2012$fincome/GSS2012$hompop

#############################################
#
#         descriptive statistics
#
#############################################
summary(GSS2012)

#############################################
#
#      distribution of family income
#
#############################################
hist(GSS2012$fincome, prob = TRUE)
lines(density(GSS2012$fincome, na.rm = TRUE), col="blue")
boxplot(GSS2012$fincome)

#############################################
#
#   boxplots for exploring relationships
#
#############################################

## happiness ~ income
boxplot(GSS2012$fincome ~ GSS2012$happy, main= "Income of all ages vs. Happiness")

## income ~ race
boxplot(GSS2012$fincome ~ GSS2012$race, main= "Income of all ages vs. Race")

#############################################
#
#   Subset Data
#
#############################################

GSS2012Middle = subset(GSS2012, GSS2012$age >= 30 & GSS2012$age < 50)
# this command performs the same task
#GSS2012Middle1 = GSS2012[GSS2012$age >= 30 & GSS2012$age < 50 &!is.na(GSS2012$age), ]

#an alternative could be using dplyr. Make sure you install and load the package first code with dplyr is simpler and is below:

#GSS2012_Subset = filter(GSS2012, age >=30 & age <50)


## happiness ~ income
boxplot(GSS2012Middle$fincome ~ GSS2012Middle$happy, main = "Income 30-50 age group vs. Happiness")

## income ~ race
boxplot(GSS2012Middle$fincome ~ GSS2012Middle$race, main = "Income 30-50 age group vs. Race")

