#' Plot the Function
#'
#' @param station A character or numeric object which specifies which station
#' the user is interested in. Must be one of the following station ID's:
#' '10311000', '10310500' , '10309000', '10311200', '10311100', or '10308200'.
#'
#' @param peaks Not sure yet
#'
#' @param beg_date An object of class Date-Time representing the beginning date
#'    of when to include the data in the graph represented in the format
#'    YYYY-MM-DD.
#'
#' @param end_date An object of class Date-Time representing the end date of
#'    when to include the data in the graph represented in the format
#'    YYYY-MM-DD.
#'
#' @param x An object required to run the function
#' @param y An object required to run the function
#' @param ... Other parameters
#'
#' @export
plot.peakflows <- function(station, peaks, beg_date, end_date, x, y, ...) {
  # filter data frame for selected station
  sub <- dplyr::filter(rhv_tot, id == as.character(station))
  # add points for defined peaks
  peaks_df <- df_peaks_filt(station, peaks)
  ggplot2::ggplot(sub, aes(x = as.POSIXct(datetime), y = max_flow)) +
    geom_point(size = .2, col = "grey50") +
    ggtitle(paste0("Streamflow Peaks at Station",
                   as.character(station))) +
    theme(plot.title = element_text(hjust = 0.5)) +
    xlab("DateTime") +
    xlim(lubridate::ymd_h(beg_date, tz = "US/Pacific"),
         lubridate::ymd_h(end_date, tz = "US/Pacific")) +
    ylab("Discharge amount (ft^3 per sec)") +
    scale_y_continuous(limits = c(0, 140), breaks = seq(0, 140, 20)) +
    geom_point(data = peaks_df, aes(as.POSIXct(dt), y),
               color = ifelse(peaks_df$type %in% c("major", "flood"),
                              "red3",
                              ifelse(peaks_df$type == "minor",
                                     "gold", "green3")
               )
    )
}
