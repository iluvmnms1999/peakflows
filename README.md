
<!-- README.md is generated from README.Rmd. Please edit that file -->

# peakflows

<!-- badges: start -->

[![R-CMD-check](https://github.com/iluvmnms1999/peakflows/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/iluvmnms1999/peakflows/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

## Introduction

The **peakflows** package is built around data provided from the USGS
website (<https://waterdata.usgs.gov/nwis/>) containing streamflow
information for six different stream gauges in the Sierra Nevada. Its
purpose is to allow users to extract and subset peak data for specified
stations and easily identify peaks representing floods, as well as
differentiate between minor and major flood classifications if possible.

The peakflows package can be installed directly from the development
version of peakflows from [GitHub](https://github.com/) with the
following code:

``` r
# install.packages("devtools")
devtools::install_github("iluvmnms1999/peakflows")
```

The peakflows package can be called using the following code:

``` r
library(peakflows)
```
