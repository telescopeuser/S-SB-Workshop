##############################

##### working directory  #####

##############################
getwd()
setwd('/media/sf_vm_shared_folder/S-SB-Day1n2/R')
getwd()

###############################
# DATA SUMMARISATION WORKSHOP #
###############################

library(ggplot2)
#above is required in case you are using ggplots

restaurant = read.csv("Restaurant.csv")  

attach(restaurant)

names(restaurant)

# five-number summary
summary(restaurant)


# boxplot (in basic R)
b = boxplot(Cost, horizontal = T)


hist(Cost)


boxplot(SummatedRating, horizontal = T)
#horizontal = T or TRUE draws a boaxplot in the horizontal direction

hist(SummatedRating)


# scatter plot of cost versus ratings
plot(Cost, SummatedRating)
abline(lm(SummatedRating ~ Cost), col = "red", lty = 2)

# box plot city vs. suburbs: service
ggplot(restaurant, aes(Location,Service)) + geom_boxplot()


#box plot city vs. suburbs: decor
ggplot(restaurant, aes(Location,Decor)) + geom_boxplot() + labs(title = "City vs. Suburbs: Decor") 

#box plot city vs. suburbs: Food
ggplot(restaurant, aes(Location,Food)) + geom_boxplot() + labs(title = "City vs. Suburbs: Food") 

#box plot city vs. suburbs: Summated Rating
ggplot(restaurant, aes(Location,SummatedRating)) + geom_boxplot() + labs(title = "City vs. Suburbs: Overall Rating")

#box plot city vs. suburbs: Cost
ggplot(restaurant, aes(Location,Cost)) + geom_boxplot() + labs(title = "City vs. Suburbs: Cost")


#fancy formatting
baseplot = ggplot(restaurant, aes(Location,Cost)) + geom_boxplot(fill = "cornsilk3") + ggtitle("City vs. Suburbs: Cost")

Formatting = theme(plot.background = element_rect(fill = "wheat"), panel.background = element_rect(fill = "slategrey"), plot.title = element_text(size = 22), axis.title = element_text(size = 15), panel.grid.major = element_blank(), panel.grid.minor = element_blank())

baseplot + Formatting

detach(restaurant)
