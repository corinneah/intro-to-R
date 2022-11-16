#Intro to R

#1.1#

#Current working directory 
getwd()

#Nov 15th, 2022
#Interacting with R
#I am adding 3 and 5. R is fun!
3+5

#Assignment Operator
x <- 3
y <- 5
y
x + y
number <- x + y

##Exercises
x <- 5
y <- 10
number <- x + y

#1.2#

# Create a numeric vector and store the vector as a variable called 'glengths'
glengths <- c(4.6, 3000, 50000)
glengths

# Create a character vector and store the vector as a variable called 'species'
species <- c("ecoli", "human", "corn")
species


##Exercise

#to combine both vectors, all elements become characters 
combined <- c(glengths,species)
combined

# Create a character vector and store the vector as a variable called 'expression'
expression <- c("low", "high", "medium", "high", "low", "medium", "high")

# Turn 'expression' vector into a factor
expression <- factor(expression)

##Exercise

samplegroup <-c("CTL","CLT","KO","CLT","KO","KO","OE","OE","OE")

#Turn samplegroup into a factor data structure
samplegroup <-factor(samplegroup)

# Create a data frame and store it as a variable called 'df'
df <- data.frame(species, glengths)
df

##Exercise

titles <- c("Catch-22", "Pride and Prejudice", "Nineteen Eighty Four")
pages <- c(453, 432, 328)
df2  <- data.frame(titles,pages)

#create a list to organize and combine different data
list1 <- list(species, df, number)
list1
list2 <- list(species,glengths,number)
list2

#1.3#

#Adding
glengths <- c(glengths, 90) 	
glengths <- c(30, glengths) 

sqrt(81)
sqrt(glengths)

round(3.14159)

args(round) #get arguments 
example("round") 

round(3.14159, digits=2)
round(3.14159, 2)

##Exercise
mean(glengths)
test <- c(1, NA, 2, 3, NA, 4) 
?mean
mean(test, na.rm= TRUE)
sort(glengths, decreasing = TRUE)) 


square_it <- function(x) {
  square <- x * x
  return(square)
}

square_it(5)

##Exercise

multiply_it <- function(x,y) {
  multiply <- x * y
  return(multiply)
}

multiply_it(x=4,y=6)

#1.4#

?read.csv

metadata <- read.csv(file="mouse_exp_design.csv")

##Exercise

proj_summary <- read.table(file = "data/project-summary.txt", header = TRUE, row.names = 1)
proj_summary

metadata
head(metadata)

class(glengths)
class(metadata)

summary(proj_summary)

length(samplegroup) 

dim(proj_summary) 

str(rownames(metadata))

length(colnames(proj_summary))

#2.1#

age <- c(15, 22, 45, 52, 73, 81)
age[5] # fifth item on the list
age[-5] #all values except the 5th one on the list
age[c(3,5,6)] 

# OR

## create a vector first then select
idx <- c(3,5,6) # create vector of the elements of interest
age[idx]
age[1:4] # continuous values from a vector

##Exercise
alphabets <- c("C", "D", "X", "L", "F")
alphabets[c(1,2,5)] #select only C,D and F
alphabets[-3] #display all except x
alphabets[5:1]

age
age > 50

age > 50 | age < 18
age

age[age > 50 | age < 18]  ## nested

# OR

## create a vector first then select
idx <- age > 50 | age < 18
age[idx]

which(age > 50 | age < 18)
age[which(age > 50 | age < 18)] #nested

#OR
## create a vector first then select
idx_num <- which(age > 50 | age < 18)
age[idx_num]

expression[expression == "high"]## This will only return those elements in the factor equal to "high"

samplegroup[which(samplegroup != "KO")] #shows all elements that are not KO

expression

str(expression)

expression <- factor(expression, levels=c("low", "medium", "high"))     # you can re-factor a factor 

str(expression)

##Exercise
samplegroup <- factor(samplegroup, levels=c("KO","CTL","OE"))
str(samplegroup)

#2.2#

sessionInfo() #Print version information about R, the OS and attached or loaded packages

# OR

search() #Gives a list of attached packages
install.packages("ggplot2")
library(ggplot2)
search()
sessionInfo()
install.packages("tidyverse")

#2.3#
metadata[1, 1]
metadata[1, 3] 
metadata[3, ]
metadata[ , 3]

metadata[ , 3, drop = FALSE] # to keep the output as a data frame instead of a list
# Dataframe containing first two columns

metadata[ , 1:2] 

# Data frame containing first, third and sixth rows
metadata[c(1,3,6), ] 

# Extract the celltype column for the first three samples
metadata[c("sample1", "sample2", "sample3") , "celltype"] 
# Check column names of metadata data frame
colnames(metadata)
rownames(metadata) ## Check row names of metadata data frame

# Extract the genotype column
metadata$genotype 

# Extract the first five values/elements of the genotype column
metadata$genotype[1:5]

##Exercise
metadata[c("sample2", "sample8"), c("genotype", "replicate")]
metadata$replicate[c(4,9)]
metadata[ , 3, drop = FALSE]

metadata$celltype == "typeA"
logical_idx <- metadata$celltype == "typeA"
metadata[logical_idx, ] 
which(metadata$celltype == "typeA") 

idx <- which(metadata$celltype == "typeA") 
metadata[idx, ]

which(metadata$replicate > 1)
idx <- which(metadata$replicate > 1)
metadata[idx, ]

metadata[which(metadata$replicate > 1), ]
sub_meta <- metadata[which(metadata$replicate > 1), ]

##Exercise

metadata[which(metadata$genotype == "KO"), ]

list1[[2]]

comp2 <- list1[[2]]
class(comp2)

list1[[1]]
list1[[1]][1]
list1

##Exercise
random <- list(c(metadata, age, list1, samplegroup, number))
random[[4]]

names(list1)

# Name components of the list
names(list1) <- c("species", "df", "number")
names(list1)

# Extract 'df' component
list1$df

##Exercise
names(random)
names(random) <- c("metadata", "age", "list1", "samplegroup", "number")
random$age
