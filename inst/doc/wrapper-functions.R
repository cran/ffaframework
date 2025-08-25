## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----fig.width = 10, fig.height = 8, fig.align = "center", out.width = "100%"----
library(ffaframework)

df <- data_local("CAN-05BB001.csv")
head(df)

plot_ams_data(df$max, df$year, title = "Bow River at Banff (05BB001)")

## -----------------------------------------------------------------------------
results <- framework_eda(df$max, df$year, generate_report = FALSE)

print(results$eda_recommendations)

## ----fig.width = 10, fig.height = 8, fig.align = "center", out.width = "100%"----
pettitt_results <- results$submodule_results[[1]]$tests$pettitt
mks_results <- results$submodule_results[[1]]$tests$mks

plot_pettitt_test(pettitt_results)
plot_mks_test(mks_results)

## ----eval = FALSE-------------------------------------------------------------
# framework_full(
# 	df$max,
# 	df$year,
# 	ns_splits = NULL,
# 	ns_structures = list(list(location = TRUE, scale = FALSE)),
# 	generate_report = TRUE,
# 	report_path = "~",
# 	report_formats = "html"
# )

