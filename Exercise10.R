# set working directory
setwd("~/Biocomputing/-Biocomputing-Exercise10/")

# Problem 1
table <- read.table(file = "UWvMSU_1-22-13.txt", header = TRUE, stringsAsFactors = TRUE)
data <- as.matrix(table)

#set variables for making vectors and building data frame
UWscore = 0;
MSUscore = 0;
nrow <- nrow(table)
times <- c()
team <- c()
points <- c()
MSU <- "MSU"
UW <- "UW"

 for (num in 1:nrow) {
  if (data[num,2] == UW) {
    times <- append(times,as.numeric(gsub(" ","",data[num,1])))
    UWscore = UWscore + strtoi(data[num,3])
    points <- (append(points,UWscore))
    team <- append(team,UW)
  }else if(data[num,2] == MSU) {
    times <- append(times,as.numeric(gsub(" ","",data[num,1])))
    MSUscore = MSUscore + strtoi(data[num,3])
    points <- append(points, MSUscore)
    team <- append(team,MSU)
  }
}

# Create data frames
game<-data.frame(times,team,points)

# Create the graph
library(ggplot2)
library(cowplot)

ggplot(data=game,aes(x=times,y=points,color = as.factor(team))) + geom_line() + 
  labs(color = "Team") + ggtitle("UW vs. MSU") + xlab("Time(Minutes)") + ylab("Points")


# Problem 2
# generate a random number
answer <- sample(1:100,1)
# user guess
guess <- "0"
# number of guesses
counter = 0;
# loop for guessing
print("I'm thinking of a number 1-100...")
while(counter < 10) {
  guess <- readline("Guess: ")  
  counter = counter + 1;
  if (counter >= 10 && strtoi(guess) != answer){
    print("Game Over!")
    break
  }
  else if (strtoi(guess) < answer) {
    print("Higher")
  }
  else if (strtoi(guess) > answer) {
    print("Lower")
  }
  else if (strtoi(guess) == answer) {
    print("Correct!")
    break
  }
}


