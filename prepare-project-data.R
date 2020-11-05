## Prepare project data
## ====================

library(readr)
library(dplyr)
library(tibble)
library(Matrix)

# Load original data
load("raw-data/X_GSE21374.rda")
load("raw-data/RejectionStatus.rda")

## Note that X_GSE21374 has been CENTERED and SCALED
## Original gene-wise Std devs are in the "scaled:scale" attribute
gene_vars <- attr(X_GSE21374, "scaled:scale")^2
stopifnot(length(gene_vars) == nrow(X_GSE21374))

## Only keep 25 % most variable genes to reduce data set size
X_GSE21374_filtered <- X_GSE21374[gene_vars >= quantile(gene_vars, 0.75), ]

gene_exprs_by_patient <- t(X_GSE21374_filtered)

## Combine with rejection status in one data frame
kidney_data <- data.frame(gene_exprs_by_patient) %>% 
  rownames_to_column("Patient_ID") %>% 
  full_join(RejectionStatus, by = "Patient_ID") %>% 
  select(Patient_ID, Reject_Status, everything())

## Export as compressed csv
write_csv(kidney_data, file = "GSE21374-kidney-data.csv.gz")
