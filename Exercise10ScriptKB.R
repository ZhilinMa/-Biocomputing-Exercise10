#this script is my work for Exercise 10

library(ggplot2)

#### Problem 1 ####

#importing data and creating time series
gameData <- read.table(file="/Users/kevinbuck/Desktop/BioComputing/Exercises/-Biocomputing-Exercise10/UWvMSU_1-22-13.txt",
                       header=T)
timeList <- gameData[,1]
timeList.length <- length(timeList)
cumulScores <- data.frame(
  time=timeList,
  UW_Score=numeric(timeList.length),
  MSU_Score=numeric(timeList.length)
                                 )
uwScore <- 0
msuScore <- 0
#making loop to keep track of cumulataive scores in a table
for (index in 1:length(timeList)){
  if(gameData[index,"team"] == "UW"){
    uwScore = uwScore + gameData[index,"score"]
    #print(paste("uw:",uwScore))
  }else{
    msuScore = msuScore + gameData[index,"score"]
   # print(paste("msu: ",msuScore))
  }
  cumulScores[index,"UW_Score"] = uwScore
  cumulScores[index,"MSU_Score"] = msuScore
}
#plotting
ggplot()+geom_line(data=cumulScores,aes(x=time,y=UW_Score),color="red") +
  geom_line(data=cumulScores,aes(x=time,y=MSU_Score),color="dark green") + ylab("Score") +
  xlab("Time(min)")+ ggtitle("Wisconsin vs Michigan State Score Over Time")


#### Problem 2 ####

#making the number guesser game
guessMyNumber <- function(){
  one_hundred <- seq(1:100)
  answer <- sample(one_hundred,1)
  print(paste("answer is: ",answer))
  print("I'm thinking of a number 1-100...")
  for(i in 1:11){
    guess=as.numeric(readline(prompt="Guess: "))
    if(is.character(guess) != TRUE){print("Response invalid. Please restart and enter a positive number as your response!")}
    if(is.numeric(guess) == TRUE){
      if(i <= 10){
        if(guess == answer){
          print("Correct!")
          break()
        }
        if(guess < answer){print("Higher!")}
        if(guess > answer){print("Lower!")}
      }
      else{print("Unfortunately, you have lost!")}
    } 
    }
}
guessMyNumber() 



