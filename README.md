# Ageism in the Information Technology Workforce

This repository exists to support the dissertation "Ageism in the Information 
Technology Workforce" being written by Christopher Carlson for my EdD degree 
at the College of Saint Scholastica.

Committee Members
* Dr. David Marc, PhD (Chair)
* Dr. Thomas Gibbons, PhD
* Dr. Niall Klyn, PhD

All data in this repository is either sample data or data that is completely 
anonymized.

# Session Data

Session data is subject to change. The data should compile successfully with
the minimum versions displayed below.

* Data analysis completed using R 4.6.0 with RStudio 2026.05.1+225.

* Data presentation completed using Quarto 1.9.37 and Pandoc 3.8.3.

```
 version  R version 4.6.0 (2026-04-24 ucrt)
 os       Windows 11 x64 (build 26200)
 system   x86_64, mingw32
 ui       RStudio
 language (EN)
 collate  English_United States.utf8
 ctype    English_United States.utf8
 tz       America/Chicago
 date     2026-06-19
 rstudio  2026.05.1+225 Golden Wattle (desktop)
 pandoc   3.8.3 @ C:/Program Files/RStudio/resources/app/bin/quarto/bin/tools/ (via rmarkdown)
 quarto   1.9.37 @ C:\\PROGRA~1\\RStudio\\RESOUR~1\\app\\bin\\quarto\\bin\\quarto.exe

─ Packages ───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
 package      * version date (UTC) lib source
 backports      1.5.1   2026-04-03 [1] CRAN (R 4.6.0)
 broom        * 1.0.12  2026-01-27 [1] CRAN (R 4.6.0)
 cachem         1.1.0   2024-05-16 [1] CRAN (R 4.6.0)
 cli            3.6.6   2026-04-09 [1] CRAN (R 4.6.0)
 devtools       2.5.2   2026-04-30 [1] CRAN (R 4.6.0)
 digest         0.6.39  2025-11-19 [1] CRAN (R 4.6.0)
 dplyr        * 1.2.1   2026-04-03 [1] CRAN (R 4.6.0)
 ellipsis       0.3.3   2026-04-04 [1] CRAN (R 4.6.0)
 evaluate       1.0.5   2025-08-27 [1] CRAN (R 4.6.0)
 farver         2.1.2   2024-05-13 [1] CRAN (R 4.6.0)
 fastmap        1.2.0   2024-05-15 [1] CRAN (R 4.6.0)
 forcats      * 1.0.1   2025-09-25 [1] CRAN (R 4.6.0)
 fs             2.1.0   2026-04-18 [1] CRAN (R 4.6.0)
 generics       0.1.4   2025-05-09 [1] CRAN (R 4.6.0)
 ggplot2      * 4.0.3   2026-04-22 [1] CRAN (R 4.6.0)
 ggthemes     * 5.2.0   2025-11-30 [1] CRAN (R 4.6.0)
 glue           1.8.1   2026-04-17 [1] CRAN (R 4.6.0)
 gtable         0.3.6   2024-10-25 [1] CRAN (R 4.6.0)
 hms            1.1.4   2025-10-17 [1] CRAN (R 4.6.0)
 htmltools      0.5.9   2025-12-04 [1] CRAN (R 4.6.0)
 kableExtra   * 1.4.0   2024-01-24 [1] CRAN (R 4.6.0)
 knitr          1.51    2025-12-20 [1] CRAN (R 4.6.0)
 labeling       0.4.3   2023-08-29 [1] CRAN (R 4.6.0)
 lattice        0.22-9  2026-02-09 [2] CRAN (R 4.6.0)
 lifecycle      1.0.5   2026-01-08 [1] CRAN (R 4.6.0)
 lubridate    * 1.9.5   2026-02-04 [1] CRAN (R 4.6.0)
 magrittr       2.0.5   2026-04-04 [1] CRAN (R 4.6.0)
 Matrix         1.7-5   2026-03-21 [2] CRAN (R 4.6.0)
 memoise        2.0.1   2021-11-26 [1] CRAN (R 4.6.0)
 mgcv           1.9-4   2025-11-07 [2] CRAN (R 4.6.0)
 nlme           3.1-169 2026-03-27 [2] CRAN (R 4.6.0)
 papaja       * 0.1.5   2026-06-05 [1] CRAN (R 4.6.0)
 pillar         1.11.1  2025-09-17 [1] CRAN (R 4.6.0)
 pkgbuild       1.4.8   2025-05-26 [1] CRAN (R 4.6.0)
 pkgconfig      2.0.3   2019-09-22 [1] CRAN (R 4.6.0)
 pkgload        1.5.3   2026-06-15 [1] CRAN (R 4.6.0)
 purrr        * 1.2.2   2026-04-10 [1] CRAN (R 4.6.0)
 R6             2.6.1   2025-02-15 [1] CRAN (R 4.6.0)
 RColorBrewer   1.1-3   2022-04-03 [1] CRAN (R 4.6.0)
 readr        * 2.2.0   2026-02-19 [1] CRAN (R 4.6.0)
 rlang          1.2.0   2026-04-06 [1] CRAN (R 4.6.0)
 rmarkdown      2.31    2026-03-26 [1] CRAN (R 4.6.0)
 rstudioapi     0.18.0  2026-01-16 [1] CRAN (R 4.6.0)
 S7             0.2.2   2026-04-22 [1] CRAN (R 4.6.0)
 scales         1.4.0   2025-04-24 [1] CRAN (R 4.6.0)
 sessioninfo    1.2.4   2026-06-04 [1] CRAN (R 4.6.0)
 stringi        1.8.7   2025-03-27 [1] CRAN (R 4.6.0)
 stringr      * 1.6.0   2025-11-04 [1] CRAN (R 4.6.0)
 svglite        2.2.2   2025-10-21 [1] CRAN (R 4.6.0)
 systemfonts    1.3.2   2026-03-05 [1] CRAN (R 4.6.0)
 textshaping    1.0.5   2026-03-06 [1] CRAN (R 4.6.0)
 tibble       * 3.3.1   2026-01-11 [1] CRAN (R 4.6.0)
 tidyr        * 1.3.2   2025-12-19 [1] CRAN (R 4.6.0)
 tidyselect     1.2.1   2024-03-11 [1] CRAN (R 4.6.0)
 tidyverse    * 2.0.0   2023-02-22 [1] CRAN (R 4.6.0)
 timechange     0.4.0   2026-01-29 [1] CRAN (R 4.6.0)
 tinylabels   * 0.2.5   2025-03-20 [1] CRAN (R 4.6.0)
 tzdb           0.5.0   2025-03-15 [1] CRAN (R 4.6.0)
 usethis        3.2.1   2025-09-06 [1] CRAN (R 4.6.0)
 utf8           1.2.6   2025-06-08 [1] CRAN (R 4.6.0)
 vctrs          0.7.3   2026-04-11 [1] CRAN (R 4.6.0)
 viridisLite    0.4.3   2026-02-04 [1] CRAN (R 4.6.0)
 withr          3.0.2   2024-10-28 [1] CRAN (R 4.6.0)
 xfun           0.57    2026-03-20 [1] CRAN (R 4.6.0)
 xml2           1.5.2   2026-01-17 [1] CRAN (R 4.6.0)
 ```
 
 