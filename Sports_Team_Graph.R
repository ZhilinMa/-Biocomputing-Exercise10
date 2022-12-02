#I changed the name of my fork from the original repository so it didn't start with a "-"
#in terminal, I ran (in the same directory as the R working directory declared below):
#cat UWvMSU_1-22-13.txt| tr "\t" "," > games_scores.csv
#and then began working in R

#run the following 5 commands when you have just opened R, 
#they are commented out to avoid repeating them needlessly during testing
#setwd("~/Desktop/biocomputing/git_exercises/Biocomputing-Exercise10")
#install.packages("ggplot2")
#library(ggplot2)
#install.packages("reshape")
#library(reshape)

#import the given score data into a data fram
df <- read.csv("games_scores.csv")

#establish the size of the data frame, aka the number of goals made
num_goals <- length(df$score)
#establish the data frame that will be plotted later, 
#setting scores and time to impossible values so errors can be caught easily
score_plot_data <- data.frame(Time = -1, MSU_Score = -1, UW_Score = -1 )

#establish a running score total and error count (errors will occur if the data file somehow
#has scores from other teams)
msu_score_var <- 0
uw_score_var <- 0
error_count <- 0

#fill in the data frame that will be plotted with the times of each goal and each team's 
#cumulative score at each goal time
for (i in 1:length(df$score)){
  score_plot_data[i,1] <- df[i,1]
  if(df[i,2] == "MSU"){
    msu_score_var <- msu_score_var + df[i,3]
  }
  else if(df[i,2] == "UW"){
    uw_score_var <- uw_score_var + df[i,3]
  }
  else{
    error_count <- error_count + 1
  }
  score_plot_data[i,2] <- msu_score_var
  score_plot_data[i,3] <- uw_score_var
}

#then you need to make the new data frame into long form so it can be graphed
score_plot_data <- melt(score_plot_data, id.vars = "Time")

#now you can plot the data as requested
ggplot(score_plot_data, aes(x = Time, y = value, color = variable)) +
  geom_line(size = 1.1) + xlab("Time") + ylab("Score") +
  ggtitle("Game Scores")
