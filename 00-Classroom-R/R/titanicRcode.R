##############################

##### working directory  #####

##############################
getwd()
setwd('/media/sf_vm_shared_folder/S-SB-Day1n2/R')
getwd()


##############################

######   T I T A N I C   #####

##############################


##############################
###### BASIC STEPS BEGIN #####

t = read.csv('titanic3.csv')

#in the above code, make sure you have the path name right

t
attach(t)
summary(t)

t$pclass = factor(t$pclass)
t$survived = factor(t$survived)
t$gender = factor(t$sex)

summary(t)
#you could also use str(t)

library(ggplot2)

###### BASIC STEPS END #####
############################




#########################################
## EXPLORE DATA USING BAR CHARTS BEGIN ##

ggplot(t, aes(x=survived)) + geom_bar()
ggplot(t, aes(x=age)) + geom_bar()
ggplot(t, aes(x=gender)) + geom_bar()
ggplot(t, aes(x=pclass)) + geom_bar()
ageHistogram = ggplot(t, aes(x=age)) + geom_histogram()
ageHistogram
survivedBar = ggplot(t, aes(x=survived)) + geom_bar()
survivedLabels = labs(x= "survival", y= "Number of Passengers", title = "Survival Rate", subtitle = "On the titanic")
survivedBar + survivedLabels

ggplot(t, aes(x=age)) + geom_histogram(binwidth = 20)
ggplot(t, aes(x=age)) + geom_histogram(binwidth = 10)
ggplot(t, aes(x=age)) + geom_histogram(binwidth = 30)

#reusable age histogram Object
ageHistogram5 = ggplot(t, aes(x=age)) + geom_histogram(binwidth = 5)
ageHistogram5

#resuable gender Bar Object
genderBar = ggplot(t, aes(x=gender)) + geom_bar()
genderBar

#resuable gender Bar Object
classBar = ggplot(t, aes(x=pclass)) + geom_bar()
classBar

#Reusable Basic Title Object
basicTitle = labs(title = "Titanic Basic Analysis")


#adding reusable objects
survivedBar + basicTitle
ageHistogram5 + basicTitle
genderBar + basicTitle
classBar + basicTitle



## EXPLORE DATA USING BAR CHARTS END ####
#########################################



####################################################
## USE BOXPLOTS TO UNDERSTAND DISTRIBUTIONS BEGIN ##

ggplot(t, aes(gender,age)) + geom_boxplot()
ggplot(t, aes(pclass,age)) + geom_boxplot()

## USE BOXPLOTS TO UNDERSTAND DISTRIBUTIONS END ####
####################################################




######################################################
## SURVIVAL RATE ACROSS AGE, CLASS AND GENDER BEGIN ##

# Reusable gender stacked bar object
genderSurvivalBar = ggplot(t, aes(x=gender, fill= survived)) + geom_bar()
genderSurvivalBar

# Reusable age stacked bar object
ageSurvivalHistogram15 = ggplot(t, aes(x=age, fill= survived)) + geom_histogram(binwidth = 15)
ageSurvivalHistogram15

# Reusable class stacked bar object
classSurvivalBar = ggplot(t, aes(x=pclass, fill= survived)) + geom_bar()
classSurvivalBar

#Reusable Survival Rate Title Object
survivalRateTitle = labs(title = "Titanic Survival Rates")


#chaining reusable objects
genderSurvivalBar + survivalRateTitle
ageSurvivalHistogram15 + survivalRateTitle
classSurvivalBar + survivalRateTitle


## SURVIVAL RATE ACROSS AGE, CLASS AND GENDER END ####
######################################################



#######################################################
## FACETING TO COMBINE ALL DATA INTO ONE CHART BEGIN ##


ageSurvivalHistogram15+ facet_grid(gender~pclass)


facetChart = ageSurvivalHistogram15+ facet_grid(gender~pclass)+ labs(title="Titanic Survival Rates across categories") 

facetChart

facetChart + theme_bw()
facetChart + theme_dark()
facetChart + theme_classic()
facetChart + theme_gray()


## FACETING TO COMBINE ALL DATA INTO ONE CHART END ####
#######################################################

detach(t)
