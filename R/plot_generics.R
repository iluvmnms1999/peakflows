# graph for verification
sub <- filter(shv_tot, id == "10311100")
peaks <- filter(peaks_df, id == "10311100")

# ros classification plot
ggplot(sub, aes(x = as.POSIXct(datetime), y = max_flow)) +
  geom_point(size = .2, col = "grey50") +
  ggtitle("2017: Streamflow Peaks at Station 10311100") +
  theme(plot.title = element_text(hjust = 0.5)) +
  xlab("DateTime") +
  xlim(ymd_h(2017020101, tz = "US/Pacific"),
       ymd_h(2017022823, tz = "US/Pacific")) +
  ylab("Discharge amount (ft^3 per sec)") +
  scale_y_continuous(limits = c(0, 140), breaks = seq(0, 140, 20)) +
  # add points for defined peaks
  geom_point(data = peaks, aes(as.POSIXct(dt), y),
             color = ifelse(peaks$ros == "ros",
                            "#335978",
                            ifelse(peaks$ros == "pot-ros",
                                   "#41ab5d", "#bf812d")
             )
  )
