# Part 1 basketball analysis
# set working directory
setwd("~/Library/CloudStorage/GoogleDrive-annamac2021@gmail.com/My Drive/School/Fall 2022/Biocomputing/R/Biocomputing-Exercise10")
# load data
gameData=read.table("UWvMSU_1-22-13.txt", header=TRUE)
# generate df w cumulative score for each team
scoredf=data.frame(matrix(nrow=nrow(gameData), ncol=3))
colnames(scoredf)=c("time", "team", "totalscore")
# create cumulative score variables
UWscore=0
MSUscore=0
# iterate through each row in gameData
for (i in 1:nrow(gameData)){
  # if team = "UW," add score to UW's cumulative score
  if (gameData$team[i]=="UW"){
    UWscore=UWscore+gameData$score[i]
    # add UW's cumulative score at this time to new df
    scoredf$totalscore[i]=UWscore
  }
  # if team = "MSU," add score to UW's cumulative score
  else if (gameData$team[i]=="MSU"){
    MSUscore=MSUscore+gameData$score[i]
    # add MSU's cumulative score at this time to new df
    scoredf$totalscore[i]=MSUscore
  }
  # otherwise, return an error
  else{
    print("invalid team value")
  }
  # add time and team to new df
  scoredf$time[i]=gameData$time[i]
  scoredf$team[i]=gameData$team[i]
}
# create summary line graph
library(ggplot2)
ggplot(scoredf,
       aes(x=time, y=totalscore)) +
  geom_line(aes(color=team)) +
  ylab("score") +
  theme_classic()

# Part 2 guess my number
# create vector of integers 1-100
intvec=c(1:100)
# extract random value
randomint=sample(intvec)
# computer message
print("I'm thinking of a number 1-100")
print("Guess: ")
# record user input
userguess=0
if (userguess < randomint){
  print("Higher")
} else if (userguess > randomint){
  print("Lower")
} else{
  print ("Correct!")
}
