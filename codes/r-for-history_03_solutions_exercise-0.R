library(stringr)

para <- "CALLISTO, the daughter of Lycaon, king of Arcadia, was a huntress in the train of Artemis, devoted to the pleasures of the chase, who had made a vow never to marry; but Zeus, under the form of the huntress-goddess, succeeded in obtaining her affections. Hera, being extremely jealous of her, changed her into a bear, and caused Artemis (who failed to recognize her attendant under this form) to hunt her in the chase, and put an end to her existence. After her death she was placed by Zeus among the stars as a constellation, under the name of Arctos, or the bear."

class(para)

para_sent <- unlist(str_split(para, pattern = ",|\\."))

length(para_sent)

str_subset(para_sent, "Artemis")