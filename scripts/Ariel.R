#' This function makes a dataframe containing peak information for all stations
#' based off of the flood type parameter
#'
#' @param minpeaks_spec A number that is equal to 50, 75, or 100. This parameter
#'                      specifies the type of flood that the user wants the
#'                      peak information for.
#' @export
#' @examples
#' df_peaks_all(50)
## get peaks for all stations with specified minpeaks according to stages
df_peaks_all <- function(minpeaks_spec = 100) {
  peaks_list <- vector("list", length = nrow(cutoffs))
  for (i in seq_len(nrow(cutoffs))) {
    temp <- dplyr::filter(rhv_tot, id == cutoffs$stations[i])
    if (minpeaks_spec == 100) {
      peaks <- peakdf(temp, fs = cutoffs$fson[i],
                      minpeak = cutoffs$minpeaks100[i],
                      min_cutoff = cutoffs$minor[i],
                      maj_cutoff = cutoffs$major[i])
    } else if (minpeaks_spec == 75) {
      peaks <- peakdf(temp, fs = cutoffs$fson[i],
                      minpeak = cutoffs$minpeaks75[i],
                      min_cutoff = cutoffs$minor[i],
                      maj_cutoff = cutoffs$major[i])
    } else {
      peaks <- peakdf(temp, fs = cutoffs$fson[i],
                      minpeak = cutoffs$minpeaks50[i],
                      min_cutoff = cutoffs$minor[i],
                      maj_cutoff = cutoffs$major[i])
    }
    peaks_list[[i]] <- peaks
  }
  peaks_mat <- do.call(rbind, peaks_list)
  peaks_df <- as.data.frame(peaks_mat)
  peaks_df
}












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

## Subsetting the Peak Level
# This function takes flooding data (peaks) from all of the stations. The user specifies
# the subset of flooding data that is of interest by calling the df_peaks_all function and inputting
# either a 50, 75, or 100 as the argument. Entering a 100 returns a data frame containing
# peaks that are above the flooding threshold. Entering a 75 returns a data frame containing
# peaks that are above the flooding threshold and all peaks that are above 75% of the
# flooding threshold. Entering a 50 returns a data frame containing peaks that are above
# the flooding threshold and all peaks that are above 50% of the flooding threshold. The data frame
# that is returned by this function can then be used for further analysis.


### Example
# The following code demonstrates how to call the df_peaks_all function.
# df_peaks_all(100)


## Sort by Station

### Example

## Plotting the Data

### Example

## Summary

## Conclusion

