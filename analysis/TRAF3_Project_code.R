# open and view data
  library(readxl)
  library(tidyverse)
  ALL_T3_1Ms_Bcell_IL6_TC <- read_excel("Documents/biol-4386-course-project-emma-treco/data/ALL_T3_1Ms_Bcell_IL6_TC.xlsx")
  ALL_T3_1Ms_Bcell_IL6_TC$`pSTAT3Y705/STAT3` <- as.numeric(as.character(ALL_T3_1Ms_Bcell_IL6_TC$`pSTAT3Y705/STAT3`))

# First graph will be of just the female mice, so I will start by filtering out the males.
  Female_T3_1Ms_Bcell_IL6_TC <- ALL_T3_1Ms_Bcell_IL6_TC %>% filter(Sex=="Female") %>% 
    rename(time = `Time (mins)`, pSTAT = `pSTAT3Y705/STAT3`) %>% 
    select("Genotype", "time", "pSTAT")

# Separate time points by making individual tibbles
# Get mean and standard error for each genotype at each time point
# Perform one-way ANOVA to determine interaction between STAT3 phosphorylation and genotype

  
  # at 0 minutes
  Female_0 <- tb %>% filter(time == 0)
  
  Female_0$Genotype <- factor(Female_0$Genotype, levels = c("WT", "Het", "KO"))
  Female_0 %>% group_by(Genotype) %>% summarize(N = length(pSTAT), 
                                                m = mean(pSTAT), 
                                                sd = sd(pSTAT), 
                                                se = sd / sqrt(N)
                                                )
    # mean is WT 0.0143, Het 0.0478, KO 0.0201
    # standard error is WT 0.0132, Het 0.0215, KO 0.0134
  
  x.0 <- aov(pSTAT ~ Genotype, data = Female_0)
  anova(x.0)
  TukeyHSD(x.0)
    # no significant difference between WT-Het, WT-KO, or Het-KO
  
  
  
  # at 15 minutes
  Female_15 <- tb %>% filter(time == 15)
  
  Female_15$Genotype <- factor(Female_15$Genotype, levels = c("WT", "Het", "KO"))
  Female_15 %>% group_by(Genotype) %>% summarize(N = length(pSTAT), 
                                                m = mean(pSTAT), 
                                                sd = sd(pSTAT), 
                                                se = sd / sqrt(N)
                                                )
    # mean is WT 0.203, Het 0.434, KO 0.436
    # standard error is WT 0.0373, Het 0.0323, KO 0.0270
  
  x.15 <-aov(pSTAT ~ Genotype, data = Female_15)
  anova(x.15)
  TukeyHSD(x.15)
    # significant difference between WT-Het and WT-KO
  
  

  # at 30 minutes
  Female_30 <- tb %>% filter(time ==30)
  
  Female_30$Genotype <- factor(Female_30$Genotype, levels = c("WT", "Het", "KO"))
  Female_30 %>% group_by(Genotype) %>% summarize(N = length(pSTAT), 
                                                m = mean(pSTAT), 
                                                sd = sd(pSTAT), 
                                                se = sd / sqrt(N)
                                                )
    # mean is WT 0.303, Het 0.560, KO 0.621
    # standard error is WT 0.0404, Het 0.0613, KO 0.0637
  
  x.30 <-aov(pSTAT ~ Genotype, data = Female_30)
  anova(x.30)
  TukeyHSD(x.30)
    # significant difference between WT-Het and WT-KO
  
  
  
  # at 60 minutes
  Female_60 <- tb %>% filter(time ==60)
  
  Female_60$Genotype <- factor(Female_60$Genotype, levels = c("WT", "Het", "KO"))
  Female_60 %>% group_by(Genotype) %>% summarize(N = length(pSTAT), 
                                                m = mean(pSTAT), 
                                                sd = sd(pSTAT), 
                                                se = sd / sqrt(N)
                                                )
    # mean is WT 0.342, Het 0.469, KO 0.509
    # standard error is WT 0.0850, Het 0.0525, KO 0.0506
  
  x.60 <-aov(pSTAT ~ Genotype, data = Female_60)
  anova(x.60)
  TukeyHSD(x.60)
    # no signficant difference between WT-Het, WT-KO, or Het-KO
  
#Use ggplot2
  Female_T3_1Ms_Bcell_IL6_TC %>% ggplot(aes(x = time, y = pSTAT, color = Genotype)) +
    geom_point() +
    #facet_wrap(vars(Genotype)) +
    labs(title = "Female", x = "Time (mins)", y = "pSTAT3Y705/STAT3") + 
    theme(axis.title = (element_text(size = 13, face = 'bold')))
    geom_errorbar()
  
#make averages for each 
  WT_Females <- ALL_T3_1Ms_Bcell_IL6_TC %>% filter(Genotype=='WT', Sex=="Female") %>% 
    select(`Time (mins)`, `pSTAT3Y705/STAT3`, `Mouse Number`) %>% 
    pivot_wider(id_cols = "Time (mins)", names_from = "Mouse Number", values_from = "pSTAT3Y705/STAT3") %>% 
   
    
  