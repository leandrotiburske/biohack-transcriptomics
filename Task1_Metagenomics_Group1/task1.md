# Pipeline for reverse engineering of bacterial networks

## Usage
```
Rscript task1.R <path to input matrix> <path to output file>
```

## Description
This pipeline takes a raw count matrix as input and generates a microbial
co-occurrence network using the **SPRING** (Semi-Parametric Rank-based approach
for INference of Graphical model) algorithm.

Data transformation is performed with the CLR (Centered Log-Ratio) method,
applied internally by SPRING when `quantitative = TRUE`. External normalization
methods such as GMPR and CSS are therefore not applied, as they would duplicate
the transformation step.

Zero imputation is not performed. SPRING was developed to handle sparse
compositional data natively, and many zeros in microbiome count matrices
represent true biological absences rather than technical dropout events.
Imputation would risk introducing spurious correlations and artificial edges
in the inferred network.

To improve numerical stability and reduce noise from extremely sparse features, taxa with prevalence below 10% are filtered out before network inference. Prevalence is defined as the fraction of samples in which a taxon has a non-zero count. This step removes rare taxa that provide limited information for robust edge estimation and may cause instability during SPRING’s graphical model fitting.
## Requirements
SPRING is required for this pipeline and should be installed according to the official documentation (see https://github.com/IrinaStatsLab/SPRING):

```
# install.packages("remotes")
remotes::install_github("IrinaStatsLab/SPRING")
```