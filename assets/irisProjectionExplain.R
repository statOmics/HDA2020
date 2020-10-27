library(tidyverse)
irisSetosa <- iris %>%
  filter(Species == "setosa") %>%
  dplyr::select("Sepal.Length","Sepal.Width")


nIris <- nrow(irisSetosa)
hIris <- diag(nIris) - matrix(1/nIris, nIris, nIris)
irisX <- irisSetosa %>%
  as.matrix
irisX <- hIris %*% irisX

irisSvd <- svd(irisX)

pIrisOrig <- irisSetosa %>%
  ggplot(aes(x=Sepal.Length,y=Sepal.Width)) +
  geom_point() +
  xlim(range(c(irisSetosa[,1],irisX[,1]))) +
  ylim(range(c(irisSetosa[,2],irisX[,2])))

pIrisOrig +
  ggtitle("original")

pIris <- irisX %>%
  as.data.frame %>%
  ggplot(aes(x=Sepal.Length,y=Sepal.Width)) +
  geom_point()

pIris +
  xlim(range(c(irisSetosa[,1],irisX[,1]))) +
  ylim(range(c(irisSetosa[,2],irisX[,2]))) +
  ggtitle("centered")

pIris +
  geom_segment(
    aes(
      x = 0,
      y = 0,
      xend = -irisSvd$v[1,1],
      yend = -irisSvd$v[2,1]
      ),
      arrow = arrow(length=unit(0.4,"cm"))
    ) +
  geom_segment(
    aes(
      x = 0,
      y = 0,
      xend = irisSvd$v[1,2],
      yend = irisSvd$v[2,2]
      ),
    arrow = arrow(length=unit(0.4,"cm"))
    ) +
  geom_text(
    aes(
      x = -irisSvd$v[1,1]*1.2,
      y = -irisSvd$v[2,1]*1.2,
      label="v1"
      )
    ) +
  geom_text(
    aes(
      x = irisSvd$v[1,2]*1.2,
      y = irisSvd$v[2,2]*1.2,
      label="v2"
      )
    ) +
  xlim(-1, 1) +
  ylim(-1,1)
