#' This function makes a dataframe containing peak information for all stations
#' based off of the flood type parameter
#'
#' @param minpeaks_spec A number that is equal to 50, 75, or 100. This parameter
#'                      specifies the type of flood that the user wants the
#'                      peak information for.
#' @export
#' @examples
#' df_peaks_all(50)
#' df_peaks_all(75)
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
