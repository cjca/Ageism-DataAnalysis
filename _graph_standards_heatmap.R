# Copyright 2026, Christopher J. Carlson
# All Rights Reserved
#
# Heatmap Helper
# Computes row percentages internally and renders a tile heatmap.
# Auto-sorts y levels descending so higher values appear at the top.

graph_heatmap <- function(df,
                           x_category,
                           y_category,
                           x_label,
                           y_label,
                           chart_title = NULL,
                           subtitle = NULL,
                           y_labels = NULL) {

  # Sort y levels descending so lower values appear at the top of the chart
  y_vals <- sort(unique(df[[y_category]]), decreasing = FALSE)

  df_heat <- df |>
    count(!!sym(x_category), !!sym(y_category)) |>
    group_by(!!sym(x_category)) |>
    mutate(pct = n / sum(n) * 100) |>
    ungroup() |>
    mutate(!!sym(y_category) := factor(!!sym(y_category), levels = y_vals))

  p <- ggplot(df_heat, aes(
      x    = !!sym(x_category),
      y    = !!sym(y_category),
      fill = pct
    )) +
    geom_tile(color = "white", linewidth = 0.5) +
    geom_text(
      aes(label = sprintf("%.0f%%", pct)),
      size     = 3.2,
      color    = "white",
      fontface = "bold"
    ) +
    scale_fill_gradient(
      low  = "#D0E4F2",
      high = "#1A5276",
      name = "% of\nRespondents"
    ) +
    labs(
      title    = chart_title,
      subtitle = subtitle,
      x        = x_label,
      y        = y_label
    ) +
    theme_clean(base_size = 13) +
    theme(
      axis.title.x = element_text(
        margin = margin(t = 12), 
        size = 14, 
        face = "bold"),
      axis.title.y = element_text(
        margin = margin(r = 12), 
        size = 14, 
        face = "bold"),
      axis.text.x     = element_text(angle = 45, hjust = 1),
      
      panel.grid      = element_blank(),
      legend.position = "right"
    )

  if (!is.null(y_labels)) {
    p <- p + scale_y_discrete(labels = y_labels)
  }

  p
}
