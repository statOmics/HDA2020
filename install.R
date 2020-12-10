## Install dependencies
install.packages(c("remotes", "BiocManager"), Ncpus = 2L)

BiocManager::install(
  c(
    "tidyverse", "devtools", "rmarkdown", "knitr",
    "plot3D", "git2r", "downloader", "imager",
    "pixmap", "gridExtra", "ggmap", "ExperimentHub",
    "scater", "CCA", "glmnet", "ggforce",
    "latex2exp", "SemiPar", "DAAG",
    "genefu", "breastCancerMAINZ", "plotROC", "PMA",
    "mgcv", "sessioninfo","sparseLDA", "pls", "NormalBetaPrime", "boot",
    "cluster", "locfdr", "gganimate","magick", "plotly"
  ),
  Ncpus = 2L)

remotes::install_github("hadley/emo")
remotes::install_github("vqv/ggbiplot")
