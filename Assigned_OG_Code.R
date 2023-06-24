# Assignment 3 - Hangman

#' Project plan
#' Create dictionary of words and save as txt file in working directory
#' Choose random words from dictionary each round
#' Prompt user to enter character
#' Use defensive coding to ensure (1)it is a character (2) they've only entered 1 character (3) accept both upper/ lower case
#' Tell user if input was correct
#' If correct - visually demonstrate where in the word does the correct letter go



#' Prepare a dictionary of words to choose from and save in a txt file
#' Upload dictionary to working directory 
dictionary <- readLines("dictionary.txt")

# Ensure that the secret word is randomly selected from the dictionary of words
secret_word <- sample(dictionary, 1)

# Inform user about length of the word
characters <- nchar(secret_word)
print("You can do this! Enter a letter one by one and guess the secret word!")
print(paste("The secret word has", characters, "characters"))
# Inform user about the number of wrong guesses allowed 
print("You have 5 tries.")

# Provide user instructions and information about word/ number of guesses allowed
guessed_letters <- vector("character", nchar(secret_word))
guessed_letters[] <- "_"
tries <- 0
max_tries <- 5



# Ask user for input
# Provide user with visual cue of how they are progressing
while ("_" %in% guessed_letters) {
  cat("Secret word: ", paste(guessed_letters, collapse = " "))
  answer <- readline("Please guess a letter: ")
  
  
  
  
  # Ensure user only enters one letter 
  # If not, show error message. 
  
  if (nchar(answer) != 1) {
    cat("Uh oh! Please enter a single letter. ")
    next
  }
  
  
  
  # Confirm user has entered a letter
  # Allow for both upper and lower case letters 
  # If not, show error message. 
  
  if (!grepl("[A-Za-z]", answer)) {
    cat("Oops, invalid input. Enter a letter! ")
    next
  }
  
  
  
  # If user guesses the same letter, make sure this doesn't count
  if (answer %in% guessed_letters) {
    cat("Oh no! You've already guessed that letter. Try another! ")
    next
  }
  
  # If user guesses letter correctly, let them know, and ask for another letter
  # Update visual cue so that user can see where in the word their correct guess belongs
  
  if (answer %in% strsplit(secret_word, "")[[1]]) {
    cat("Woah! Correct guess!\n")
    matching_indices <- which(strsplit(secret_word, "")[[1]] == answer)
    guessed_letters[matching_indices] <- answer
  } else {
    cat("Incorrect guess. Try again! ")
    tries <- tries + 1 # If incorrect, ask user to try again. Using a loop function is best for this
    
    
    
    # End of loop    
    # Let user know how many remaining tries they have    
    remaining_tries <- max_tries - tries
    if (remaining_tries > 0) {
      cat("Remaining tries:", remaining_tries, "; ")
    } else {
      cat("Nice try! Unforunately you've run out of guesses. The secret word was: ", secret_word)
      break #if user has exhausted max tries, reveal secret word
    }
  }
}

# If user guesses the secret word, inform them
if (!("_" %in% guessed_letters)) {
  cat("Amazing! You've guessed the secret word:", secret_word)
}  
