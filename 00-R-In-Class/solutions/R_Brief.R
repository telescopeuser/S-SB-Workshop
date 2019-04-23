################################################
# Statistics Bootcamp
# https://bit.ly/iss-sb
################################################

################################################
# 1.2 Introduction to R
################################################

7+77
3.1416*(3)^2
-1 > 2
13 + 17 == 30

x <- 7
y = 27
x
y/3
a = 'Learning statistics'
B <- 'Learning R'

z = 11
z = z + 1
z
z / 2
z + (5-3)
z %% 3

help(sum)
?sum
?sqrt
example(sum)


################################################
# 1.3 Data Processing Basics
################################################

# Create a numeric vector
Bill =c(105, 111, 103, 122, 107, 119)

# Create a character vector
Telco = c('Singtel', 'Starhub', 'M1', 'MyRepublic')

# Tip: R index starts from 1, not 0
Bill[2]
Bill[c(1,3)]
Telco[2:4]

# Try to identify differences between below two vectors:
NDay = c(9, 'Aug', 1965)
NDay = c('D'=9,'M'='Aug','Y'= 1965)

# Create a numeric vector to store workshop marks
Marks = c(52, 37, 41, 32, 31)

# Operations on 'Marks' and store it on 'MarksAdj'
MarksAdj = Marks + 20
MarksAdj
MarksAdj > 60

# Create a matrix
matrix(1:9, nrow=3, ncol=3)
# Can only specify one dimension
matrix(c(2, 5, 7, 4), nrow=2)

mx = matrix(1:9, nrow=3)
my = mx + 1
mx + my

# Not encouraged - data type coerced to string
NDay = c(9, 'Aug', 1965)
NDay
NDay[1]
# Use list for mixed data types
NDay=list('D'=9,'M'='Aug','Y'= 1965)
class(NDay)
NDay
NDay[1]
# Using a $ followed by label
NDay$M
length(NDay)

# Create the vectors
month = c('Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul')
record = c('read', 'est', 'read', 'est', 'read', 'est')
electricity = c(47, 49, 70, NA, 78, 71)
water = c(18, 17, 14, NA, 15, 14)
gas = c(21, 21, 24, NA, 27, 19)
# Combine all the vectors into a data frame
PUB = data.frame(month, record, electricity, water, gas,  stringsAsFactors=FALSE)

# Check PUB’s record vector
PUB$record
# Encode ‘record’ as a factor
PUB$record = factor(PUB$record)
PUB$record

# Check water vector
PUB$water
# Recode water usage (based on price) into category
PUB$water_use[PUB$water>=15] = 'high'
PUB
PUB$water_use[PUB$water<15] = 'low'
PUB

# Calculate the mean without handling missing values
mean(PUB$gas)
# Calculate the mean with NA removed
mean(PUB$gas, na.rm=TRUE)
# Remove rows where NA presents
PUB_NoNA = na.omit(PUB)
PUB_NoNA

# Calculate the total PUB price
attach(PUB)
PUB$total = electricity+water+gas
detach(PUB)
PUB

# Create a subset
electricity_read = subset(PUB,PUB$record=='read',select=c('electricity'))
electricity_read

# Write data frame ‘PUB’ into ‘PUB.csv’
write.table(PUB, 'PUB.csv', sep=',', row.names = FALSE)

# Save data frame ‘PUB’ into rdata file
save(PUB, file='PUB.Rda')

# To load the rdata file, just use:
load('PUB.Rda')

nPUB = read.table('PUB.csv', header=TRUE, sep=',')
nPUB


################################################
# 1.5 Basic charting using R
################################################

mtcars
str(mtcars)

# Check the cyl vector
mtcars$cyl

# Count the frequency for each value
table(mtcars$cyl)

# Create the barplot
barplot(c(11, 7, 14))
barplot(c('four'=11, 'six'=7, 'eight'=14))
barplot(c(11,7,14), names.arg=c('four','six','eight'))
# Create the barplot
counts_cyl = table(mtcars$cyl)
barplot(counts_cyl)
barplot(counts_cyl, names.arg=c('four','six','eight'))

# Count the frequency for each value
counts_cyl = table(mtcars$cyl)
pie(counts_cyl)

# Create histogram
hist(mtcars$mpg)

# Create histogram with 12 bins and labels
hist(mtcars$mpg,
     breaks=12,
     xlab="Miles Per Gallon",
     main="Histogram with 12 Bins")

