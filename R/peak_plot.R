#' Plot streamflow peaks
#'
#' Function to plot peak streamflows for user-specified USGS stations and time
#'     periods.
#'
#' @param station A character string or numeric object from the following list
#' of station IDs: "10311000", "10310500" , "10309000", "10311200",
#' "10311100", or "10308200."
#'
#' @param peaks Numeric object from following list: 100, 75, 50. Specifies
#' amount/type of peaks to include in graph.
#'
#'     100: only include peaks which are floods
#'     75: include all peaks which are floods as well as any peak whose size
#'     is more than 75% of the flood stage threshold
#'     50: include all peaks which are floods as well as any peak whose size
#'     is more than 50% of the flood stage threshold
#'
#' @param beg_date,end_date Numeric objects with 10 digits specifying
#' (in order) the year, month, day, and hour of the beginning and end dates
#' desired for the plot. For example, March 16, 1997 at 4pm would be designated
#' by: 1997031616.
#'
#' Specified start dates must be after the first available date for each
#' station. Begin dates for periods of records for station data are
#' listed below:
#'
#'     10311000: 1989-10-01 01:00:00
#'     10310500: 1989-01-19 00:00:00
#'     10309000: 1990-10-01 01:00:00
#'     10311200: 1990-10-01 01:00:00
#'     10311100: 1990-10-01 01:00:00
#'     10308200: 1990-10-01 01:00:00
#'
#' @import ggplot2
#' @export
peak_plot <- function(station, peaks, beg_date, end_date) {
  # filter data frame for selected station
  sub <- dplyr::filter(rhv_tot, id == as.character(station) &
                         dplyr::between(datetime,
                                        lubridate::ymd_h(beg_date,
                                                         tz = "US/Pacific"),
                                        lubridate::ymd_h(end_date,
                                                         tz = "US/Pacific")
                         )
  )

  # add points for defined peaks
  peaks_df <- df_peaks_filt(station, peaks)

  # set maximum of y axis
  y_max <- max(dplyr::filter(peaks_df,
                             dplyr::between(dt,
                                            lubridate::ymd_h(beg_date,
                                                             tz = "US/Pacific"),
                                            lubridate::ymd_h(end_date,
                                                             tz = "US/Pacific")
                                            )
                             )$y
               )

  # create plot of data and peak classification
  ggplot2::ggplot(sub, ggplot2::aes(x = as.POSIXct(datetime),
                                    y = max_flow)) +
    geom_point(size = .2, col = "grey50") +
    ggtitle(paste0("Streamflow Peaks at Station ",
                   as.character(station))) +
    theme(plot.title = element_text(hjust = 0.5)) +
    xlab("DateTime") +
    scale_x_datetime(
      limits = c(lubridate::ymd_h(beg_date, tz = "US/Pacific"),
                 lubridate::ymd_h(end_date, tz = "US/Pacific")),
      date_breaks = "1 week",
      date_labels = "%m-%d-%y"
      ) +
    ylab("Discharge amount (ft^3 per sec)") +
    scale_y_continuous(
      limits = c(0, ifelse(y_max + 0.2 * y_max > 20000,
                           plyr::round_any(y_max + 0.2 * y_max, 10000),
                           ifelse(y_max + 0.2 * y_max > 2000,
                                  plyr::round_any(y_max + 0.2 * y_max, 1000),
                                  ifelse(y_max + 0.2 * y_max > 200,
                                         plyr::round_any(y_max + 0.2 * y_max,
                                                         100),
                                         plyr::round_any(y_max + 0.2 * y_max,
                                                         10))))),
      n.breaks = 5, breaks = waiver()) +
    geom_point(data = peaks_df, aes(as.POSIXct(dt), y),
               color = ifelse(peaks_df$type %in% c("major", "flood"),
                              "red3",
                              ifelse(peaks_df$type == "minor",
                                     "gold", "green3")
               )
    )
}


# y_max <- 3050
# # lims
# ifelse(y_max + 0.2 * y_max > 20000, plyr::round_any(y_max + 0.2 * y_max, 10000),
#        ifelse(y_max + 0.2 * y_max > 2000,
#               plyr::round_any(y_max + 0.2 * y_max, 1000),
#               ifelse(y_max + 0.2 * y_max > 200,
#                      plyr::round_any(y_max + 0.2 * y_max, 100),
#                      plyr::round_any(y_max + 0.2 * y_max, 10))))
#
# # breaks
# ifelse(y_max + 0.2 * y_max > 20000, seq(0, y_max + 0.2 * y_max, 10000),
#        ifelse(y_max + 0.2 * y_max > 2000,
#               seq(0, y_max + 0.2 * y_max, 1000),
#               ifelse(y_max + 0.2 * y_max > 200,
#                      seq(0, y_max + 0.2 * y_max, 100),
#                      seq(0, y_max + 0.2 * y_max, 10))))


