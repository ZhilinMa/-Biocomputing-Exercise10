# Exercise 10 - Carol de Souza Moreira

# Assingment 1

> datascores <- read.table("UWvMSU_1-22-13.txt")
> dataclean <- subset(datascores, select = -c(V1))
> datafclean <- tail(dataclean, -1)
> dfUW <- datafclean [!(datafclean$V2=='MSU'),]
> dfMSU <- datafclean [!(datafclean$V2=='UW'),]
> library(ggplot2)
> table(dfMSU)
> table(dfUW)
> ggplot() + 
  +     geom_line(data=dfMSU, aes(x=V2, y=(table(dfMSU$V3)), color='green') + 
      +     geom_line(data=dfUW, aes(x=V2, y=(table(dfUW$V3)), color='red') +
                                      +                   geom_point()
                      
# Assingment 2

> readinteger <- function()
  { 
    n <- readline(prompt="Guess a number: ")
    if(!grepl("^[0-9]+$",n))
    {
      return(readinteger())
    }
    return(as.integer(n))
  }

> num <- round(runif(1) * 100, digits = 0)
> guess <- 1:10

> cat("Guess a number between 1 and 100:")

> while(guess != num)
{ 
  guess <- readinteger()
  if (guess == num)
  {
    cat("Woo-hoo,", num, "is right.\n")
  }
  else if (guess < num)
  {
    cat("It's bigger!\n")
  }
  else if(guess > num)
  {
    cat("It's smaller!\n")
  }
}