# Create a single boxplot
boxplot(mtcars$mpg,
        main="Miles/Gallon")

# Create box plots break by to engine types
boxplot(mtcars$mpg~factor(mtcars$vs),
        xlab="Engine Types",
        ylab="Miles per Galon",
        main="Miles/Galon for different engine types")

# Check the cyl vector
plot(mtcars$wt, mtcars$mpg,
     main="MPG vs. Weight",
     xlab="Car Weight (lbs/1000)",
     ylab="Miles Per Gallon")

# Add a line to fit the data
abline(lm(mpg ~ wt, data = mtcars))

# More examples
example(barplot)
example(pie)
example(hist)
example(boxplot)
example(plot)
?barplot
?pie
?hist
?boxplot
?plot

?par
?graphics

# pyramid pie
pie(c("Sky" = 78, 
      "Sunny side of pyramid" = 17, 
      "Shady side of pyramid" = 5), 
    init.angle = 315, 
    col = c("deepskyblue", "yellow", "yellow3"), 
    border = FALSE)

################################################
# 2.1 Charting using ggplot2
################################################

t = read.csv('titanic3.csv', stringsAsFactors=FALSE)
# t = na.omit(t) # Remove rows where NA presents
t$pclass = factor(t$pclass)
t$survived = factor(t$survived)
t$gender = factor(t$sex)
# install.packages(“ggplot2”)   # Do this if the package was not installed
library(ggplot2)

# Create bar chart using R graphics
barplot(table(t$pclass))
# Create bar chart using ggplot2
ggplot(t, aes(x=pclass)) + geom_bar()
# 
ggplot(t, aes(x=pclass, color=gender, fill = gender)) + 
  geom_bar() + theme_bw() + theme(legend.position="top")
# 
ggplot(t, aes(x=pclass, color=gender, fill = gender)) + 
  geom_bar(position="dodge") + theme_bw() + theme(legend.position="top")

# Create box plot using R graphics
boxplot(t$age ~ t$gender)
# Create box plot using ggplot2
ggplot(t, aes(x=gender, y=age)) + geom_boxplot()
# 
ggplot(t, aes(x=pclass, y=age, fill = gender)) + 
  geom_boxplot() + theme_bw() + theme(legend.position="top")
#
ggplot(t, aes(x=pclass, y=age, fill = gender)) + 
  geom_boxplot(outlier.colour = "dark orange", outlier.shape = 4, notch = T) +
  coord_flip() + theme_bw() + ggtitle("Boxplot to plot Age vs Pessenger Class")

# Create histogram using R graphics
hist(t$age, breaks=10)
# Create histogram using ggplot2
ggplot(t, aes(x=age)) + 
  geom_histogram(binwidth = 10)
# 
ggplot(t, aes(x=age, color=gender, fill = gender)) +
  geom_histogram(binwidth = 10) +
  theme_bw() + theme(legend.position="top")
# 
ggplot(t, aes(x=age, color=gender, fill = gender)) +
  geom_histogram(binwidth = 10, position="dodge")+
  theme_bw() + theme(legend.position="top")

# Display caption using R graphics
hist(t$age,
     breaks=10,
     xlab="Age group",
     ylab="Number of passengers",
     main="Age distribution")
# Display caption using ggplot2
age_hist = ggplot(t, aes(x=age)) + 
  geom_histogram(binwidth = 10)
captions = labs(x="Age Group",
                y="Number of passengers",
                title="Age distribution")
age_hist + captions # layers of graphics

# Create stacked barplot using ggplot2
ggplot(t, aes(x=gender, fill=survived)) + geom_bar()

# Create stacked barplot using ggplot2
ggplot(t, aes(x=pclass, fill=survived)) + geom_bar()

# More examples in: titanicRcode.R

################################################
# 2.2 Data Summarization
################################################

# create the vector
s4 = c(21, 26, 28, 20)
t.test(s4)

# create the vector
s8 = c(23, 25, 29, 26, 25, 28, 33, 20)
t.test(s8)


################################################
# 2.3 Sampling and Normality
################################################

# Randomly select 20 numbers from 1 to 50
sample(1:50, 20)

# Create a vector called “tech”
tech = c("apple", "hp", "lg", "sony", "haier")

# Randomly select 4 items from the “tech” vector
sample(tech, 4, replace = TRUE)

