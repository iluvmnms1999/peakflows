stations <- c("10311000", "10310500", "10309000", "10311200",
              "10311100", "10308200")
major <- c(8300, NA, 10000, NA, NA, 14354)
minor <- c(7000, 45, 5500, 26, 14.75, 7400)
fson <- c(TRUE, FALSE, TRUE, FALSE, FALSE, TRUE)
minpeaks100 <- c(0.230, 0.169, 0.417, 0.077, 0.117, 0.392)
minpeaks75 <- c(0.172, 0.127, 0.313, 0.058, 0.088, 0.294)
minpeaks50 <- c(0.115, 0.085, 0.208, 0.039, 0.059, 0.196)

cutoffs <- data.frame(stations, major, minor, fson, minpeaks100, minpeaks75,
                      minpeaks50)

usethis::use_data(cutoffs, overwrite = TRUE)
