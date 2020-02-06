
2 + 5

0.37 * 256

nchar("when in Rome, do as Romans do")

toupper("when in Rome, do as Romans do")

finish_sentece("when in Rome")

finish_sentence <- function(text) {
    paste0(text, ", do as Romans do")
}

finish_sentence("when in Rome")

a <- 2 + 5
a

b <- 'Rome'
b

text <- "The ancient Greeks had several different theories with regard to the origin of the world, but the generally accepted notion was that before this world came into existence, there was in its place a confused mass of shapeless elements called Chaos. "

toupper(text) #Convert to uppercase

nchar(text) #Number of characters

gsub("world", "cheese", text) #Pattern replacement

mytext1 <- "Themis, who has already been alluded to as the wife of Zeus, was the daughter of Cronus and Rhea, and personified those divine laws of justice and order by means of which the well-being and morality of communities are regulated. She presided over the assemblies of the people and the laws of hospitality."
mytext2 <- "Athene was universally worshipped throughout Greece, but was regarded with special veneration by the Athenians, she being the guardian deity of Athens. Her most celebrated temple was the Parthenon, which stood on the Acropolis at Athens, and contained her world-renowned statue by Phidias, which ranks second only to that of Zeus by the same great artist."

nchar(mytext1)
nchar(mytext2)

nchar(mytext1) - nchar(mytext2)

mytext3 <- rome

text1_nc <- nchar(mytext1)
text2_nc <- nchar(mytext2)

mytest <- text1_nc == text2_nc

as.character(text1_nc)

as.numeric(mytext1)

class(mytest)

my_vec <- c(1, 9, 7, 3)
my_vec

my_vec2 <- append(my_vec, 22)
my_vec2

my_vec3 <- c(my_vec, 22)
my_vec3

class(my_vec)

text_words <- unlist(strsplit(text, split = "\\s"))  #split at every whitespace - \\s is an escape character
text_words

text_words[5]
text_words[22]

library(stringr)

# Changing case (here to lowercase)
str_to_lower(text)

# Looking up words
str_detect(text, "world")

# Counting matches
str_count(text, "world")

# Splitting text into elements; here separating at commas
# unlist is used to coerce to a vector; otherwise it is returned as a list
text_sent <- str_split(text, pattern = ",") %>% 
unlist()

# Looking up word in each sentence
str_detect(text_sent, "world")

# Counting word in each sentence
str_count(text_sent, "world")

text_sent[str_detect(text_sent, "world")]

str_subset(text_sent, "world")

mytexts <- c(mytext1, mytext2)
mysents <- str_split(mytexts, pattern = ",")
mysents <- unlist(mysents)

str_detect(mysents, "Zeus")

text_sent

# Return sentences containing either "origin" or "before"
str_subset(text_sent, "origin|before")

# Return sentences containing an uppercase.
str_subset(text_sent, "[A-Z]")

str_subset(mysents, "Zeus|Athene")

library(tidytext)
library(gutenbergr)
library(dplyr)

# Downloading the text "Myths and Legends of Ancient Greece and Rome" by E.M. Berens
text_df <- gutenberg_download(22381)

head(text_df) #Shows the 6 first rows of each observation

colnames(text_df)

# Importing stopwords (commonly used words that are mostly void of meaning)
data(stop_words) #the "stop_words" dataset is a part of the tidytext package

# Unnesting tokens - similar to splitting. Splits individual words by default and converts to lower case
tokens_df <- text_df %>% # Create object and "pipe" (%>%). This tells R to use the newly created object in the next line
  unnest_tokens(word, text) %>% #unnest tokens. first arg is the new column, second is the old
  anti_join(stop_words) #filters out rows containing stop words

# Print first 6 rows of new data - now a data frame with individual words as rows
head(tokens_df)

tokens_count <- count(tokens_df, word, sort = TRUE)
head(tokens_count)

head(tokens_count$word) #6 first rows of the variable "Miles per galon"

head(nchar(tokens_count$word))

str_subset(tokens_count$word, "^w")

tokens_count$nchar <- nchar(tokens_count$word)
head(tokens_count)

tokens_count <- mutate(tokens_count, nchar = nchar(word))
head(tokens_count)

# Filtering rows with word longer than 4 characters
tokens_filter <- tokens_count %>%
    filter(nchar > 4)

head(tokens_filter)

# Filtering rows with word starting with a "w" - "^" is regular expression for "starts with"
tokens_filter <- tokens_count %>%
    filter(str_detect(word, "^w"))

head(tokens_filter)

?sum

paga_text <- gutenberg_download(22153)

paga_tokens <- paga_text %>%
    unnest_tokens(word, text, to_lower = FALSE) %>%
    count(word, sort = TRUE) %>%
    filter(str_detect(word, "^[A-Z]"))

head(paga_tokens)

paga_tokens <- paga_text %>%
    unnest_tokens(word, text, to_lower = FALSE) %>%
    count(word, sort = TRUE) %>%
    filter(str_detect(word, "^[A-Z]")) %>%
    filter(nchar(word) > 3)

head(paga_tokens)

library(readxl)

runaways <- read_excel("runaways_exampledata.xlsx")

dim(runaways)
head(runaways)

head(runaways)

class(runaways$registered)

# Stored as character - R does not now how to evaluate!
runaways$escaped[1] - runaways$registered[1]

library(lubridate)

# Some example dates - all stored as character
date1 <- "29 aug 1876"
date2 <- "1770-11-26"
date3 <- "12.26.1810"

lapply(c(date1, date2, date3), class)

date1 <- dmy(date1)
date2 <- ymd(date2)
date3 <- mdy(date3)

lapply(c(date1, date2, date3), class)

print(date1)
year(date1)
month(date1)
day(date1)
wday(date1, label = TRUE, locale = "English")

date1 - date2

# Create time difference as interval
time_int <- interval(date2, date1)

# Display time differences with different units
as.period(time_int, unit = "days")
as.period(time_int, unit = "months")
as.period(time_int, unit = "years")

# Numeric coercion
as.numeric(time_int, "years")

dates <- c("1876-12-21", "1873-11-01", "1885-01-30", "1842-06-10")
dates <- ymd(dates)
dates

date_ints <- interval(ymd("1800-01-01"), dates)
as.numeric(date_ints, "years")

library(readr)
write_excel_csv(runaways, path = "my_data.csv", delim = ";", col_names = TRUE)