sample(c('number', 'fish'), 40, replace = TRUE)


# Generate 500 numbers from a normal distribution with
# mean of 50 and standard deviation of 10
y = rnorm(5000, 50, 10)
# histogram
hist(y)
# Create QQ plot
qqnorm(y)
qqline(y)


# Generate 500 numbers from a not normal distribution
z = rchisq(500, df=6)
# histogram
hist(z)
# Create QQ plot
qqnorm(z)
qqline(z)

source("BondFunds_Hist.R")
source("BondFunds_QQPlot.R")


################################################
# 2.4 One sample test
################################################

# ----------------------------------------------
# McDonald’s problem - process improvement
# ----------------------------------------------
McDonalds = read.csv("McDonalds.csv")
# var(McDonalds$Time)
# sd(McDonalds$Time)
# hist(McDonalds$Time)
# library(ggplot2)
# ggplot(McDonalds, aes(Time)) + geom_histogram(binwidth = 10)

# two tailed t-test
t.test(McDonalds$Time, mu=174.22)

# calculation: t = -4.2294
# It resemble difference drgree before and after process change, or
# how extreme the time difference gets away from zero/centre
# how many standard-deviation away from the center of t distribution (+/- two sides)
t_score = (mean(McDonalds$Time) - 174.22 ) / ( sd(McDonalds$Time) / sqrt(length(McDonalds$Time)) )
t_score

# t distribution
curve(dt(x, df=24), from = -5, to = 5, col = "blue", 
      xlab = "t statistic", ylab = "density", lwd = 2)
abline(v=qt( 0.01, df=24), col="blue", lwd=2) # left area under curve:    1% probability
abline(v=qt(0.025, df=24), col="blue", lwd=2) # left area under curve:  2.5% probability
abline(v=qt( 0.05, df=24), col="blue", lwd=2) # left area under curve:    5% probability
abline(v=qt( 0.25, df=24), col="blue", lwd=2) # left area under curve:   25% probability
abline(v=qt(  0.5, df=24), col="blue", lwd=2) # left area under curve:   50% probability
abline(v=qt( 0.75, df=24), col="blue", lwd=2) # left area under curve:   75% probability
abline(v=qt( 0.95, df=24), col="blue", lwd=2) # left area under curve:   95% probability
abline(v=qt(0.975, df=24), col="blue", lwd=2) # left area under curve: 97.5% probability
abline(v=qt( 0.99, df=24), col="blue", lwd=2) # left area under curve:   99% probability
abline(v=t_score, col="dark orange", lwd=2)
abline(v=t_score*-1, col="dark orange", lwd=2)

# probability of obtaining a result (time difference) more extreme (smaller or greater) 
# than the current observed situation/difference, when we assume H_0 no difference.
pt(t_score, df=24) * 2 # p value

1 - pt(t_score, df=24) * 2 # 1 - p (What does this value mean?)

# How to calculate 99.97053516% CI?  (notice that 99.97053516% = 1 - p )
# 100% - 99.97053516% = 0.0002946484 (extreme area at two sides)
# 0.0002946484 / 2 = 0.0001473242 (extreme area at one side)
# 0.9997053516 + 0.0001473242 = 0.9998526758

# calculate the qualtile: t score
qt(0.9998526758, df=24) # qt(pt(t_score * -1, df=24), df=24)
# upper limit: mean(McDonalds$Time) + qt(p, df=24) *  ( sd(McDonalds$Time) / sqrt(length(McDonalds$Time)) )
mean(McDonalds$Time) + qt(0.9998526758, df=24) * ( sd(McDonalds$Time) / sqrt(length(McDonalds$Time)) )
# lower limit: mean(McDonalds$Time) - qt(p, df=24) *  ( sd(McDonalds$Time) / sqrt(length(McDonalds$Time)) )
mean(McDonalds$Time) - qt(0.9998526758, df=24) * ( sd(McDonalds$Time) / sqrt(length(McDonalds$Time)) )

# two tailed - visualization
boxplot(x = McDonalds$Time, horizontal = TRUE, 
        main = "McDonald's Service Time",
        xlab = "Service Time (seconds)",
        ylab = "After Change")
