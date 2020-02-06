# R for History - Part 1 refresher

## Objects and classes

### Assigning objects
number <- 546 # Assign with <-

word <- "hello" # "" tells R that object is a string (text)

sentence <- "Athene was universally worshipped throughout Greece, but was regarded with special veneration by the Athenians, she being the guardian deity of Athens. Her most celebrated temple was the Parthenon, which stood on the Acropolis at Athens, and contained her world-renowned statue by Phidias, which ranks second only to that of Zeus by the same great artist."

num_string <- "42" # Numbers in "" treated as text


### Classes

class(number) # Objects have a specific class associated
class(word)
class(sentence)

as.numeric(num_string) # Coerces to a different class - but does not change the object!
as.character(number)

num_string <- as.numeric(num_string) # Coerces and changes object


## Functions

nchar(sentence) # Functions transform and manipulate objects and return something

sen_char <- nchar(sentence) # Output of a function can be stored in new objects

casefold(word, upper = TRUE) # Input to functions are called "arguements". Often the first arguement is the object to transform

word_char <- nchar(word) # Most functions take several arguements but they have default settings

?nchar # See the help file for a function and its default arguements


## Packages

install.packages('stringr') # Install package 'stringr' - remember '' when installing
library(stringr) # Loads the functions in the package - no ''

## Vectors

num_vec <- c(1, 2, 3) # Vectors are series of objects of the same class. Use c to create vectors
obj_vec <- c(word, sentence)

sentence <- str_replace(sentence, pattern = ",", replacement = "")
sentence_lower <- str_to_lower(sentence)
word_vec <- str_split(sentence_lower, pattern = "\\s")
word_vec <- unlist(word_vec) # Texts can be treated as vectors of single words

length(word_vec)

word_vec[48] # Each object in a vector has an index
word_vec[c(3, 6)] # Several indices

## Working with strings

sent_vec <- unlist(str_split(sentence, pattern = ", "))

str_detect(sent_vec, "Zeus") # stringr contains different functions for working with strings

str_subset(sent_vec, "Zeus|Athene") # regular expression can be used to match specific text patterns