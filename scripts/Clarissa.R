peak_plot(10311000, 100, 2017010100, 2017020100)

peak_plot(10311100, 100, 2017010100, 2017020100)

peak_plot(10308200, 100, 2017010100, 2017020100)


# peak_plot comments:

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
