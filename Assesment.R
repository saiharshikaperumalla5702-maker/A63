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
# 5. Visualisations 


## 5.1 Histogram (Overall)
ggplot(data, aes(x = goals)) +
  geom_histogram(bins = 20, fill = "steelblue", colour = "white") +
  ggtitle("Histogram of All Goals Scored") +
  xlab("Goals") + ylab("Frequency")

## 5.2 Boxplot (Home vs Away)
ggplot(data, aes(team_type, goals, fill = team_type)) +
  geom_boxplot() +
  scale_fill_manual(values = c("lightblue", "salmon")) +
  ggtitle("Distribution of Goals by Venue Type") +
  xlab("Team Type") + ylab("Goals")

## 5.3 Violin Plot (For Advanced visualization)
ggplot(data, aes(team_type, goals, fill = team_type)) +
  geom_violin(trim = FALSE, alpha = 0.7) +
  ggtitle("Violin Plot of Goals (Distribution Shape)") +
  xlab("Team Type") + ylab("Goals")

## 5.4 Density Plot
ggplot(data, aes(goals, fill = team_type)) +
  geom_density(alpha = 0.6) +
  ggtitle("Density Plot of Goals Scored") +
  xlab("Goals") + ylab("Density")

## 5.5 Mean Comparison Bar Chart
ggplot(group_stats, aes(team_type, mean, fill = team_type)) +
  geom_col() +
  ggtitle("Mean Goals by Venue Type") +
  ylab("Mean Goals") +
  scale_fill_manual(values = c("lightblue", "salmon"))
