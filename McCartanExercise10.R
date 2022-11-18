# Part 1 basketball analysis
# set working directory
setwd("~/Library/CloudStorage/GoogleDrive-annamac2021@gmail.com/My Drive/School/Fall 2022/Biocomputing/R/-Biocomputing-Exercise10")
# load data
gameData=read.table("UWvMSU_1-22-13.txt")
# generate df w cumulative score for each team
# create summary line graph

# Part 2 guess my number
# create vector of integers 1-100
intvec=c(1:100)
# extract random value
randomint=sample(intvec)
# computer message
print("I'm thinking of a number 1-100")
print("Guess: ")
# record user input
userguess=0
if (userguess < randomint){
  print("Higher")
} else if (userguess > randomint){
  print("Lower")
} else{
  print ("Correct!")
}