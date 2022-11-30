setwd("~/Desktop/class materials/biocomputing/R_Unit/-Biocomputing-Exercise10/")
library(ggplot2)


# Problem 1

#   read in graph
game_data = read.table("UWvMSU_1-22-13.txt", sep = "\t", header = TRUE)

#   make a data frame to hold scores
scores <- data.frame(matrix(ncol=3, nrow=0))
colnames(scores) <- c('time', 'MSU', 'UW')

MSU_score = 0
UW_score = 0

#   loop through game_data to add up scores
for (i in 1:nrow(game_data)) {
  if (game_data$team[i] == 'MSU') {
    MSU_score = MSU_score + game_data$score[i]
  }
  else {
    UW_score = UW_score + game_data$score[i]
  }
  
  #   add to data frame
  time = game_data$time[i]
  scores[nrow(scores) + 1,] <- c(time, MSU_score, UW_score)
}

#    convert scores in to percentage of total score
for (s in 1:nrow(scores)) {
  
  # MSU
  scores[s,2] <- (scores$MSU[s] / MSU_score * 100)
  
  # UW
  scores[s,3] <- (scores$UW[s] / UW_score * 100)
}

#    x axis time
quarter <- c(10,20,30,40)

#    plot
ggplot() + 
  geom_line(data = scores, aes(x = time, y = MSU), color = "blue") +
  geom_line(data = scores, aes(x = time, y = UW), color = "black") +
  xlab("Time (minutes)") + ylab("% of total score") +
  scale_x_discrete(limit = quarter, labels=c("First", "Second", "Third", "Fourth"))






# Problem 2

#  vector with numbers 1-100
numbers <- seq(100)

#  get a random number
rand_num <- sample(numbers, 1)

#  game variable
found = FALSE

#  start game
print("I'm thinking of a number 1-100...")

for (i in 1:10) {
  user_guess = readline(prompt = "Guess: ")
  user_guess = as.integer(user_guess)
  
  if (user_guess == rand_num) {
    print("Correct!")
    found = TRUE
    break
  }
  else if (user_guess > rand_num) {
    print("Lower")
  }
  else if (user_guess < rand_num) {
    print("Higher")
  }
}

if (found == FALSE) {
  sprintf("The number was %s", rand_num)
}





