##############################

##### working directory  #####

##############################
getwd()
setwd('/media/sf_vm_shared_folder/S-SB-Day1n2/R')
getwd()

##########################
# BASIC CHARTING USING R #
##########################

## count frequency for each category
counts_cyl = table(mtcars$cyl)
counts_cyl

## plot basic bar chart
barplot(counts_cyl)

## plot a simple histogram
hist(mtcars$mpg)


## plot histogram with specified bins
hist(mtcars$mpg, breaks=12, xlab="Miles Per Gallon", main="Histogram with 12 Bins")


boxplot(mtcars$mpg, main = "Boxplot of Miles/Gallon")

boxplot(mtcars$mpg~factor(mtcars$vs), main = "Boxplot of Miles/Gallon for Different Engine Types")


## basic scatter plot of MPG vs. Weight
plot(mtcars$wt, mtcars$mpg, main="Simple Scatter Plot of MPG vs. Weight", xlab="Car Weight (lbs/1000)", ylab="Miles Per Gallon")


## add a line to fit the data
abline(lm(mpg~wt, data = mtcars))

