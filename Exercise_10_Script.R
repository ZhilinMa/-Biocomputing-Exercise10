setwd("~/Desktop/biocomputing-2022/Biocomputing-Exercise10")

#1. generate a graph of UW vs MSU
ScoreData=read.table("UWvMSU_1-22-13.txt", header=TRUE)
ScoreDF=data.frame(matrix(nrow=0, ncol=3))
colnames(ScoreDF)<-c("time","team","score")

UWscore=0
MSUscore=0

for(i in 1:nrow(ScoreData)){
  if(ScoreData$team[i]=="UW"){
    UWscore=UWscore+ScoreData$score[i]
  }
  else{
    MSUscore=MSUscore+ScoreData$score[i]
  }
  time=ScoreData$time[i]
  ScoreDF[nrow(ScoreDF)+1]
}

ScoreDF$time[i]=ScoreData$time[i]
ScoreDF$team[i]=ScoreData$team[i]

library(ggplot2)
ggplot() +
  geom_line(data=ScoreDF, aes(x=time, y=UWscore), color="black") +
  geom_line(data=ScoreDF, aes(x=time, y=MSUscore), color="blue") +
  xlab("time") + ylab("score") +
  theme_classic()


#2. Write a game called "guess my number"

RandomNumber=sample(x=(1:100), size=1)
print("I'm thinking of a number 1-100...")
for(i in 1:10){
  PlayerGuess=readline("Guess:")
  if(PlayerGuess==RandomNumber){
    print("Correct!")
  }
  else if(PlayerGuess < RandomNumber){
    print("Higher")
  }
  else if(PlayerGuess > RandomNumber){
    print("Lower")
  }
}
  

