#Exercise10
library(ggplot2)
#Question1
#summarize a game (UW v. MSU)
#generate a graph similar to the one shown above
#focus on control structure

#import data
game_data <- read.csv("UWvMSU_1-22-13.txt", sep='\t')
#make it manipulable
game_df <- as.data.frame(game_data)

#preset initial variables
UW_initialscore<-0
MSU_initialscore<-0
scores<-numeric(2)
game_df$UW_currentscore<-0
game_df$MSU_currentscore<-0

#for loop to iterate through
for (i in 1:nrow(game_df)){
  if (game_df$team[i]=='UW'){
    scores[1]=UW_initialscore+scores[1]+game_df$score[i]
    game_df$UW_currentscore[i]<-scores[1]
    game_df$MSU_currentscore[i]<-scores[2]}else{
      scores[2]=MSU_initialscore+scores[2]+game_df$score[i]
      game_df$UW_currentscore[i]<-scores[1]
      game_df$MSU_currentscore[i]<-scores[2]}
}

#plot UW v. MSU as a function of time
#Wisconsin Red: #C5050C; 
#MSU: not spartan green bc as a palette would not be colorblind friendly #0B9A6D
#even the palettes chosen don't fit but needed to have the colleges be their school colors

ggplot(game_df, aes(x=time, y=scores)) +
  geom_line(aes(y=MSU_currentscore), color = '#0B9A6D') +
    geom_line(aes(y=UW_currentscore), color = '#C5050C')


#Question 2: Guess my number
#prompt
numbergame <-function(x){
  print("I'm thinking of a number 1-100...")
  #generate a hidden random number
  number=sample(100,1)
  #get user input
  guess = readline(prompt = 'Guess: ')
  if(guess==number){
    print('Correct!')
  }else{
    if(guess>number){
      print('Lower')
    }else{
      print('Higher')
    }
    }



              