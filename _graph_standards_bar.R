# Bar Chart Helper
# Supports horizontal and vertical orientations, pre-computed y values,
# fill color grouping, bar-end and inside-bar labels, and custom axis scales.
#
# Copyright (C) 2026 Christopher J. Carlson
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.

graph_bar_chart <- function(df,
                             x_category,
                             x_label,
                             y_label,
                             chart_title      = NULL,
                             y_category       = NULL,
                             fill_var         = NULL,
                             position         = "identity",
                             label_col        = NULL,
                             inside_label_col = NULL,
                             subtitle         = NULL,
                             horizontal       = TRUE,
                             y_limits         = NULL,
                             y_breaks         = NULL,
                             y_labels         = NULL) {

  if (is.null(y_category)) {
    df_plot <- df |> count(!!sym(x_category))
    y_col   <- "n"
  } else {
    df_plot <- df
    y_col   <- y_category
  }

  if (horizontal) {
    x_data <- df_plot[[x_category]]
    if (is.factor(x_data)) {
      wrapped_levels <- str_wrap(levels(x_data), width = 18)
      df_plot <- df_plot |>
        mutate(!!x_category := factor(
          str_wrap(as.character(.data[[x_category]]), width = 18),
          levels = wrapped_levels
        ))
    } else {
      df_plot <- df_plot |>
        mutate(!!x_category := str_wrap(.data[[x_category]], width = 18))
    }
  }

  lbl <- if (!is.null(label_col)) label_col else y_col

  if (horizontal) {
    if (!is.null(fill_var)) {
      p <- ggplot(df_plot, aes(x = .data[[y_col]], y = .data[[x_category]],
                               fill = .data[[fill_var]]))
    } else {
      p <- ggplot(df_plot, aes(x = .data[[y_col]], y = .data[[x_category]]))
    }
  } else {
    if (!is.null(fill_var)) {
      p <- ggplot(df_plot, aes(x = .data[[x_category]], y = .data[[y_col]],
                               fill = .data[[fill_var]]))
    } else {
      p <- ggplot(df_plot, aes(x = .data[[x_category]], y = .data[[y_col]]))
    }
  }

  if (!is.null(fill_var)) {
    p <- p + geom_col(position = position)
  } else {
    p <- p + geom_col(fill = "steelblue", position = position)
  }

  if (horizontal) {
    p <- p + geom_text(aes(label = .data[[lbl]]), hjust = -0.3)
  } else {
    p <- p + geom_text(aes(label = .data[[lbl]]),
                       vjust = -0.5, size = 3.5, fontface = "bold")
  }

  if (!is.null(inside_label_col)) {
    if (horizontal) {
      p <- p + geom_text(aes(label = .data[[inside_label_col]]),
                         hjust = 1.2, size = 3, color = "white")
    } else {
      p <- p + geom_text(aes(label = .data[[inside_label_col]]),
                         vjust = 2, size = 3, color = "white")
    }
  }

  if (!is.null(fill_var)) {
    p <- p + scale_fill_tableau(guide = "none")
  }

  if (horizontal) {
    p <- p + scale_x_continuous(
      limits = y_limits, breaks = y_breaks, labels = y_labels,
      expand = expansion(mult = c(0, 0.15)), minor_breaks = NULL
    )
  } else {
    p <- p + scale_y_continuous(
      limits = y_limits, breaks = y_breaks, labels = y_labels,
      expand = expansion(mult = c(0, 0.15)), minor_breaks = NULL
    )
  }

  if (horizontal) {
    p <- p + labs(title = chart_title, subtitle = subtitle,
                  y = x_label, x = y_label)
  } else {
    p <- p + labs(title = chart_title, subtitle = subtitle,
                  x = x_label, y = y_label)
  }

  p +
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
      plot.subtitle = element_text(size = 11),
      panel.grid.major.y = element_blank(),
      panel.grid.minor.y = element_blank(),
    )
}
