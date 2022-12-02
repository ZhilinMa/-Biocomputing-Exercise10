#Exercise 10
setwd("~/Desktop/Rstudio/-Biocomputing-Exercise10")
read.delim("UWvMSU_1-22-13.txt")-> UWvMSU
#pre-allocation of variables to store the scores and the cumulative for each team seperately 
UW_score<- numeric(length=nrow(UWvMSU))
MSU_score<- numeric(length=nrow(UWvMSU))
UW_cumsum<- numeric(length=nrow(UWvMSU))
MSU_cumsum<- numeric(length=nrow(UWvMSU))
#for loop to create vector with the scores for each team to be used so the cumulative score can be easily used
for(i in 1:nrow(UWvMSU)){
  if(UWvMSU$team[i]=="UW"){
    UW_score[i]<-UWvMSU$score[i]}
  else if(UWvMSU$team[i]=="MSU"){
      MSU_score[i]<-UWvMSU$score[i]}}
#creation of cumulative sums into new vectors for each team. Summing the current score with all the previous ones.
for(i in 1:nrow(UWvMSU)){
  UW_cumsum[i]<-sum(UW_score[1:i])
  MSU_cumsum[i]<-sum(MSU_score[1:i])}
#plot
      #creation of a new data set so it can be graphed
    data.frame(UWvMSU, UW_cumsum, MSU_cumsum)-> UWMSU
    #graph
library(ggplot2)
ggplot(UWMSU, aes(x=time))+
  #each team gets its own line, therefore its own aes
         geom_line(aes(y=UW_cumsum, color="UW"))+
         geom_line(aes(y=MSU_cumsum, color="MSU"))+ 
  #creation of axis titles and repositioning of the legend
  labs(x= "Time (minutes)", y= "Score", color="Teams")+ 
  theme_classic()+
  theme(legend.position = c(.75,.25))
  
##################################################

#2 
#I'm thinking of a number 1-100
  #x= random number: want outside of the custom function so it does not restart every run of the custom function
x<-sample(1:100,1)
  #custom function so the game can be replicated

GuessingGame<- function(y){
  #we want the player to have a maximum of 10 chances 
  maxGuesses<- 10
  #for loop to determine the correct guess
  y=55
  maxGuesses=10
  for(i in 1:maxGuesses){ 
    #if the guess, y, is equal to the random number, x, then we want to print correct
    if(x==y) {
      print("correct!")
      #I want to start the game over if they win so break is used
      break
    }else if(0>=maxGuesses){
      print("You ran out of guesses")
      #I want to start the game over if they run out of guesses so break is used
      break
    }else if(y<x){
      print("higher")
      #if the guess is lower than the random number I want to tell the player to guess higher
      maxGuesses<- maxGuesses-1
      y<- scan(n=1)
    }else if(y>x){ print("lower")
      #if the guess is higher than the random number I want to tell the player to guess lower
      maxGuesses<- maxGuesses-1
      y<- scan(n=1)
    }}}
#player will type GuessingGame() and enter their first guess in the parentheses. From there they will guess up to 9 more times 
  #just guessing the numerical value. Ex. GuessingGame(57) 
  #"lower"
  #1: 45
  #"correct!"
