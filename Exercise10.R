#Exercise 10
setwd("/Users/abbykinsella/test/Exercises/Biocomputing-Exercise10/")
library(ggplot2)
#problem 1
#create dataframe with cumulative scores
Score=read.table("UWvMSU_1-22-13.txt",sep="\t",header=TRUE)

UWrunningscore=0
MSUrunningscore=0
for (i in 1:nrow(Score))
  {if(Score$team[i]=="UW"){
    Score$UWrunningscore[i]<-Score$score[i]+UWrunningscore
    UWrunningscore<-Score$UWrunningscore[i]
    Score$MSUrunningscore[i]<-MSUrunningscore
   }
  else if(Score$team[i]=="MSU")
  {Score$MSUrunningscore[i]<-Score$score[i]+MSUrunningscore
  MSUrunningscore<-Score$MSUrunningscore[i]
  Score$UWrunningscore[i]<-UWrunningscore
    }
}

#making the plot
ggplot() + ggtitle("UW (red) versus MSU (blue)") + 
  geom_line(data=Score, aes(x=time, y=UWrunningscore), color="red") +
  geom_line(data=Score, aes(x=time, y=MSUrunningscore), color="blue") + 
  labs(y="running scores") + 
  theme_classic()

#problem 2
print("I'm thinking of a number 1-100...")

#generate random number
random=sample(x=(1:100),size=1)

#use for loop to display correct outputs
#can only guess 10 times

for (i in 1:11) {
  guess=readline("make a guess: ");
  if (guess == random) {
    print("you got it!")
    break
  }
  if (guess < random) {
    print("Higher!")
  }
  if (guess > random) {
    print("Lower!")
  }
  if (i == 11) {
    print("You're out of guesses :( ")
  }
}
