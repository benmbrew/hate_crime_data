# initiate libraries
library(tidyverse)
library(readr)
library(reshape2)

# read in data
dat <- read.csv('data/data.csv')
dat <- read.csv('data/data_2.csv')

# looks like the second one is better

# make lower case 
names(dat) <- tolower(names(dat))

#  break up day and time
dat$time <- unlist(lapply(strsplit(as.character(dat$date), '17 '), function(x) 
  x[length(x)]))

# convert date
dat$date <- as.Date(unlist(lapply(strsplit(as.character(dat$date), ' '), function(x) 
  x[1])), '%m/%d/%y')

# remove first row
dat <- dat[-1,]

