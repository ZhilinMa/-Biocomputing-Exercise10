## Laurel Lown
# Exercise 10, due 12/2/22

# 1. Analysis of score-by-score info to generate figure.
scores<-read.table("UWvMSU_1-22-13.txt",header=TRUE,sep='\t')
scores

library(ggplot2)

game_data <- read.table(file="UWvMSU_1-22-13.txt",header=TRUE)
score_time <- game_data[,1]
score_time_length <- length(score_time)
cumulScores <- data.frame(
  time=score_time,
  UW_Score=numeric(score_time_length),
  MSU_Score=numeric(score_time_length)
)
uwScore <- 0
msuScore <- 0
#making loop to keep track of cumulataive scores in a table
for (index in 1:length(score_time)){
  if(game_data[index,"team"] == "UW"){
    uwScore = uwScore + game_data[index,"score"]
    #print(paste("uw:",uwScore))
  }else{
    msuScore = msuScore + game_data[index,"score"]
    # print(paste("msu: ",msuScore))
  }
  cumulScores[index,"UW_Score"] = uwScore
  cumulScores[index,"MSU_Score"] = msuScore
}

# plotting game scores

ggplot() +
  geom_line(data=cumulScores, aes(x=time,y=UW_Score,color="UW"))+
  geom_line(data=cumulScores, aes(x=time,y=MSU_Score,color="MSU"))+
  ylab("Score")+
  xlab("Time (minutes)")+
  ggtitle("UW vs MSU Score Over Time")+
  theme_classic()


# 2. "Guess my number"
# Generate random number
randomNum=sample(x=(1:100),size=1)

# Use a for loop to display the correct output
# Player only gets 10 guesses
print("I'm thinking of a number between 1 & 100...")
for(i in 1:11){
  guess<-readline("Make a guess: ")
  if(guess==randomNum){
    print("You are correct!")
    break
  }
  if(guess<randomNum){
    print("Guess a larger number.")
  }
  if(guess>randomNum){
    print("Guess a smaller number.")
  }
  if(i==11){
    print("You are out of guesses.")
  }
}


