# Prompt user to enter a three digit positive number
NarNum <- readline(prompt = "Enter a three digit positive number: ")

# Check if the answer provided to the prompt is valid. If not, print an error message

if (is.numeric(as.numeric(NarNum)) & #checks if answer is numeric
    (as.numeric(NarNum)) %% 1 == 0 & #checks if answer is an integer
    nchar(NarNum) == 3 & #checks if answer is three digits
    !(as.numeric(NarNum) %in% 001:099) & #checks to make sure answer is within the 100-999 range by ensuring it doesn't start with a zero
    as.numeric(NarNum) > 0) { #checks if the answer is a positive number
  NarNum <- as.integer(NarNum) #Converts answer into numeric (rather than character)
  if (((NarNum %/% 100)^3) + (((NarNum %% 100) %/% 10)^3) + ((NarNum %% 10)^3) == NarNum) { #formula for identifying an Armstrong number
    # the formula separates NarNum into three digits, squares each digit, and sums them together, then checks if the sum equals NarNum
    print(paste(NarNum, "is a narcissistic number."))
  } else {
    print(paste(NarNum, "is not a narcissistic number."))
  }
} else {
  print("This entry is not valid. Quitting...")
}