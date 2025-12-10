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
#Prepare dataset for analysis
group_stats <- data %>%
  group_by(team_type) %>%
  summarise(
    n = n(),
    mean = mean(goals),
    median = median(goals),
    sd = sd(goals),
    var = var(goals)
  )

print(group_stats)
