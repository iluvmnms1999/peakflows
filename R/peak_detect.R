#' df_peaks_all
#'
#' This function makes a dataframe containing peak information for all stations
#' based off of the flood type parameter
#'
#' @param minpeaks_spec A number that is equal to 50, 75, or 100. This parameter
#'                      specifies the type of flood that the user wants the
#'                      peak information for.
#' @examples
#' df_peaks_all(50)
#' df_peaks_all(75)
## get peaks for all stations with specified minpeaks according to stages
#' @export
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

#' df_peaks_filt
#'
#' This function filters through the dataset peaks_list and filters for the
#' user specified station, and peak level.
#'
#' @param station A character or numeric object which specifies which station
#' the user is interested in. Must be one of the following station ID's:
#' '10311000', '10310500' , '10309000', '10311200', '10311100', or '10308200'.
#' @param minpeaks_spec A numeric object either 100, 75, or 50, which specifies
#' which peak level to filter for.
#'
#'
#' @return A data frame that includes id, date and time,
#' flow, and type of flood
#' @export
df_peaks_filt <- function(station, minpeaks_spec = 100) {
  char_station <- as.character(station)
  correct_ids <- c("10311000", "10310500", "10309000",
                   "10311200", "10311100", "10308200")
  if (!(char_station %in% correct_ids)) {
    stop("Invalid station id. Station must be one of the following :
         '10311000', '10310500' , '10309000', '10311200', '10311100',
         '10308200'")
  }
  df_peaks_all <- df_peaks_all(minpeaks_spec)
  filt <- dplyr::filter(df_peaks_all, id == char_station)
  filt
}

peakdf <- function(df, fs, minpeak, min_cutoff, maj_cutoff = 1) {
  peakspor <- cardidates::peakwindow(df$datetime, df$max_flow,
                                     minpeak = minpeak)
  peakspordf <- peakspor[[1]]
  dt <- as.POSIXct(peakspor[[1]][, 3], "US/Pacific", origin = "1970-01-01")
  peakspordf$dt <- dt
  if (fs == TRUE) {
    peakspordf$type <- mm_cutoff(peakspordf, min_cutoff, maj_cutoff)
  } else {
    peakspordf$type <- f_cutoff(peakspordf, min_cutoff)
  }
  peakspordf$id <- rep(df$id[1], nrow(peakspordf))
  peakspordf[, c(8, 6, 5, 7)]
}

f_cutoff <- function(df, min_cutoff) {
  type <- vector()
  for (i in seq_len(nrow(df))){
    if (df$y[i] >= min_cutoff) {
      type[i] <- "flood"
    } else {
      type[i] <- "naf"
    }
  }
  type
}

mm_cutoff <- function(df, min_cutoff, maj_cutoff) {
  type <- vector()
  for (i in seq_len(nrow(df))){
    if (df$y[i] >= maj_cutoff) {
      type[i] <- "major"
    } else if (df$y[i] < maj_cutoff && df$y[i] >= min_cutoff) {
      type[i] <- "minor"
    } else {
      type[i] <- "naf"
    }
  }
  type
}
