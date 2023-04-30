# open and view data
  library(readxl)
  library(tidyverse)
  ALL_T3_1Ms_Bcell_IL6_TC <- read_excel("Documents/biol-4386-course-project-emma-treco/data/ALL_T3_1Ms_Bcell_IL6_TC.xlsx")
  ALL_T3_1Ms_Bcell_IL6_TC$`pSTAT3Y705/STAT3` <- as.numeric(as.character(ALL_T3_1Ms_Bcell_IL6_TC$`pSTAT3Y705/STAT3`))

# First graph will be of just the female mice, so I will start by filtering out the males.
  Female_T3_1Ms_Bcell_IL6_TC <- ALL_T3_1Ms_Bcell_IL6_TC %>% filter(Sex=="Female") %>% 
    rename(time = `Time (mins)`, pSTAT = `pSTAT3Y705/STAT3`) %>% 
    select("Genotype", "time", "pSTAT")
  
# Get mean and standard error for each genotype at each time point
  stats <- Female_T3_1Ms_Bcell_IL6_TC %>% 
    group_by(Genotype, time) %>% 
    summarize(mean=mean(pSTAT), sd=sd(pSTAT))
  
# Separate time points by making individual tibbles
# Perform one-way ANOVA to determine interaction between STAT3 phosphorylation and genotype
  
  # at 0 minutes
  Female_0 <- as_tibble(Female_T3_1Ms_Bcell_IL6_TC) %>% filter(time == 0)
  x.0 <- aov(pSTAT ~ Genotype, data = Female_0)
  anova(x.0)
  TukeyHSD(x.0)
  # no significant difference between WT-Het, WT-KO, or Het-KO
  
  # at 15 minutes
  Female_15 <- as_tibble(Female_T3_1Ms_Bcell_IL6_TC) %>% filter(time == 15)
  x.15 <-aov(pSTAT ~ Genotype, data = Female_15)
  anova(x.15)
  TukeyHSD(x.15)
  # significant difference between WT-Het and WT-KO
  
  # at 30 minutes
  Female_30 <- as_tibble(Female_T3_1Ms_Bcell_IL6_TC) %>% filter(time ==30)
  x.30 <-aov(pSTAT ~ Genotype, data = Female_30)
  anova(x.30)
  TukeyHSD(x.30)
  # significant difference between WT-Het and WT-KO
  
  # at 60 minutes
  Female_60 <- as_tibble(Female_T3_1Ms_Bcell_IL6_TC) %>% filter(time ==60)
  x.60 <-aov(pSTAT ~ Genotype, data = Female_60)
  anova(x.60)
  TukeyHSD(x.60)
  # no signficant difference between WT-Het, WT-KO, or Het-KO
  
# Use ggplot2 to create graph of the mean pSTAT at each time point. 
  stats %>% ggplot(aes(x = time, y = mean, color = Genotype)) + geom_point() + geom_line() +
    labs(title = "Female", x = "Time (mins)", y = "pSTAT3Y705/STAT3") + 
    theme(axis.title = (element_text(size = 13, face = 'bold'))) +
    geom_errorbar(aes(ymin=mean-sd, ymax=mean+sd), width =.2) +
     scale_color_manual(values = c("pink", "green", "blue")) +
    
# add significance symbols
    annotate(geom = "text", x = 15, y = 0.6, label = "**", size = 8, color = "green") +
    annotate(geom = "text", x = 15, y = 0.575, label = "**", size = 8, color = "pink") +
    annotate(geom = "text", x = 30, y = 0.8, label = "*", size = 8, color = "green") +
    annotate(geom = "text", x = 30, y = 0.775, label = "*", size = 8, color = "pink")

  
  
  