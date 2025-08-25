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
ns_structure <- list(location = TRUE, scale = FALSE)

## ----fig.width = 10, fig.height = 8, fig.align = "center", out.width = "100%"----
selection <- select_ldistance(
	df$max,
	ns_years = df$year,
	ns_structure = ns_structure
)

print(selection$recommendation)

plot_lmom_diagram(selection)

## ----fig.width = 10, fig.height = 8, fig.align = "center", out.width = "100%"----
fit <- fit_mle(
	df$max,
	"GNO",
	ns_years = df$year,
	ns_structure = ns_structure
)

print(fit$params)

print(fit$mll)

plot_nsffa_fit(fit, slices = c(1915, 2015))

## ----fig.width = 10, fig.height = 8, fig.align = "center", out.width = "100%"----
uncertainty <- uncertainty_rfpl(
	df$max,
	"GNO",
	ns_years = df$year,
	ns_structure = ns_structure,
	ns_slices = c(1915, 2015)
)

plot_nsffa_estimates(uncertainty)

## ----fig.width = 10, fig.height = 8, fig.align = "center", out.width = "100%"----
assessment <- model_assessment(
	df$max,
	"GNO",
	"MLE",
	ns_years = df$year,
	ns_structure = ns_structure
)

plot_nsffa_assessment(assessment)

