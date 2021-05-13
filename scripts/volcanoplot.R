#!/usr/bin/env Rscript
#----------------------------------------------------------------------------------------------------------------------------------
#Figure 2 & 4: Violin Plots
#Author: Noel-Marie Plonski
#----------------------------------------------------------------------------------------------------------------------------------
#Code to reproduce upset plot in (add citation)
#----------------------------------------------------------------------------------------------------------------------------------
#this code requires the UpSetR package (add citation)
#install.packages(ggplot2)
#install.packages(plyr)
#install.packages(ggpubr)
#install.packages(dplyr)
#----------------------------------------------------------------------------------------------------------------------------------
#loads packages
suppressPackageStartupMessages(library(ggplot2))
suppressPackageStartupMessages(library(plyr))
suppressPackageStartupMessages(library(ggpubr))
suppressPackageStartupMessages(library(dplyr))
#----------------------------------------------------------------------------------------------------------------------------------
##Violin plots Figure 2 for COD diagnosis
#load matrices for global ADAR editing levels 
data <- read.csv(here(/data/VariantFilteringVisualAll.csv))
#----------------------------------------------------------------------------------------------------------------------------------
#assign size to the image
#----------------------------------------------------------------------------------------------------------------------------------
image1 <- "/data/CODglobalADARediting.tiff"
tiff(image1, units="in", width=15, height=15, res=300)
#----------------------------------------------------------------------------------------------------------------------------------
#taking averages of MLE correction for Guttman scores
data_plot <- data %>%
group_by(COD, gender, tissue) %>%
summarize(average = mean (ADAR), sd=sd(ADAR))
#----------------------------------------------------------------------------------------------------------------------------------
#defines x and y axis and sets volcano plot
my_plot <- ggplot(data_plot, aes(x=COD, y=average, fill=COD)) + geom_violin() 
#----------------------------------------------------------------------------------------------------------------------------------
# splits graph in facets defined by variables.
my_plot2 <- my_plot + facet_grid(vars(gender), vars(tissue))
#---------------------------------------------------------------------------------------------------------------------------------- 
# violin plot with jittered points & 0.2 : degree of jitter in x direction
my_plot3 <- my_plot2 + geom_dotplot(binaxis='y', stackdir='center', dotsize=1) + geom_jitter(shape=16, position=position_jitter(0.2))
#---------------------------------------------------------------------------------------------------------------------------------- 
# adds labels and custom colors
my_plot4 <- my_plot3 + labs(title="Plot of average global ADAR editing by COD",x="COD", y = "Global ADAR editing") + scale_fill_manual(values=c('red','blue')) 
#----------------------------------------------------------------------------------------------------------------------------------
#cahnges look of plot removes background, moves legend and resizes it. Resizes all text and removes x-axis labels since these are some in the legend.
my_plot5 <- my_plot4 + theme_bw() + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank()) + theme(legend.text=element_text(size=20)) + theme(legend.position="bottom") + guides(colour = guide_legend(override.aes = list(size=12))) + theme(strip.text.x = element_text(size = 20)) + theme(text = element_text(size=20)) + theme(axis.title.x=element_blank(), axis.text.x=element_blank(), axis.ticks.x=element_blank())
#---------------------------------------------------------------------------------------------------------------------------------
# prints plot to save image 
my_plot5
dev.off()
##Violin plots Figure 2 for MDD diagnosis
#load matrices for Global ADAR editing 
data <- read.csv(here(/data/VariantFilteringVisualAll.csv))
#----------------------------------------------------------------------------------------------------------------------------------
#assign size to the image
#----------------------------------------------------------------------------------------------------------------------------------
image1 <- "/data/CODglobalADARediting.tiff"
tiff(image1, units="in", width=15, height=15, res=300)
#----------------------------------------------------------------------------------------------------------------------------------
#taking averages of MLE correction for Guttman scores
data_plot <- data %>%
group_by(MDD, gender, tissue) %>%
summarize(average = mean (ADAR), sd=sd(ADAR))
#----------------------------------------------------------------------------------------------------------------------------------
#defines x and y axis and sets volcano plot
my_plot <- ggplot(data_plot, aes(x=MDD, y=average, fill=MDD)) + geom_violin() 
#----------------------------------------------------------------------------------------------------------------------------------
# splits graph in facets defined by variables.
my_plot2 <- my_plot + facet_grid(vars(gender), vars(tissue))
#---------------------------------------------------------------------------------------------------------------------------------- 
# violin plot with jittered points & 0.2 : degree of jitter in x direction
my_plot3 <- my_plot2 + geom_dotplot(binaxis='y', stackdir='center', dotsize=1) + geom_jitter(shape=16, position=position_jitter(0.2))
#---------------------------------------------------------------------------------------------------------------------------------- 
# adds labels and custom colors
my_plot4 <- my_plot3 + labs(title="Plot of average global ADAR editing by MDD diagnosis",x="MDD", y = "Average Global ADAR Editing") + scale_fill_manual(values=c('red','blue')) 
#----------------------------------------------------------------------------------------------------------------------------------
#cahnges look of plot removes background, moves legend and resizes it. Resizes all text and removes x-axis labels since these are some in the legend.
my_plot5 <- my_plot4 + theme_bw() + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank()) + theme(legend.text=element_text(size=20)) + theme(legend.position="bottom") + guides(colour = guide_legend(override.aes = list(size=12))) + theme(strip.text.x = element_text(size = 20)) + theme(text = element_text(size=20)) + theme(axis.title.x=element_blank(), axis.text.x=element_blank(), axis.ticks.x=element_blank())
#---------------------------------------------------------------------------------------------------------------------------------
# prints plot to save image 
my_plot5
dev.off()
##Violin plots Figure 4 for COD
#load matrices for Guttman MLE Scores 
data <- read.csv(here(/data/allscoresfinal.csv))
#----------------------------------------------------------------------------------------------------------------------------------
#assign size to the image
#----------------------------------------------------------------------------------------------------------------------------------
image1 <- "/data/CODguttmanscores.tiff"
tiff(image1, units="in", width=15, height=15, res=300)
#----------------------------------------------------------------------------------------------------------------------------------
#taking averages of MLE correction for Guttman scores
data_plot <- data %>%
group_by(COD, gender, tissue) %>%
summarize(average = mean (MLE), sd=sd(MLE))
#----------------------------------------------------------------------------------------------------------------------------------
#defines x and y axis and sets volcano plot
my_plot <- ggplot(data_plot, aes(x=COD, y=average, fill=COD)) + geom_violin() 
#----------------------------------------------------------------------------------------------------------------------------------
# splits graph in facets defined by variables.
my_plot2 <- my_plot + facet_grid(vars(gender), vars(tissue))
#---------------------------------------------------------------------------------------------------------------------------------- 
# violin plot with jittered points & 0.2 : degree of jitter in x direction
my_plot3 <- my_plot2 + geom_dotplot(binaxis='y', stackdir='center', dotsize=1) + geom_jitter(shape=16, position=position_jitter(0.2))
#---------------------------------------------------------------------------------------------------------------------------------- 
# adds labels and custom colors
my_plot4 <- my_plot3 + labs(title="Plot of average MLE score by COD",x="COD", y = "Average MLE score") + scale_fill_manual(values=c('red','blue')) 
#----------------------------------------------------------------------------------------------------------------------------------
#cahnges look of plot removes background, moves legend and resizes it. Resizes all text and removes x-axis labels since these are some in the legend.
my_plot5 <- my_plot4 + theme_bw() + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank()) + theme(legend.text=element_text(size=20)) + theme(legend.position="bottom") + guides(colour = guide_legend(override.aes = list(size=12))) + theme(strip.text.x = element_text(size = 20)) + theme(text = element_text(size=20)) + theme(axis.title.x=element_blank(), axis.text.x=element_blank(), axis.ticks.x=element_blank())
#---------------------------------------------------------------------------------------------------------------------------------
# prints plot to save image 
my_plot5
dev.off()

