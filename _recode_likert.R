# Copyright 2026, Christopher J. Carlson
# All Rights Reserved
#
# Recode Likert Scale Helper
# Recodes Likert character responses to numeric factors.
# Handles both normal and reverse-scored items.

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
