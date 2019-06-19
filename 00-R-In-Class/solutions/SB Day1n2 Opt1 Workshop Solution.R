###########################################################
# Workshop 1.6 solution
###########################################################

# a. Create four vectors: Film, Studio, TopGross, OpenQuarter.
Film = c('The Last Jedi',
         'Beauty and the Beast',
         'Wonder Woman',
         'Jumanji',
         'Guardians of the Galaxy',
         'Spider-Man',
         'It',
         'Thor: Ragnarok',
         'Despicable Me 3',
         'Justice League',
         'Logan',
         'The Fate of the Furious',
         'Coco',
         'Dunkirk',
         'Get Out')

Studio = c('Disney',
           'Disney',
           'Warner',
           'Sony',
           'Disney',
           'Sony',
           'Warner',
           'Disney',
           'Universal',
           'Warner',
           'Fox',
           'Universal',
           'Disney',
           'Warner',
           'Universal')

TopGross = c(620,
             504,
             413,
             405,
             390,
             334,
             328,
             315,
             265,
             229,
             226,
             226,
             210,
             188,
             176)

OpenQuarter = c(4,
                1,
                2,
                4,
                2,
                3,
                3,
                4,
                2,
                4,
                1,
                2,
                4,
                3,
                1)

# b. Create a dataframe TopMovies; strings should not be encoded as factor.
TopMovies = data.frame(Film,Studio,TopGross,OpenQuarter,
                       stringsAsFactors = FALSE)

# c. Encode Studio as factor.
TopMovies$Studio = factor(TopMovies$Studio)

# d. In R, categorical variables are usually represented by factors. Encode 1,2,3,4 in OpenQuarter as factors ‘1st’, ‘2nd', ‘3rd', ‘4th'.
TopMovies$OpenQuarter = factor(TopMovies$OpenQuarter,
                               levels = c(1,2,3,4),
                               labels = c('1st','2nd','3rd','4th'))

# e. Use R command to find out how many Disney movies were there in the top 15 grossing.
sum(TopMovies$Studio == 'Disney')

# f. Use R command to find out how many Disney movies were there in the top 10 grossing.
sum(TopMovies$Studio[1:10] == 'Disney')

# g. How much Disney has earned from the movies in the top 15 grossing?
sum(TopMovies$TopGross[TopMovies$Studio == 'Disney'])

# h. How much Disney has earned from the movies in the top 10 grossing?
Top10 = TopMovies[1:10,]
sum(Top10$TopGross[Top10$Studio == 'Disney'])
# Question: Why below command is incorrect?
# sum(TopMovies$TopGross[TopMovies$Studio[1:10] == 'Disney'])

# i. How much Disney has earned from the movies in the top 5 grossing?
Top5 = TopMovies[1:5,]
sum(Top5$TopGross[Top5$Studio == 'Disney'])

# j. Use R command to find out how many Warner movies were there in the top 15 grossing.
sum(TopMovies$Studio == 'Warner')

# k. Use R command to find out how many Warner movies were there in the top 10 grossing.
sum(TopMovies$Studio[1:10] == 'Warner')

# l. How much Warner has earned from the movies in the top 15 grossing?
sum(TopMovies$TopGross[TopMovies$Studio == 'Warner'])

# m. How much Warner has earned from the movies in the top 10 grossing?
sum(Top10$TopGross[Top10$Studio == 'Warner'])

# n. How much Warner has earned from the movies in the top 5 grossing?
sum(Top5$TopGross[Top5$Studio == 'Warner'])

# o. Plot a graph that illustrates the number of movies made by each studio in the top 15 grossing list
barplot(table(TopMovies$Studio))

# p. Plot a graph that illustrates the number of movies made by each studio in the top 10 grossing list
barplot(table(Top10$Studio))


# q. Plot a graph that illustrates the total revenue each studio has earned from the movies in the top 15 grossing
Total15 = aggregate(TopMovies$TopGross, by=list(Studio=TopMovies$Studio), FUN=sum)
barplot(Total15$x, names.arg = Total15$Studio)

# r. Plot a graph that illustrates the total revenue each studio has earned from the movies the top 10 grossing
Total10 = aggregate(Top10$TopGross, by=list(Studio=Top10$Studio), FUN=sum)
barplot(Total10$x, names.arg = Total10$Studio)

# s. Plot a graph that illustrates the total revenue each studio has earned from the movies in the top 15 grossing (Using ggplot)
library(ggplot2)
ggplot(Total15, aes(x=Studio, y=x)) + geom_bar(stat='identity')
# or
ggplot(Total15, aes(x=Studio,y=x)) + geom_point()

# t. Assume you want to know which quarter in a year is the best time to launch a movie. Plot a graph to illustrate the mean revenue received in each quarter (Using ggplot)
QuarterMean = aggregate(TopMovies$TopGross, by=list(Quarter=TopMovies$OpenQuarter), FUN=mean)
ggplot(QuarterMean, aes(x=Quarter,y=x)) + geom_bar(stat='identity')
# or
ggplot(QuarterMean, aes(x=Quarter,y=x)) + geom_point()


###########################################################
# Workshop 2.6 solution
###########################################################

# a. Read in the data from the csv file.
study = read.csv("DryEye.csv")

# b. Use ggplot to draw boxplot on the conjunctival redness before herb treatment.
library(ggplot2)
ggplot(study, aes("", notreat)) + geom_boxplot()

# c. Use ggplot to draw boxplot on the conjunctival redness after herb treatment.
# library(ggplot2)
ggplot(study, aes("", herb)) + geom_boxplot()


#  two boxplots in one
par(mfrow=c(1, 2))
boxplot(x = study$notreat, ylim=c(0, 3), xlab='notreat')
boxplot(x = study$herb, ylim=c(0, 3), xlab='herb')
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
DiDi_hist(study, "notreat", "herb")


# d. Check the normality of the notreat sample.
shapiro.test(study$notreat)

# e. Check the normality of the herb sample.
shapiro.test(study$herb)

# f. Check the normality of the difference between notreat and herb sample.
diff = study$notreat - study$herb
shapiro.test(diff)

# g. Perform the correct t-test to determine if there was a significant change in conjunctival redness after herb treatment
t.test(study$notreat, study$herb, paired=TRUE)
# or
t.test(diff)


# nity-gretty of t test and condifence interval
boxplot(diff)
hist(diff)
# Standard Error:
sd(diff)/sqrt(length(diff))
#t distribution quantile for two.sided 95% condifence interval, 49 degree of freedom:
qt(p=0.975, df = length(diff)-1)
#  95% condifence interval:
print("lower limit:")
mean(diff) - qt(p=0.975, df = length(diff)-1) * sd(diff)/sqrt(length(diff)) 
print("upper limit:")
mean(diff) + qt(p=0.975, df = length(diff)-1) * sd(diff)/sqrt(length(diff))