abline(v=mean(McDonalds$Time), col="blue", lwd=4)  # after  process change
# 99.98526758% CI
abline(v=mean(McDonalds$Time) + qt(0.9998526758, df=24) * ( sd(McDonalds$Time) / sqrt(length(McDonalds$Time)) ), col="Blue", lwd=4, lty=2)
abline(v=mean(McDonalds$Time) - qt(0.9998526758, df=24) * ( sd(McDonalds$Time) / sqrt(length(McDonalds$Time)) ), col="Blue", lwd=4, lty=2)
abline(v=mean(174.22), col="dark orange", lwd=2, lty=3)           # before process change

# How to calculate 95% CI?

# two tailed
qt(0.975, df=24)
# upper limit: mean(McDonalds$Time) + qt(0.975, df=24) *  ( sd(McDonalds$Time) / sqrt(length(McDonalds$Time)) )
mean(McDonalds$Time) + qt(0.975, df=24) * ( sd(McDonalds$Time) / sqrt(length(McDonalds$Time)) )
# lower limit: mean(McDonalds$Time) - qt(0.975, df=24) *  ( sd(McDonalds$Time) / sqrt(length(McDonalds$Time)) )
mean(McDonalds$Time) - qt(0.975, df=24) * ( sd(McDonalds$Time) / sqrt(length(McDonalds$Time)) )

# two tailed - visualization
boxplot(x = McDonalds$Time, horizontal = TRUE, 
        main = "McDonald's Service Time",
        xlab = "Service Time (seconds)",
        ylab = "After Change")
abline(v=mean(McDonalds$Time), col="blue", lwd=4)  # after  process change
# 95% CI
abline(v=mean(McDonalds$Time) + qt(0.975, df=24) * ( sd(McDonalds$Time) / sqrt(length(McDonalds$Time)) ), col="Blue", lwd=4, lty=2)
abline(v=mean(McDonalds$Time) - qt(0.975, df=24) * ( sd(McDonalds$Time) / sqrt(length(McDonalds$Time)) ), col="Blue", lwd=4, lty=2)
abline(v=mean(174.22), col="dark orange", lwd=2, lty=3)           # before process change

# one tailed t-test
t.test(McDonalds$Time, alternative="less", mu=174.22)

# calculation: t = -4.2294
# It resemble difference drgree before and after process change, or
# how extreme the time difference gets away from zero/centre
# how many standard-deviation away from the center of t distribution (+/- two sides)
t_score = (mean(McDonalds$Time) - 174.22 ) / ( sd(McDonalds$Time) / sqrt(length(McDonalds$Time)) )
t_score

# t distribution
curve(dt(x, df=24), from = -5, to = 5, col = "blue", 
      xlab = "t statistic", ylab = "density", lwd = 2)

abline(v=qt(0.025, df=24), col="blue", lwd=2) # left area under curve:  2.5% probability
abline(v=qt( 0.05, df=24), col="blue", lwd=2) # left area under curve:    5% probability
abline(v=qt(  0.5, df=24), col="blue", lwd=2) # left area under curve:   50% probability
abline(v=qt( 0.95, df=24), col="blue", lwd=2) # left area under curve:   95% probability
abline(v=qt(0.975, df=24), col="blue", lwd=2) # left area under curve: 97.5% probability
abline(v=t_score, col="dark orange", lwd=2)

# probability of obtaining a result (time difference) more extreme (smaller) 
# than the current observed situation/difference, when we assume H_0 no difference.
# 𝐻_1:𝜇<174.22  half the probability of two sided extreme 𝐻_1:𝜇≠174.22
pt(t_score, df=24)

# How to calculate 95% CI?

# one tailed
# upper limit: mean(McDonalds$Time) + qt(0.95, df=24) *  ( sd(McDonalds$Time) / sqrt(length(McDonalds$Time)) )
mean(McDonalds$Time) + qt(0.95, df=24) * ( sd(McDonalds$Time) / sqrt(length(McDonalds$Time)) )
# lower limit: -Inf

# one tailed - visualization
boxplot(x = McDonalds$Time, horizontal = TRUE, 
        main = "McDonald's Service Time",
        xlab = "Service Time (seconds)",
        ylab = "After Change")
abline(v=mean(McDonalds$Time), col="blue", lwd=4)  # after  process change
# 95% CI
abline(v=mean(McDonalds$Time) + qt(0.95, df=24) * ( sd(McDonalds$Time) / sqrt(length(McDonalds$Time)) ), col="Blue", lwd=4, lty=2)
abline(v=174.22, col="dark orange", lwd=2, lty=3)           # before process change

