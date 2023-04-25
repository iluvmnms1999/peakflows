---
  title: "peak-flows-vignette"
output: rmarkdown::html_vignette
vignette: >
  %\VignetteIndexEntry{peak-flows-vignette}
%\VignetteEngine{knitr::rmarkdown}
%\VignetteEncoding{UTF-8}
---

  ```{r, include = FALSE}
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)
```

```{r setup}
library(peakflows)
```

## Introduction

## Data
The data includes information from six USGS stations from Nevada including:
  Carson River near Carson City (10311000), Clear Creek near Carson City
(10310500), East Fork Carson River near Gardnerville (10309000), Ash Canyon
Creek near Carson City (10311200), Kings Canyon Creek near Carson City
(10311100), and East Fork Carson River below Markleeville (10308200).

## Subsetting the Peak Level

### Example

## Sort by Station
Say that we are only interested at looking at the information from
Kings Canyon Creek, and we want to see any floods that are at 75 percent flood
level. We can filter for these specific data as well using the df_peaks_filt()
function. This function is very similar to the above function but it will also
filter the data based on station. The station must be from one of the specifc
stations in the data set and one of the specified flood levels.

### Example

Below is an example finding the peaks above 75 percent flood level
for Kings Canyo Creek.

'''{r}

df_peaks_filt(station = "10311100", minpeaks_spec = 75)

'''

## Plotting the Data

### Example

## Summary

## Conclusion
