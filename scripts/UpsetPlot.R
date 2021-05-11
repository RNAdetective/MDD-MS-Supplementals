#!/usr/bin/env Rscript
#--------------------------------------------------------------
#Figure 6: Upset Plot
#Author: Noel-Marie Plonski
#--------------------------------------------------------------
#Code to reproduce upset plot in (add citation)
#--------------------------------------------------------------
#this code requires the UpSetR package (add citation)
#install.packages("UpSetR")
#--------------------------------------------------------------
suppressPackageStartupMessages(library("UpSetR"))
#---------------------------------------------------------------
#Define output (what to call the figure)
#This first chunk of code is for Cause of Death Upset plot
image1 <- "/data/UpSetCOD.tiff"
#--------------------------------------------------------------
#define size of final image
tiff(image1, units="in", width=20, height=10, res=600)
#--------------------------------------------------------------
#Load the data
data <- read.csv(here(/data/CODupset.csv")
#set the column names
col_names=names(data)
sets <- col_names
Sex <- c("Female","Male","Female","Male","Female","Male","Female","Male","Female","Male","Female","Male","Female")
metadata <- as.data.frame(cbind(sets, Sex))
metadata$Sex <- as.character(metadata$Sex)
BrainRegion <- c("aINS","aINS","Cg25","Cg25","dlPFC","dlPFC","Nac","Nac","OFC","OFC","PFCB9","PFCB9","Sub")
metadata <- cbind(metadata, BrainRegion)
metadata$BrainRegion <- as.character(metadata$BrainRegion)
#--------------------------------------------------------------
#set the colors for each brain regaion
braincolor <- c(aINS="red",Cg25="orange",dlPFC="yellow",Nac="green",OFC="blue",PFCB9="purple",Sub="black")
sexcolor <- c(Female="red",Male="blue")
matrixcolor <- c(aINS="red",Cg25="orange",dlPFC="yellow",Nac="green",OFC="blue",PFCB9="purple",Sub="black")
text <- c(2, 2, 2, 2, 2, 2)
names(metadata) <- c("Categories","Sex","BrainRegion")
upset(data, nset=14,nintersects=200,text.scale = text,set.metadata = list(data=metadata, plots = list(list(type = "heat", column = "Sex", assign=3,colors=sexcolor), list(type = "matrix_rows", column = "BrainRegion", colors=matrixcolor))))
#-------------------------------------------------------------
#create the upset plot
#-------------------------------------------------------------
upset(data, nset=14,nintersects=200,text.scale = text,point.size=4.2,mainbar.y.label="Editing Sites",sets.x.label="BrainRegions and Biological Sex",shade.alpha=0.51,matrix.dot.alpha=0.1,query.legend="none",set.metadata = list(data=metadata, plots = list(list(type = "matrix_rows", column = "BrainRegion", colors=matrixcolor))), queries = list(list(query = intersects, params = list("Sub_Female"), color = "black", active = F), list(query = intersects, params = list("PFCB9_Female", "PFCB9_Male"), active = T,color ="red"), list(query = intersects, params = list("Nac_Female", "Nac_Male"), active = T,color ="red")))
dev.off()

#---------------------------------------------------------------
#Define output (what to call the figure)
#this chunk of code is for the MDD diagnosis figure
image1 <- "/data/UpSsetMDDcolor.tiff"
#--------------------------------------------------------------
#define size of final image
tiff(image1, units="in", width=20, height=10, res=600)
#--------------------------------------------------------------
#Load the data
data <- read.csv(here(/data/MDDupset.csv))
#set the column names
col_names=names(data)
sets <- col_names
Sex <- c("Female","Male","Female","Male","Female","Male","Female","Male","Female","Male","Female","Male","Female","Male")
metadata <- as.data.frame(cbind(sets, Sex))
metadata$Sex <- as.character(metadata$Sex)
BrainRegion <- c("aINS","aINS","Cg25","Cg25","dlPFC","dlPFC","Nac","Nac","OFC","OFC","PFCB9","PFCB9","Sub","Sub")
metadata <- cbind(metadata, BrainRegion)
metadata$BrainRegion <- as.character(metadata$BrainRegion)
#--------------------------------------------------------------
#set the colors for each brain regaion
braincolor <- c(aINS="red",Cg25="orange",dlPFC="yellow",Nac="green",OFC="blue",PFCB9="purple",Sub="black")
sexcolor <- c(Female="red",Male="blue")
matrixcolor <- c(aINS="red",Cg25="orange",dlPFC="yellow",Nac="green",OFC="blue",PFCB9="purple",Sub="black")
text <- c(2, 2, 2, 2, 2, 2)
names(metadata) <- c("Categories","Sex","BrainRegion")
upset(data, nset=14,nintersects=200,text.scale = text,set.metadata = list(data=metadata, plots = list(list(type = "heat", column = "Sex", assign=3,colors=sexcolor), list(type = "matrix_rows", column = "BrainRegion", colors=matrixcolor))))
#-------------------------------------------------------------
#create the upset plot
#-------------------------------------------------------------
upset(data, nset=14,nintersects=200,text.scale = text,point.size=4.2,mainbar.y.label="Editing Sites",sets.x.label="BrainRegions and Biological Sex",shade.alpha=0.51,matrix.dot.alpha=0.1,query.legend="none",set.metadata = list(data=metadata, plots = list(list(type = "matrix_rows", column = "BrainRegion", colors=matrixcolor))), queries = list(list(query = intersects, params = list("Sub_Female"), color = "black", active = F), list(query = intersects, params = list("PFCB9_Female", "PFCB9_Male"), active = T,color ="red"), list(query = intersects, params = list("Nac_Female", "Nac_Male"), active = T,color ="red"),list(query = intersects, params = list("dlPFC_Female", "dlPFC_Male"), active = T,color ="red")))
dev.off()
