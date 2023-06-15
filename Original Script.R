# Prompt user to enter a three digit positive number

NarNum <- readline(prompt = "Enter a three digit positive number: ")

# Check if the answer provided to the prompt is valid. If not, print an error message

if (is.numeric(as.numeric(NarNum)) & #checks if answer is numeric
#PR: It might be helpful to the reader to explain why is.numeric and as.numeric is needed.I.e readline will interpret the users input as charactes, so we must make it numeric to run the rest of the code.  
    (as.numeric(NarNum)) %% 1 == 0 & #checks if answer is an integer
    nchar(NarNum) == 3 & #checks if answer is three digits
    !(as.numeric(NarNum) %in% 001:099) & #checks to make sure answer is within the 100-999 range by ensuring it doesn't start with a zero
#PR: I like this additional layer of safety, defensive coding!
    as.numeric(NarNum) > 0) { #checks if the answer is a positive number
  NarNum <- as.integer(NarNum) #Converts answer into numeric (rather than character)
  #PR: Do you mean converts the answer into integer (you used as.integer), or did you mean to use as.numeric here?
  if (((NarNum %/% 100)^3) + (((NarNum %% 100) %/% 10)^3) + ((NarNum %% 10)^3) == NarNum) { #formula for identifying an Armstrong number
    # the formula separates NarNum into three digits, squares each digit, and sums them together, then checks if the sum equals NarNum
    #PR: I think you meant to say "cubes" each digit above instead of squares.
    print(paste(NarNum, "is a narcissistic number."))
  } else {
    print(paste(NarNum, "is not a narcissistic number."))
  }
} else {
  print("This entry is not valid. Quitting...")
}
# PR: You could also add the function quit(save = "no", status = 1) to directly terminate the program for the user and call up a notification to notify the user that the input did not produce a valid Armstrong output.

# PR: Overall, great work! The code was concise with accompanying notes to inform the reader. In the future, maybe elaborate more on how the functions work and double check the comments. Elements of defensive programming were included and the output returns the appropriate classification of narcissistic numbers.
