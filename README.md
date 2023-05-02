Emma Treco
Final Report
He
01 May 2023

# **Impact of Traf3 Copy Number on IL-6 Signaling**


## Reference figure and data obtained by: Treco, E; Hornick, E; Bishop, G. 
The Bishop Lab. 2022-23


## **Introduction**

High specificity and diversity are key features of adaptive immunity and are critical for protection against reinfection. Plasma cells (PCs) are fully differentiated B cells that are specifialized to constitutively produce a singular product: one specific, high-affinity antibody (note: PCs are different from memory B cells which are dormant). As such, PCs are major contributors to the afforementioned featues of adaptive immunity. After immature B cells with high-affinity B cell receptors differentiate into PCs, they are sustained by IL-6R signaling. IL-6 is also a growth factor for malignant PCs and therefore must be tightly regulated. Previous work from our laboratory has shown that the adaptor protein Tumor Necrosis Factor Receptor (TNFR)-Associated Factorr 3 (TRAF3) is an important negative regulator of IL-6R signaling in B cells (Figure 1). Upon IL-6 stimulation of the receptor, TRAF3 recruits phosphatase PTPN22 to the IL-6R signaling complex (Figure 1). PTPN22 reverses IL-6 dependent activation of JAK1 and STAT3 by removing the activating phosphorylation, which suppresses downstream effects such as PC development (Figure 1). B cells deficient in TRAF3 (knockouts) have increased IL-6 dependent phosphorylation of JAK1 and STAT3 as a reesult. Most of our work to date has been performed on B cells with a homozygous loss of *Traf3*, but further investigation of how *Traf3* copy number affects TRAF3-dependent phenotypes is justified based on:
1) an increasing number of patients with heterozygous loss-of-function *Traf3* mutations
2) preliminary work indicating B cells TRAF3 levels may decline with age
The goal of this project is to reproduce Figure 2 which shows that 
following IL-6 stimulation of B-*Traf3* heterozygous primary mouse cells, 
there is enhanced early STAT3 phosphorylation compared to wildtype mice. 
Note that figure 2 is the data of both sexes pooled whereas the figures 
produced in this paper are divided by sex. 

![IL-6R signaling pathway showing interaction between IL-6, TRAF3, and 
STAT3.](/Users/emmatreco/Documents/biol-4386-course-project-emma-treco/background_figures/IL6R_signaling_pathway.png)

![Wildtype, *Traf3* heterozygous, and *Traf3* homozygous primary 
mouse cells stimulated with IL-6 for given time, then blotted for pSTAT3, 
STAT3, and actin. * p<0.05, ** p<0.1, and * * * p< 0.001 between WT and 
KO. X p<0.05 between WT and 
het.](/Users/emmatreco/Documents/biol-4386-course-project-emma-treco/background_figures/reference_figure.png)

![WT, B-Traf3 Het, and B-Traf3 KO primary moous cells were sitmulateed 
with IL-6 for the given amount of time, then pSTAT3Y705 (top), STAT3 
(middle), and actin (bottom) proteins were detecteed via western 
blotting.](/Users/emmatreco/Documents/biol-4386-course-project-emma-treco/background_figures/Representative_western_pSTAT3.png)

## **Materials and Methods**

Primary mouse B cells were obtained from mouse spleens, then stimulated for a given amount of time using interleukin 6 (IL-6). Results of the cell 
stimulation were visualized using western blotting to determine the difference in the amount of phosphorylated STAT3 in the TRAF3 wildtype, 
heterozygotes, and knockout mouse B cells. The western blots were blotted for pSTAT3Y705, STAT3, and actin. They were then imaged 
with the Fuji Imager Las-4000, and bands were quantified with the software MultiGauge V.3.

The excel sheet that has been added to the github repository contains data for 4-5 mice of each genotype that has been obtained throughout this past 
year. A representative western blot has also been added to the github repository (Figure 3). This data has been used to generate graphs in the past, 
such as that of Figure 2 which serves as the example figure for the data analysis described in this document. 

The programming language R was used to complete the data wrangling, statistical analysis, and graph construction. First, the tidyverse library was 
installed and used to organize the data in a way that was most helpful for the construction of the graphs. This included separating the data by sex 
and removing unnecessary data columns. Following the data wrangling, the summary feature was used to generate the mean and standard deviation for each genotype at each time point. After obtaining summary statistics, R was used to separate the data into 
individual tibbles for each time point, then to run a one-way ANOVA which assessed the differences between genotype at each time point. 

The ggplot2 function within tidyverse was then used to create the final graph showing the mean and standard deviation for each genotype at 0, 15, 30, 
and 60 minutes, as well as asteriks showing statistical significance of either Het or KO compared to the WT.

Details on the computational work can be found in the project's github 
repository under the script directory.

## **Results and Discussion**



![Wildtype (WT, blue), *Traf3* deficient (Het, pink), and *Traf3* knockout (KO, green) female primary mouse B cells stimulated with IL-6 
for 0, 15, 30, or 60 minutes, then blotted for pSTAT3Y705 and total STAT3. A single asterik indicates a significance of p<0.05, 
and a double asterik indicates a significance of p<0.01. The color of the asterik corresponds to each phenotype compared to the wildtype, for example 
the green asterik indicates significant difference between WT and KO, and 
the pink asterik indicates significant difference between WT and 
Het.](/Users/emmatreco/Documents/biol-4386-course-project-emma-treco/output/Female_percentpSTAT3overtime.png)
![Data for 
males.](/Users/emmatreco/Documents/biol-4386-course-project-emma-treco/output/Male_percentpSTAT3overtime.png)

## **Conclusion**


## **Reflection**

This project was first completed using only the data for the female mice, but the process was repeated with the male mice. The 
successful repetition of the methods indicates that this project is reproducible. I also made sure to include detailed comments in 
the script, so anyone else who desires to produce a similar graph can follow along my work and use these methods for their own 
figure.

The most challenging part of this project was the statistical analysis portion. To accomplish this, I had to make sure my data was 
wrangled in the exact right way for the analysis to work as intended. I also had to change around the order of my data wrangling, 
because it would have been unnecessarily complicated to separate everything before determing the mean and standard deviation for each 
group. 

Overall, even though there were some difficult times, I would say that I enjoyed the project and figuring out how to make things work 
because it felt like such an accomplishment when it finally did work. Every time I successfully completed a step in my journey, I was 
so excited! Even now, looking at my finished product, I am so impressed by my coding because I have never done anything like this 
before. 
