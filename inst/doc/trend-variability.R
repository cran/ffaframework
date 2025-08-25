## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----fig.width = 10, fig.height = 8, fig.align = "center", out.width = "100%"----
library(ffaframework)

df <- data_local("CAN-08MH016.csv")
head(df)

plot_ams_data(df$max, df$year, title = "Chilliwack River at Chilliwack Lake (08MH016)")

## -----------------------------------------------------------------------------
mw <- data_mw_variability(df$max, df$year)
mwmk_test <- eda_mk_test(mw$std)
print(mwmk_test$p_value)

## -----------------------------------------------------------------------------
white_test <- eda_white_test(df$max, df$year)
print(white_test$p_value)

## ----fig.width = 10, fig.height = 8, fig.align = "center", out.width = "100%"----
plot_ams_data(
	df$max,
	df$year,
	plot_mean = "Constant",
	plot_variability = "Trend",
	title = "Sen's Trend Estimator (AMS Variability)"
)

## ----fig.width = 10, fig.height = 8, fig.align = "center", out.width = "100%"----
sens_trend <- eda_sens_trend(mw$std, mw$year)

runs_test <- eda_runs_test(sens_trend$residuals, mw$year)

print(runs_test$p_value)

plot_runs_test(runs_test, title = "Runs Test (AMS Variability)")

