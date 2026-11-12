# Histogram Helper
# Simple histogram with steelblue fill and configurable binwidth.
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
