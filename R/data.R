#' USGS hourly streamflow data
#'
#' A subset of data from the USGS website for six different stream gauges in
#'   the Sierra Nevada.
#'
#' @format ## `rhv_tot`
#' A data frame with 1,734,174 rows and 3 columns:
#' \describe{
#'   \item{id}{USGS station ID (8-digit)}
#'   \item{datetime}{Hourly reported date and time of streamflow measurement}
#'   \item{max_flow}{Streamflow measurement (cfs)}
#' }
#' @source <https://waterdata.usgs.gov/nwis/>
"rhv_tot"


#' Flood stage cutoffs for USGS stations
#'
#' Data frame specifying cutoffs for flood stages at six different USGS
#'   stations in the Sierra Nevada.
#'
#' @format ## `cutoffs`
#' A data frame with 6 rows and 7 columns:
#' \describe{
#'   \item{stations}{USGS station ID (8-digit)}
#'   \item{major}{Minimum cutoff for major flood stage}
#'   \item{minor}{Minimum cutoff for minor flood stage}
#'   \item{fson}{Whether or not the station has a published flood stage}
#'   \item{minpeaks100}{Cutoff proportional to max peak for only floods to be
#'   reported as peaks}
#'   \item{minpeaks75}{Cutoff proportional to max peak for all floods and peaks
#'   more than 75% of the flood/minor cutoff to be reported as peaks}
#'   \item{minpeaks50}{Cutoff proportional to max peak for all floods and peaks
#'   more than 50% of the flood/minor cutoff to be reported as peaks}
#' }
#' @source <https://www.cnrfc.noaa.gov/>
"cutoffs"
