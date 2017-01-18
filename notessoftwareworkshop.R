download.file("https://raw.githubusercontent.com/swcarpentry/r-novice-gapminder/gh-pages/_episodes_rmd/data/gapminder-FiveYearData.csv", destfile = "gapminder-FiveYearData.csv")
gapminder <- read.csv("gapminder-FiveYearData.csv")

#funcions for a first time data file
#head
#str
#colnames
#summary
#nrow
#ncol
#dim
#View
#gapminder[row,col] with square brackets, $ also picks a column
#c gives something a vector (string to pull from)

#African countries' life expectancies for 2007
  #step 1: get 2007 data
is_2007 <- gapminder$year == 2007
  #step 2: get Africa data
is_africa <- gapminder$continent == "Africa"
  #step 3: pull 2007 and Africa from gapminder
africa_2007 <- gapminder[is_2007 & is_africa, c("country", "lifeExp")]

#to sort/order by a column, first you can make a vector and use that to pull the rows
o <- order(africa_2007$lifeExp)
africa_2007[o,]

#to make a plot, geom_point is required to have dots
#can also use geom_line
#can group using by = country 
#can use size = gdpPercap #this increases the line size based on size
ggplot(data = gapminder, aes(x = year, y = lifeExp, color = year)) + geom_point()

#can have both lines and points
ggplot(data = gapminder, aes(x = year, y = lifeExp, color = year)) + geom_point() + geom_line()

#can have individual aesthetics
ggplot(data = gapminder, aes(x = year, y = lifeExp, color = year)) + geom_point(aes(size=gdpPercap)) + geom_line()

#can also add individual aethetics without using aes
ggplot(data = gapminder, aes(x = year, y = lifeExp, color = year)) + geom_point(aes(size=gdpPercap)) + geom_line(color = "black")

