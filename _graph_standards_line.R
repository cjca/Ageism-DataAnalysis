# Copyright 2026, Christopher J. Carlson
# All Rights Reserved
#
# Line Chart Helper
# Supports single and multi-line charts, CI ribbons, faceting,
# reference lines, and custom y-axis scales.

graph_line_chart <- function(df,
                              x_category,
                              y_category,
                              x_label,
                              y_label,
                              chart_title = NULL,
                              subtitle   = NULL,
                              color_var  = NULL,
                              facet_var  = NULL,
                              ci_lo      = NULL,
                              ci_hi      = NULL,
                              midpoint   = NULL,
                              y_limits   = NULL,
                              y_breaks   = NULL,
                              y_labels   = NULL) {

  # Base aesthetics: multi-line (color_var) or single line
  if (!is.null(color_var)) {
    p <- ggplot(df, aes(
      x     = .data[[x_category]],
      y     = .data[[y_category]],
      color = .data[[color_var]],
      group = .data[[color_var]]
    ))
  } else {
    p <- ggplot(df, aes(
      x     = .data[[x_category]],
      y     = .data[[y_category]],
      group = 1
    ))
  }

  # Optional CI ribbon
  if (!is.null(ci_lo) && !is.null(ci_hi)) {
    if (!is.null(color_var)) {
      p <- p + geom_ribbon(
        aes(ymin = .data[[ci_lo]], ymax = .data[[ci_hi]],
            fill = .data[[color_var]]),
        alpha = 0.08, color = NA
      )
    } else {
      p <- p + geom_ribbon(
        aes(ymin = .data[[ci_lo]], ymax = .data[[ci_hi]]),
        fill = "steelblue", alpha = 0.15
      )
    }
  }

  # Line and points
  if (!is.null(color_var)) {
    p <- p +
      geom_line(linewidth = 1.1) +
      geom_point(size = 2.5) +
      scale_color_tableau(name = color_var) +
      scale_fill_tableau(guide = "none")
  } else {
    p <- p +
      geom_line(color = "steelblue", linewidth = 1.2) +
      geom_point(color = "steelblue", size = 3)
  }

  # Optional reference line
  if (!is.null(midpoint)) {
    p <- p + geom_hline(
      yintercept = midpoint,
      linetype   = "dashed",
      color      = "gray60",
      linewidth  = 0.4
    )
  }

  # Optional faceting
  if (!is.null(facet_var)) {
    p <- p + facet_wrap(~ .data[[facet_var]], ncol = 2)
  }

  # Optional custom y-axis
  if (!is.null(y_limits) || !is.null(y_breaks) || !is.null(y_labels)) {
    p <- p + scale_y_continuous(
      limits = y_limits,
      breaks = y_breaks,
      labels = y_labels
    )
  }

  p +
    labs(
      title    = chart_title,
      subtitle = subtitle,
      x        = x_label,
      y        = y_label
    ) +
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
      axis.text.x        = element_text(angle = 45, hjust = 1, size = 8),
      panel.grid.minor   = element_blank(),
      panel.grid.major.x = element_blank(),
      strip.text         = element_text(face = "bold", size = 11),
      panel.spacing      = unit(1, "lines")
    )
}