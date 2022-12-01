###Exercise 10 -Andrew Lupinski


##Question1

#upload file, file is tab delimited 
results<-read.table("UWvMSU_1-22-13.txt", header = TRUE, sep = "\t")

#We need to make a matrix to put our scores over time into. But we need to start at 0 to account for a full game.

score_time<-results[,1]
score_length<-length(score_time)
totalScore<-data.frame(
  time=score_time,
  UW_Score=numeric(score_length),
  MSU_Score=numeric(score_length)
)


#We want a for loop to fill out the data frame
#We need to separate when UW scores from when MSU scores using an if else statement
#With this code, scores get sorted into their specific teams then added to the overall scores
for (i in 1:nrow(results)){
  if(results$team[i]=="UW"){
    totalScore[(i+1),2]<-totalScore[i,2]+results[i,3]
    totalScore[(i+1),3]<-totalScore[i,3]
    totalScore[i+1,1]<-results[i,1]
  }else{
    totalScore[(i+1),3]<-totalScore[i,3]+results[i,3]
    totalScore[(i+1),2]<-totalScore[i,2]
    totalScore[i+1,1]<-results[i,1]
  }
}
#creates 51 obs since it starts both at 0


#Next to replicate the graph 
ggplot()+
  geom_line(data=totalScore, aes(x=time, y=UW_Score, color="UW"))+
  geom_line(data=totalScore, aes(x=time, y=MSU_Score, color="MSU"))+
  ylab("Score")+
  xlab("Time (minutes")+
  theme_classic()
#

##Question 2
 
#Make a function to generate a random number
randomNumber<-sample(100,1)

#Use a for loop that will allow you to guess 10 times
#The three result option are too high, too low, just right

for (i in 1:10){
  Guess<-readline(prompt="Guess a Number Between 1-100: ")
  if(Guess==randomNumber){
    print("Correct!")
  }else if(Guess>randomNumber){
    print("Lower")
  }else if(Guess<randomNumber){
    print("Higher")
  }
}
 

