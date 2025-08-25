## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----fig.width = 10, fig.height = 8, fig.align = "center", out.width = "100%"----
library(ffaframework)

df <- data_local("CAN-07BE001.csv")
head(df)

plot_ams_data(df$max, df$year, title = "Athabasca River at Athabasca (07BE001)")

## ----fig.width = 10, fig.height = 8, fig.align = "center", out.width = "100%"----
selection <- select_ldistance(df$max)

print(selection$recommendation)

plot_lmom_diagram(selection)

## ----fig.width = 10, fig.height = 8, fig.align = "center", out.width = "100%"----
fit <- fit_lmoments(df$max, "GEV")

print(fit$params)

plot_sffa_fit(fit)

## ----fig.width = 10, fig.height = 8, fig.align = "center", out.width = "100%"----
uncertainty <- uncertainty_bootstrap(df$max, "GEV", "L-moments")

plot_sffa_estimates(fit, ci = uncertainty$ci)

## ----fig.width = 10, fig.height = 8, fig.align = "center", out.width = "100%"----
assessment <- model_assessment(df$max, "GEV", "L-moments")

plot_sffa_assessment(assessment)

