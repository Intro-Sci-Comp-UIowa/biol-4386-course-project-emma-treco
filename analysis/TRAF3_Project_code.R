# open and view data
  library(readxl)
  library(tidyverse)
  ALL_T3_1Ms_Bcell_IL6_TC <- read_excel("Desktop/ALL_T3_1Ms_Bcell_IL6_TC.xlsx")
  ALL_T3_1Ms_Bcell_IL6_TC$`pSTAT3Y705/STAT3` <- as.numeric(as.character(ALL_T3_1Ms_Bcell_IL6_TC$`pSTAT3Y705/STAT3`))

#First graph will be of just the female mice, so I will start by filtering out the males.
  Female_T3_1Ms_Bcell_IL6_TC <- ALL_T3_1Ms_Bcell_IL6_TC %>% filter(Sex=="Female") %>% 
    select("Genotype", "Time (mins)", "pSTAT3Y705/STAT3")
  
#Use ggplot2
  Female_T3_1Ms_Bcell_IL6_TC %>% ggplot(aes(x = `Time (mins)`, y = `pSTAT3Y705/STAT3`, color = Genotype)) +
    geom_point() +
    #facet_wrap(vars(Genotype)) +
    labs(title = "Female", x = "Time (mins)", y = "pSTAT3Y705/STAT3") + 
    theme(axis.title = (element_text(size = 13, face = 'bold')))
  
#make averages for each 
  WT_Females <- ALL_T3_1Ms_Bcell_IL6_TC %>% filter(Genotype=='WT', Sex=="Female") %>% 
    select(`Time (mins)`, `pSTAT3Y705/STAT3`, `Mouse Number`) %>% 
    pivot_wider(id_cols = "Time (mins)", names_from = "Mouse Number", values_from = "pSTAT3Y705/STAT3") %>% 
    mean()
  
    
  