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
#prepared the data for analyst and removed any redundant data
data <- data.frame(
  team_type = c(rep("Home", nrow(results)), rep("Away", nrow(results))),
  goals     = c(results$home_score, results$away_score)
)

data <- na.omit(data)

data$team_type <- factor(data$team_type, levels = c("Away", "Home"))
