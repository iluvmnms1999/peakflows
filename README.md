
<!-- README.md is generated from README.Rmd. Please edit that file -->

# peakflows

<!-- badges: start -->
<!-- badges: end -->

The goal of peakflows is to …

## Installation

You can install the development version of peakflows from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("iluvmnms1999/peakflows")
```

## Introduction to the Data

The package was built around data provided from the USGS website
(<https://waterdata.usgs.gov/nwis/>) which contains streamflow
information for several stream gauges in the Sierra Nevadas.

<!--- Maybe we can include a table with some of the data... even a head() of what the data kind of looks like-->

``` r
library(peakflows)
```

## Package Functions

\_\_\_ functions were created to analyse the streamflow data.

df_peaks_all description (?)

The function df_peaks_filt… (description)

The function peak_plot plots the peak streamflows… (description)

## Example

This is a basic example which shows you how the peakflows function
works:

<!--- Maybe include a summary of our dataset/the parameters? Possibly added earlier on while explaining the dataset-->

``` r
summary(cars) 
#>      speed           dist       
#>  Min.   : 4.0   Min.   :  2.00  
#>  1st Qu.:12.0   1st Qu.: 26.00  
#>  Median :15.0   Median : 36.00  
#>  Mean   :15.4   Mean   : 42.98  
#>  3rd Qu.:19.0   3rd Qu.: 56.00  
#>  Max.   :25.0   Max.   :120.00
```

To visualize the peak flows over a specific period of time at a specific
station, the peak_plot function can be used.

<img src="man/figures/README-pressure-1.png" width="100%" /> From
Figure… we can conclude…
