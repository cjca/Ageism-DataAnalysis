# Scatter Plot Helper
# Supports optional color grouping and a loess trend line.
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

graph_scatter <- function(df,
                           x_category,
                           y_category,
                           x_label,
                           y_label,
                           chart_title = NULL,
                           subtitle    = NULL,
                           color_var   = NULL,
                           trend_line  = FALSE,
                           trend_method = "loess",
                           x_breaks     = NULL,
                           x_limits     = NULL,
                           y_breaks     = NULL,
                           y_labels     = NULL) {

  if (!is.null(color_var)) {
    p <- ggplot(df, aes(
      x     = .data[[x_category]],
      y     = .data[[y_category]],
      color = .data[[color_var]]
    ))
  } else {
    p <- ggplot(df, aes(
      x = .data[[x_category]],
      y = .data[[y_category]]
    ))
  }

  if (!is.null(color_var)) {
    p <- p +
      geom_point(alpha = 0.65, size = 2.5) +
      scale_color_tableau(name = color_var)
  } else {
    p <- p + geom_point(color = "steelblue", 
                        alpha = 0.65, 
                        size = 2.5)
  }

  if (trend_line) {
    p <- p + geom_smooth(method = trend_method, 
                         se = TRUE,
                         formula = y ~ x,
                         color = "gray40", 
                         linewidth = 0.8, 
                         linetype = "dashed")
  }

  if (!is.null(x_breaks)) {
    p <- p + scale_x_continuous(breaks = x_breaks, limits = x_limits)
  }
  
  if (!is.null(y_breaks)) {
    p <- p + scale_y_continuous(breaks = y_breaks, labels = y_labels)
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
        face = "bold")
    )
}
