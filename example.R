## example.R

rm(list=ls());
library(MASS);

## **************************************************************
## generate data
## **************************************************************
n0 <- 5;
n1 <- 5;
p <- 3;

O1 <- matrix(0.5,nrow=p,ncol=p)+diag(0.5,p);
D0 <- diag(c(1,1,rep(0,p-2)));
O0 <- O1+D0;

X1<- mvrnorm(n1,rep(0,p),solve(O1));
X0<- mvrnorm(n0,rep(0,p),solve(O0));

fitcvx<- dpmcvx(X1,X0,nlambda=10,tuning="aic");
fit.cv <- dpmcvx(X1.t,X0.t,nlambda=10,tuning="cv",folds=3);
