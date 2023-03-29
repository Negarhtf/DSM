
# DSM

<!-- badges: start -->
<!-- badges: end -->

The goal of DSM is to run several steps required for digital soil mapping. First, it takes observations and environmental covariates of an area, overlays the points with the same coordinates, and trains a Random Forest model. At this stage, it is only has two functions. Other functions related to digital soil mapping will be soon added.

This R-package is an implementation of a part of the methodolgy as described in the manuscript Evaluating the extrapolation potential of random forest digital soil mapping by Fatemeh Hateffard, Luc Steinbuch and Gerard B. M. Heuvelink (in preparation).

## Reference
Authors: Fatemeh Hateffard and Luc Steinbuch. Latest update: March 2023.

## Installation

You can install the development version of DSM like so:

``` r
devtools::install_github("Negarhtf/DSM")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(DSM)
## basic example code

##Load the environmental covariates in area, here we already save the data in data folder, you can use it as an example. The data is environmental covariate for Kenya
DSM::Ke_covariates
#OR
load("Ke_covariates.RData")
##Load the observations, here we already save the data indata folder, you can use it as an example
DSM::df_Ke_Cl
#OR
load("Ke_OBS.RData")

#overlay
m <- obs_cov_overlay(df_Ke_Cl,Ke_covariates)

#train the model

rf <- RFmodel(m, Ke_covariates, variable_of_interest="Cl")

```

