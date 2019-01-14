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

TopMovies = data.frame(Film,Studio,TopGross,OpenQuarter,
                       stringsAsFactors = FALSE)

TopMovies$Studio = factor(TopMovies$Studio)
TopMovies$OpenQuarter = factor(TopMovies$OpenQuarter,
                               levels = c(1,2,3,4),
                               labels = c('1st','2nd','3rd','4th'))

sum(TopMovies$Studio == 'Disney')
sum(TopMovies$Studio[1:10] == 'Disney')


sum(TopMovies$TopGross[TopMovies$Studio == 'Disney'])

                                      # This is the wrong command for the question 'how much in total
                                      # Disney's movies that were in the top 10 grossing have earned?
                                      #
                                      # Question: Why this command is incorrect?
# sum(TopMovies$TopGross[TopMovies$Studio[1:10] == 'Disney'])


Top10 = TopMovies[1:10,]
sum(Top10$TopGross[Top10$Studio == 'Disney'])

Top5 = TopMovies[1:5,]
sum(Top5$TopGross[Top5$Studio == 'Disney'])



sum(TopMovies$Studio == 'Warner')
sum(TopMovies$Studio[1:10] == 'Warner')


sum(TopMovies$TopGross[TopMovies$Studio == 'Warner'])
sum(Top10$TopGross[Top10$Studio == 'Warner'])
sum(Top5$TopGross[Top5$Studio == 'Warner'])


barplot(table(TopMovies$Studio))
barplot(table(Top10$Studio))


Total15 = aggregate(TopMovies$TopGross, by=list(Studio=TopMovies$Studio),FUN=sum)
barplot(Total15$x,names.arg = Total15$Studio)


Total10 = aggregate(Top10$TopGross, by=list(Studio=Top10$Studio),FUN=sum)
barplot(Total10$x,names.arg = Total10$Studio)

library(ggplot2)
ggplot(Total15,aes(x=Studio,y=x))+geom_bar(stat='identity')

QuarterMean = aggregate(TopMovies$TopGross, by=list(Quarter=TopMovies$OpenQuarter),FUN=mean)
ggplot(QuarterMean,aes(x=Quarter,y=x))+geom_bar(stat='identity')
