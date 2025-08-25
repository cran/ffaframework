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
mk_test <- eda_mk_test(df$max)

print(mk_test$p_value)

## ----fig.width = 10, fig.height = 8, fig.align = "center", out.width = "100%"----
spearman_test <- eda_spearman_test(df$max)

print(spearman_test$least_lag)

plot_spearman_test(spearman_test)

## ----fig.width = 10, fig.height = 8, fig.align = "center", out.width = "100%"----
plot_ams_data(
	df$max,
	df$year,
	plot_mean = "Trend",
	title = "Sen's Trend Estimator (AMS Mean)"
)

## ----fig.width = 10, fig.height = 8, fig.align = "center", out.width = "100%"----
sens_trend <- eda_sens_trend(df$max, df$year)

runs_test <- eda_runs_test(sens_trend$residuals, df$year)

print(runs_test$p_value)

plot_runs_test(runs_test, title = "Runs Test (AMS Mean)")

