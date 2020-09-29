---
layout: default
title: Software for Stats Tutorials
---

Students are required to bring their own laptop with R version 3.6.0 or greater.

Please make sure that your computer’s hardware is sufficiently powered (>4 GB RAM, > 2 GB free disk space), that you have a working wireless card, and that you have administrator rights.

There are three options to work with the software:

1. Install R/RStudio locally
2. Using an online binder docker environment that launches R studio immediately. Remark: This tends to be unstable in combination with shiny Apps, the App gets disconnected when there is no browser activity in the App window.

### 1. Local installation

1. Install R 3.6.0 or greater [R/CRAN](https://cran.r-project.org)
2. Install the latest version of Rstudio [R/Rstudio](https://www.rstudio.com/products/rstudio/download/)
3. To install all required packages, please copy and paste this line of code in your R console.

```
source("https://raw.githubusercontent.com/statOmics/SGA2020/master/install.R")
```

- Download and unzip SGA2019 master tree of the course to have the latest versions of the shiny apps.
	- Go to the SGA2019 site on github: [https://github.com/statOmics/SGA2019](https://github.com/statOmics/SGA2019)
	- Click on the clone/download button and select download zip
![](./figs/downloadPdaMasterTree.png)
	- Unzip the repository
	- Open Rstudio and go to the unzipped folder


### 2. Getting started with online Docker image

- Launch an R studio interface in an R docker along with bioconductor packages for proteomics.

[![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/statOmics/SGA2019/master?urlpath=rstudio)
