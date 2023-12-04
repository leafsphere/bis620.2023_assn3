
<!-- README.md is generated from README.Rmd. Please edit that file -->

# bis620.2023

<!-- badges: start -->

[![R-CMD-check](https://github.com/leafsphere/bis620.2023_assn3/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/leafsphere/bis620.2023_assn3/actions/workflows/R-CMD-check.yaml)
[![test-coverage](https://github.com/leafsphere/bis620.2023_assn3/actions/workflows/test-coverage.yaml/badge.svg)](https://github.com/leafsphere/bis620.2023_assn3/actions/workflows/test-coverage.yaml)
<!-- badges: end -->

[Test
Coverage](https://github.com/leafsphere/bis620.2023_assn3/actions/workflows/test-coverage.yaml)

The goal of `bis620.2023` is to provide a user-friendly interface that
allows the viewer to explore a large database of clinical studies.
Inside lies an R Shiny app that serves as an interactive dashboard,
allowing the user to query trials based on their keyword(s) of interest
and subsequently shows relevant data visualizations and tables
pertaining to the results, such as what phases the studies were in, what
countries were involved, and what conditions were examined.

## Installation

You can install the development version of bis620.2023 from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("leafsphere/bis620.2023_assn3")
```

## Examples

This is a basic example which shows you how to plot the first 100 points
of accelerometry data:

``` r
library(bis620.2023)
accel |> 
  head(100) |> 
  plot_accel()
```

<img src="man/figures/README-example-1.png" width="100%" />
