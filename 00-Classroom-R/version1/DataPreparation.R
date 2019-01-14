##############################
###### DATA PREPARATION  #####
##############################

##############################
# Author: GU Zhan (Sam)
# https://github.com/telescopeuser/S-SB-Workshop
##############################

##############################
# Update R Working Directory
##############################
setwd("H:/TelescopeUser/Downloads/R") 
setwd("H:\\TelescopeUser\\Downloads\\R")
getwd()

##############################
# [slide] Vectors
# Create a vector with the c() function.
##############################

# create a numeric vector
age = c(32, 45, 25, 39, 99)

# create a character vector
country = c("US", "US", "UK", "UK", "UK")

##############################
#Extract values in a vector using square brackets []
##############################

# extract the 1st element of vector age
# indices in R start at 1, not at 0
age[1]

# extract the 1st, 3nd, & 5th elements
age[c(1,3,5)]

# extract the 2nd to the 4th elements
country[2:4]


##############################
# Exercise:
##############################

# Retrieve the 1st and 5th elements of the vector country.
country[c(1,5)]


##############################
# [slide] Operators
##############################

# Element-wise addition Most operators work element-wise,
# i.e. they operate on each element.
x = c(2, 1, 3)
2 + x
x > 1

# When two vectors have different lengths,
# the elements of the shorter vector may be recycled.
# Typically a Warning is issued when this happens.
x + c(1, 2)



##############################
# [slide] Matrices
# Matrix is a two-dimensional data structure
# A matrix is a 2D array.
##############################

# create using matrix () function
matrix(1:9, nrow = 3, ncol = 3)

# same result is obtained by providing only one dimension
matrix(1:9, nrow = 3)

# Operators on matrixes work element wise.
x = matrix(1:9, nrow = 3, ncol = 3)

# assigning a matrix to the variable x
x + 1
y = x + 2
x + y


##############################
# [slide] Lists
# A vector contains similar data,
# but a list contains mixed data.
##############################

# assigning a list to the variable x 
x = list("a" = 2.5, "b" = TRUE, "c" = 1:3) 

x 
x$a 
x[1] 
x$b 
x$c 
y = x + 1 # why does this give an error? 
length(x)


##############################
# [slide] Data Frames
# A data frame is a special case of a list,
# where each component is a set of the same length
##############################

# Create a data frame with the data.frame() function:
# create a vector for each column
manager = c(1,2,3,4,5)
country = c("US", "US", "UK", "UK", "UK")
gender = c("M", "F", "F", "M", "F")
age = c(32, 45, 25, 39, 99)
q1 = c(5, 3, 3, 3, 2)
q2 = c(4, 5, 5, 3, 2)
q3 = c(5, 2, 5, 4, 1)
q4 = c(5, 5, 5, NA, 2)
q5 = c(5, 5, 2, NA, 1)

# create a data frame by combining all the column vectors
leadership = data.frame(manager, country, gender, age, 
                        q1, q2, q3, q4, q5)

# Access Rows
leadership[2:4,] # access rows 2-4

# Access Columns
leadership[,2:4] # access columns 2-4
leadership[,c('country', 'gender', 'age')] # same
leadership$age # extract the variable age
leadership$age[2] # 2nd element of the variable age


##############################
# Exercise:
##############################

# For manager ID = 5
# extract manager ID and the corresponding rating
# of the five statements.
leadership[5,5:9]

# Extract the variable gender
leadership[5, 3]
# or
leadership[leadership$manager==5, "gender"]

# Extract the variable gender & age
leadership[leadership$manager==5, c("gender", "age")]


##############################
# [slide] Factors
# Factor is a special data type in R for 
# categorical variables, e.g. gender.
##############################

#Use function factor() to encode a vector as a factor
# create a data frame without conversion
leadership = data.frame(manager, country, gender, age, 
                        q1, q2, q3, q4, q5, 
                        stringsAsFactors=FALSE)

# check the gender variable again
leadership$gender

# encode the gender vector as factor
leadership$gender = factor(leadership$gender)

# encode the country vector as factor
leadership$country = factor(leadership$country)


##############################
# [slide] Importing Data to R
##############################

# copy text data file to your working directory
# import data from a space-delimited text file
leadershipTXT = read.table("leadership.txt", 
                           header=TRUE,
                           sep=' ', 
                           stringsAsFactors=FALSE)

# copy csv data file to your working directory
# import data from a comma-delimited file
leadershipCSV = read.table("leadership.csv", 
                           header=TRUE, 
                           sep=',', 
                           stringsAsFactors=FALSE)


##############################
# [slide] Exporting Data from R
##############################

# Save/export a dataset to a comma-delimited file
# in the current working directory
write.table(leadershipCSV,'leadershipcsv.txt', 
            sep=",")
# or
write.table(leadershipCSV,'leadershipcsv.csv', 
            sep=",", row.names=FALSE)
# or
write.csv(leadershipCSV,'leadershipcsv.csv', 
          row.names=FALSE)

# Save/export dataframe into Rdata file:
save(leadership, file='leadership.Rda')

# To import the Rdata into workspace:
load('leadership.Rda')


##############################
# Exercise: Data Cleaning
##############################

# Re-code 99 for age to missing
# if the element in the age column equals to 99
# this element will be changed to NA
leadership$age[leadership$age==99] = NA

# Re-code the age variable to a categorical variable
leadership$agecat[leadership$age<=55] = "Young"
leadership$agecat[leadership$age>55 & leadership$age<=75] = "Middle Aged"
leadership$agecat[leadership$age>75] = "Elder"

# identify missing values
is.na(leadership)

# exclude missing values in calculation
mean(leadership$q4, na.rm=TRUE)

# remove observations with missing values
leadershipNoMissing = na.omit(leadership)

# create a mean score
leadership$mean =  (leadership$q1
                   +leadership$q2
                   +leadership$q3
                   +leadership$q4
                   +leadership$q5
                   )/5
# or
attach(leadership)
leadership$mean = (q1+q2+q3+q4+q5)/5
detach(leadership)

# select observations in UK only, 
# and extract/subset the variables q1 through q5
?subset
leadershipSubset = subset(leadership,
                          leadership$country=="UK",
                          select=q1:q5)
leadershipSubset

##############################
# THE END 
# https://www.iss.nus.edu.sg/executive-education/course/detail/nicf-statistics-bootcamp/analytics-and-intelligent-systems
##############################
