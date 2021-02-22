## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE, comment = "#>", fig.width = 7, fig.height = 7,
  fig.align = "center"
)

## ----setup, message = FALSE---------------------------------------------------
library(lvmisc)
library(lme4)

## ----example_models-----------------------------------------------------------
m1 <- lm(disp ~ mpg + hp + cyl + mpg:cyl, mtcars)
m2 <- lmer(disp ~ mpg + (1 | cyl), mtcars)

## ----diagnostic_plots---------------------------------------------------------
plot_model(m1)
plot_model(m2)

## ----loo_cv-------------------------------------------------------------------
# Put the rownames into a column to treat eat row as a "subject" (car) in
# the leave-one-out cross-validation
mtcars$car <- row.names(mtcars)
m <- lm(disp ~ mpg, mtcars)
loo_cv(model = m, data = mtcars, id = car, keep = "used")

## ----example_models_2---------------------------------------------------------
m1 <- lm(disp ~ mpg + hp + cyl + mpg:cyl, mtcars)
m2 <- lmer(disp ~ mpg + (1 | cyl), mtcars)
# Let's also cross-validate both models
cv_m1 <- loo_cv(m1, mtcars, "car", keep = "used")
cv_m2 <- loo_cv(m2, mtcars, "car", keep = "used")

## ----accuracy_indices---------------------------------------------------------
accuracy(m1)
accuracy(m2)
accuracy(cv_m1)
accuracy(cv_m2)

## ----compare_accuracy---------------------------------------------------------
compare_accuracy(m1, cv_m1, m2, cv_m2)

