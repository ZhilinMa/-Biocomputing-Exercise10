##set working directory
setwd("~/Desktop/BIOS60125/Biocomputing-Exercise10/")
library(ggplot2)

#Assiganment1
game <- read.table("UWvMSU_1-22-13.txt", header=TRUE, sep="\t", stringsAsFactors=FALSE)
head(game)
##initialize four columns to store data
game$UWscore = 0
game$MSUscore = 0
game$UWsum = 0
game$MSUsum = 0

for(i in 1:nrow(game)){
  if(game$team[i] == "UW"){
    game$UWscore[i] = game$score[i]
    game$UWsum[i] = sum(game$UWscore[1:i])
  }
  else {
    game$MSUscore[i]= game$score[i]
    game$MSUsum[i]=sum(game$MSUscore[1:i])
  }
}

for (i in 2:nrow(game)){
  if (game$UWsum[i]==0){
    game$UWsum[i]=game$UWsum[i-1]
  }
  if (game$MSUsum[i]==0){
    game$MSUsum[i]=game$MSUsum[i-1]
  }
}

#add 0 at the beginning to make it more reasonable
#game[1+nrow(game),] = c(3,0,0,0,0,0,0)
#game[1+nrow(game),] = c(2,0,0,0,0,0,0)
#game[1+nrow(game),] = c(1,0,0,0,0,0,0)
#game[1+nrow(game),] = c(0,0,0,0,0,0,0)

ggplot(game, aes(x= time, y = "")) + 
  geom_line(aes(y = UWsum, col = "UW")) + 
  geom_line(aes(y = MSUsum, col = "MSU"))+
  theme_bw() +
  xlab("Time") +
  ylab("Score")+
  theme(legend.title=element_blank())+
  scale_x_continuous(limits = c(0,40),
                     expand = c(0,0),
                     n.breaks = 5,
                     labels = c("0","1st","2nd","3rd","4th"))

#Assignment2
## intialize the answer
answer <- sample(1:100,1)
#intialize the guess and count
guess <- -1
count <- 0
print("I'm thinking of a number 1-100")
while (count < 10) {
  guess <- readline("Guess: ")
  count = count + 1
  if(count == 10 && guess != answer){
      print("Game over!")
      break
  } 
  else if(strtoi(guess) < answer){
    print("Higher")
  }
  else if(strtoi(guess) > answer){
    print("Lower")
  }
  else if(strtoi(guess) == answer){
    print("Correct")
    break
  }
}
