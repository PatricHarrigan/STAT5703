# Hello World!

library(kmed)
library(ggplot2)
library(gridExtra)
library(dplyr)

############################## Data Importation and Cleanup ##############################
data<-read.csv("heart.csv") # Read in the data
summary(data) # Summarize to look for discrepancies

# Note that caa has 5 values of '4' which don't correspond to anything in the metadata, we should get rid of these guys
table(data$caa)
# Same with 2 individuals with values of 0 under thall, we eliminate these individuals since this is meaningless, and we want to avoid imputation
table(data$thall)

data<-data[data$caa!=4,]
data<-data[data$thall!=0,] # Get's rid of undesirable values

data$cp<-as.factor(data$cp)
data$restecg<-as.factor(data$restecg)
data$slp<-as.factor(data$slp)
data$thall<-as.factor(data$thall)

# Convert the binary factors as well
data$sex<-as.factor(data$sex)
data$fbs<-as.factor(data$fbs)
data$exng<-as.factor(data$exng)
data$output<-as.factor(data$output) # Convert the output to factor as well

# Overall, we got rid of 5+2 = 7 observations due to faulty data. Now, we can convert some of these data into factors:
# We also converted each factor with more than two classes to a factor in R. Binary factors, such as 'sex' and 'exang' can be left as is, but we converted for good measure.

############################## Data Visualization #############################


