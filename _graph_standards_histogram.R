# Copyright 2026, Christopher J. Carlson
# All Rights Reserved
#
# Histogram Helper
# Simple histogram with steelblue fill and configurable binwidth.

graph_histogram <- function(df,
                            x_category,
                            x_label,
                            y_label,
                            chart_title = NULL,
                            binwidth = 5,
                            lower_x = 0,
                            upper_x = 100,
                            subtitle = NULL) {

  ggplot(df, aes(x = .data[[x_category]])) +
    geom_histogram(binwidth = binwidth, fill = "steelblue", color = "white") +
    labs(
      title    = chart_title,
      subtitle = subtitle,
      x        = x_label,
      y        = y_label
    ) +
    coord_cartesian(xlim = c (lower_x, upper_x)) +
    theme_clean() +
    theme(
      axis.title.x = element_text(
        margin = margin(t = 12), 
        size = 14, 
        face = "bold"),
      axis.title.y = element_text(
        margin = margin(r = 12), 
        size = 14, 
        face = "bold"),
      panel.grid.major.x = element_blank(),
      panel.grid.minor   = element_blank()
    )
}
