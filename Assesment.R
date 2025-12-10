# 1. Loading the packages
library(dplyr)
library(ggplot2)

# 2. Loaded the Data
results     <- read.csv("results.csv")
shootouts   <- read.csv("shootouts.csv")
goalscorers <- read.csv("goalscorers.csv")
# Quick structure check done by me
str(results)
head(results)
