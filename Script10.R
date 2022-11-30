setwd("~/Exercise7/-Biocomputing-Exercise10")
library(ggplot2)
df <- read.table("UWvMSU_1-22-13.txt",header = TRUE)
df$csum <- ave(df$score, df$team, FUN=cumsum)
ggplot(data=df, aes(x=time, y=csum, group=team)) +
  geom_line(aes(color=team))


print("I'm thinking of a number 1-100...")
num<-sample(1:100,1)
count = 0
while(count<10) {
  guess <- readline("Guess: ")
  if (strtoi(guess)==num){
    print("Correct!")
    break
  }
  else if (strtoi(guess)<num) {
    print("Higher")
    count = count +1
  }
  else if (strtoi(guess)>num) {
    print("Lower")
    count = count +1
  }
}