# ----------------------------------------------
# Estimate the population proportion
# ----------------------------------------------
# Read the csv file
mshop = read.csv("MShopping.csv")
# Check the items
table(mshop)
prop.test(325, n=465)

# Gender bias?
# year 2017 vs. 50%
prop.test(x = 20408, n=39615)
prop.test(x = 20408, n=39615, alternative = "greater")
# year 2017 vs. 1984
boys  = c(20408, 21661)
total = c(39615, 41555)
prop.test(boys, total)
prop.test(boys, total, alternative="less")

################################################
# 2.5 Two group comparison
################################################

# Read the csv
Cola = read.csv("Cola.csv")

### Draw figures in a m-row x n-column grid
par(mfrow=c(1, 2))
# 1st hist
hist(Cola$EndAisle, prob=T, breaks = 10, xlim = c(10, 110))
lines(density(Cola$EndAisle), col="blue")
curve(dnorm(x, mean(Cola$EndAisle), sd(Cola$EndAisle)),
      add=TRUE, col="dark orange", lwd=2)
# 2nd hist
hist(Cola$MidAisle, prob=T, breaks = 5, xlim = c(10, 110))
lines(density(Cola$MidAisle), col="blue")
curve(dnorm(x, mean(Cola$MidAisle), sd(Cola$MidAisle)),
      add=TRUE, col="dark orange", lwd=2)


par(mfrow=c(1, 1))
boxplot(Cola)

# Test the normality of the end-aisle sample data
shapiro.test(Cola$EndAisle)
# Test the normality of the mid-aisle sample data
shapiro.test(Cola$MidAisle)

#  Bespoke histogram visualization funciton
DiDi_hist <- function(df, col1, col2) {
  require(ggplot2)
  DiDi_df1 = subset.data.frame(df, select = col1) # df$col1
  DiDi_df2 = subset.data.frame(df, select = col2) # df$col2
  colnames(DiDi_df1) <- "value"
  colnames(DiDi_df2) <- "value"
  DiDi_df1$split <- col1 # df$col1
  DiDi_df2$split <- col2 # df$col2
  DiDi_df <- rbind(DiDi_df1, DiDi_df2) 
  ggplot(DiDi_df, aes(value, fill = split)) + geom_density(alpha = 0.2)
}

DiDi_hist(Cola, "MidAisle", "EndAisle")

# Perform the variance check
var.test(Cola$EndAisle, Cola$MidAisle)

# Perform the t test
t.test(Cola$EndAisle, Cola$MidAisle, var.equal=TRUE)
# t.test(Cola$EndAisle, Cola$MidAisle, var.equal=FALSE)
t.test(Cola$EndAisle, Cola$MidAisle, var.equal=TRUE, alternative="greater")
t.test(Cola$EndAisle, Cola$MidAisle, var.equal=TRUE, alternative="less")


# Perform the paired t test
t.test(Cola$EndAisle, Cola$MidAisle, var.equal=TRUE, paired=TRUE)
# same as one sample t test of the difference:
# t.test(Cola$EndAisle - Cola$MidAisle, var.equal=TRUE)

boxplot(Cola)
# Plot paired data
install.packages("PairedData")
library(PairedData)
MidAisle <- Cola$MidAisle
EndAisle <- Cola$EndAisle
pd <- paired(MidAisle, EndAisle)
plot(pd, type = "profile") + theme_bw()


# Read the csv
PERatio = read.csv("PERatio.csv")
# Get the difference between matched values
Df = PERatio$Year2 - PERatio$Year1
# difference distribution
par(mfrow=c(1, 1))
hist(Df, prob=T, breaks = 10)
lines(density(Df), col="blue")
curve(dnorm(x, mean(Df), sd(Df)),
      add=TRUE, col="dark orange", lwd=2)
# Test the normality
shapiro.test(Df)
# 
DiDi_hist(PERatio, "Year1", "Year2")
# Perform the paired t test
t.test(PERatio$Year2, PERatio$Year1, paired=TRUE)

# The numbers of students that passed the test under both coaches
passed = c(17, 57)
# The total numbers of students under both coaches
total = c(25, 72)
# Perform the test
prop.test(passed, total, alternative="less")
prop.test(passed, total)


################################################
# "The end"... is called a "New start".
################################################
