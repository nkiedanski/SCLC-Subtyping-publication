## SCLC Subtyping - publication

**Publication Title**: Subclassification of Small Cell Lung Cancer Based on Gene Expression Signatures and Machine Learning 

## Overview
This repository contains resources related to the classification of Small Cell Lung Cancer (SCLC) using gene expression signatures and machine learning techniques. The primary focus is on the NAPY SVM classifier, which predicts four distinct SCLC molecular subtypes: SCLC-N, SCLC-A, SCLC-P, and SCLC-Y.

## Repository Structure
- **/model:** contains the NAPY SVM classifier for predicting SCLC molecular subtypes
     - `svm_model.rds`: The trained SVM model.
  
- **/src:** Includes source code for evaluating the classifier on CCLE SCLC cell lines, and calculating per-class performance metrics.
     - `model_evaluation.qmd`: Code for model evaluation.
     - `fun_metrics_pclass.r`: Functions for calculating performance metrics by class.
  
- **/doc:** Contains documentation and data files necessary for executing the model on CCLE SCLC cell lines and new datasets.
     - `expression_signatures_sclc_napy.fst`: Contains the 80 gene symbols that comprise the 4 TF-associated programs (20 genes each), used as features in the NAPY SVM classifier.
     - `ccle_sclc.fst`: Gene expression data for CCLE SCLC cell lines downloaded from DEPMAP. The data is formatted as log2(TPM + 1) with rows representing cell lines and columns for cell line names, 80 genes, and subtype. The subtype column is used solely for performance calculations (predicted vs. true).
  

## Installation
The project is developed in R version 4.4.0. To restore the project environment and dependencies, use the following command:
```R
renv::restore()
```

## Usage
This repository provides the original code to reproduce the evaluation results of the NAPY SVM classifier on CCLE SCLC cell lines from the paper. Additionally, it serves as a guide for executing the model on new datasets and obtaining per-class performance metrics.


## Authors and acknowledgment
For detailed information, please refer to the publication: Subclassification of Small Cell Lung Cancer Based on Gene Expression Signatures and Machine Learning.



