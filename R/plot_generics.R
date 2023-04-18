# # graph for verification
# # sub <- dplyr::filter(rhv_tot, id == "10311100")
# # peaks <- dplyr::filter(peaks_df, id == "10311100")
#
# # ros classification plot
# ggplot(sub, aes(x = as.POSIXct(datetime), y = max_flow)) +
#   geom_point(size = .2, col = "grey50") +
#   ggtitle("2017: Streamflow Peaks at Station 10311100") +
#   theme(plot.title = element_text(hjust = 0.5)) +
#   xlab("DateTime") +
#   xlim(lubridate::ymd_h(2017020101, tz = "US/Pacific"),
#        lubridate::ymd_h(2017022823, tz = "US/Pacific")) +
#   ylab("Discharge amount (ft^3 per sec)") +
#   scale_y_continuous(limits = c(0, 140), breaks = seq(0, 140, 20)) +
#   # add points for defined peaks
#   geom_point(data = peaks, aes(as.POSIXct(dt), y),
#              color = ifelse(peaks$ros == "ros",
#                             "#335978",
#                             ifelse(peaks$ros == "pot-ros",
#                                    "#41ab5d", "#bf812d")
#              )
#   )
#
# Creating the function...
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
