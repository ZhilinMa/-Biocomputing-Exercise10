setwd("~/Desktop/biocomputing/-Biocomputing-Exercise10")

# Problem 1
library(ggplot2)
game = read.table("UWvMSU_1-22-13.txt", sep = "\t", header = TRUE)
df <- data.frame(matrix(ncol = 3, nrow = 0))
colnames(df) <- c('time', "MSU_score", "UW_score")
MSU_score = 0
UW_score = 0

for (i in 1:nrow(game)) {
  if(game$team[i]=="MSU") {
    MSU_score = MSU_score + game$score[i]
  }
  else {
    UW_score = UW_score + game$score[i]
  }
  time = game$time[i]
  df[nrow(df) + 1,] <- c(time, MSU_score, UW_score)
}
for(i in 1:nrow(df)){
  df[i,2] <- (df$MSU_score[i]/MSU_score * 100)
  df[i,3] <- (df$UW_score[i]/UW_score * 100)
}

ggplot() + 
  geom_line(data = df, aes(x = time, y = MSU_score), color = "blue") +
  geom_line(data = df, aes(x = time, y = UW_score), color = "black") +
  xlab("Time (minutes)") + ylab("% of total score")

# Problem 2
random_num = sample(x=(1:100), size = 1)
print("I'm thinking of a number 1-100...")
for(i in 1:11) { # allow for 10 guesses
  guess = readline("Guess: ")
  if(guess == random_num) {
    print("Correct!")
    break
  }
  else if(guess < random_num) {
    print("Higher")
  }
  else if(guess > random_num) {
    print("Lower")
  }
}

