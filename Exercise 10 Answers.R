#Set working directory
setwd("C:/Users/15135/Desktop/Exercise10/-Biocomputing-Exercise10")

#1
#create "Scores" to read the text file
Scores <- read.table("UWvMSU_1-22-13.txt", header = TRUE)

#Create data frame to input the scores into
df <- data.frame(matrix(ncol=3, nrow= 0))
colnames(df) <- c('time', 'UW_Score', 'MSU_Score')

#Plug in scores
UW_Score = 0
MSU_Score = 0

#Inputs scores into the data frame
for (i in 1:nrow(Scores)){ 
  if (Scores$team[i] == 'UW'){
    UW_Score = UW_Score + Scores$score[i]
  } else{ 
    MSU_Score = MSU_Score + Scores$score[i]
  }
  time = Scores$time[i]
  df[nrow(df) + 1,] <- c(time, UW_Score, MSU_Score)
}

#Plot the scores
library(ggplot2)
ggplot() +
  geom_line(data =df, aes(x=time, y=UW_Score), color="red") +
  geom_line(data= df, aes(x=time, y=MSU_Score), color="green") +
  theme_classic() +
  ylab("Game Score") +
  xlab("Time")

#Question 2 - Guess my Number
random_number = sample.int(100,1)
print ("I'm thinking of a number 1-100...")
print("Guess a number!")
for (i in 1:10) {
  guess = readline();
  guess = as.integer(guess);
  if (guess == random_number){
    print("Correct")
    break
  }else if (guess > random_number){
    print("Lower")
  }else if (guess < random_number){
    print("Higher")
  }
}