##Violin plots Figure 4 for MDD diagnosis
#load matrices for Guttman Scores 
data <- read.csv(here(/data/allscoresfinal.csv))
#----------------------------------------------------------------------------------------------------------------------------------
#assign size to the image
#----------------------------------------------------------------------------------------------------------------------------------
image1 <- "/data/MDDguttmanscores.tiff"
tiff(image1, units="in", width=15, height=15, res=300)
#----------------------------------------------------------------------------------------------------------------------------------
#taking averages of MLE correction for Guttman scores
data_plot <- data %>%
group_by(MDD, gender, tissue) %>%
summarize(average = mean (MLE), sd=sd(MLE))
#----------------------------------------------------------------------------------------------------------------------------------
#defines x and y axis and sets volcano plot
my_plot <- ggplot(data_plot, aes(x=MDD, y=average, fill=MDD)) + geom_violin() 
#----------------------------------------------------------------------------------------------------------------------------------
# splits graph in facets defined by variables.
my_plot2 <- my_plot + facet_grid(vars(gender), vars(tissue))
#---------------------------------------------------------------------------------------------------------------------------------- 
# violin plot with jittered points & 0.2 : degree of jitter in x direction
my_plot3 <- my_plot2 + geom_dotplot(binaxis='y', stackdir='center', dotsize=1) + geom_jitter(shape=16, position=position_jitter(0.2))
#---------------------------------------------------------------------------------------------------------------------------------- 
# adds labels and custom colors
my_plot4 <- my_plot3 + labs(title="Plot of average MLE score by MDD",x="MDD", y = "Average MLE score") + scale_fill_manual(values=c('red','blue')) 
#----------------------------------------------------------------------------------------------------------------------------------
#cahnges look of plot removes background, moves legend and resizes it. Resizes all text and removes x-axis labels since these are some in the legend.
my_plot5 <- my_plot4 + theme_bw() + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank()) + theme(legend.text=element_text(size=20)) + theme(legend.position="bottom") + guides(colour = guide_legend(override.aes = list(size=12))) + theme(strip.text.x = element_text(size = 20)) + theme(text = element_text(size=20)) + theme(axis.title.x=element_blank(), axis.text.x=element_blank(), axis.ticks.x=element_blank())
#---------------------------------------------------------------------------------------------------------------------------------
# prints plot to save image 
my_plot5
dev.off()
