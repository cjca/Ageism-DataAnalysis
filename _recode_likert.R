# Recode Likert Scale Helper
# Recodes Likert character responses to numeric factors.
# Handles both normal and reverse-scored items.
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

recode_likert <- function(df, pattern, normal_map, reverse_map, reverse_vars) {
  df |>
    mutate(across(
      starts_with(pattern),
      ~ {
        colname <- cur_column()
        rules   <- if (colname %in% reverse_vars) reverse_map else normal_map
        recoded <- rules[as.character(.x)]
        if (any(is.na(recoded) & !is.na(.x))) {
          warning("Unmapped values in column: ", colname)
        }
        factor(recoded, levels = unname(rules))
      }
    ))
}
