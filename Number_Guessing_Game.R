#first, choose a random number
number <- sample(1:100, size = 1)

#this variable will be used later to make sure everything that needs to be an integer is one
error_var <- as.integer("this is not an integer")

#then we begin the cycle of asking for guesses and giving feedback
for(i in 1:10){
  guess <- readline("I'm thinking of a number between 1 and 100.  What is it? ")
    #this tells you when you lose since that has to be done within the function since R apparently
    #cannot properly take input from readline if there is so much as a comment after this for loop
    if(i==10){
      print("Sorry, you lost, better luck next time!")
      break
    }
    #this is to quit quickly if you want (like for testing purposes) 
    #instead of having to try 10 times
    else if(guess=="q"){
      break
    }
    else{
      guess <- as.integer(guess)
      #this tests to make sure that the thing entered was a real integer before using integer
      #operations that will cause fatal errors if non-integers are used with them.
      #It will still give a warning at the end of the game if non-ints were used, though
      if(guess %in% error_var){
        print("Please enter an integer.")
      }
      else if(guess > number){
        print("Lower")
      }
      else if(guess < number){
        print("Higher")
      }
      else if(guess == number){
        print("Correct!  You win!")
        break
      }
      #this should never actually get called
      else{
        print("Please only enter integers.")
      }
    }
}

