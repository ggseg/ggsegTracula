
<!-- README.md is generated from README.Rmd. Please edit that file -->

# ggsegTracula

<!-- badges: start -->

[![Travis build
status](https://travis-ci.com/LCBC-UiO/ggsegTracula.svg?branch=master)](https://travis-ci.com/LCBC-UiO/ggsegTracula)
[![AppVeyor build
status](https://ci.appveyor.com/api/projects/status/github/LCBC-UiO/ggsegTracula?branch=master&svg=true)](https://ci.appveyor.com/project/LCBC-UiO/ggsegTracula)
[![Codecov test
coverage](https://codecov.io/gh/LCBC-UiO/ggsegTracula/branch/master/graph/badge.svg)](https://codecov.io/gh/LCBC-UiO/ggsegTracula?branch=master)
<!-- badges: end -->

This package contains dataset for plotting the Tracula white matter
tracts with ggseg and ggseg3d.

## Installation

You can install the released version of ggsegTracula from
[GitHub](https://github.com/) with:

``` r
# install.packages("remotes")
remotes::install_github("LCBC-UiO/ggsegTracula")
```

``` r
library(ggseg)
library(ggseg3d)
library(ggsegTracula)

ggseg(atlas = tracula, mapping = aes(fill = region)) +
  scale_fill_brain("tracula", package = "ggsegTracula") +
  theme(legend.position = "bottom", 
        legend.text = element_text(size = 9)) +
  guides(fill = guide_legend(ncol = 3))
```

<img src="man/figures/README-unnamed-chunk-2-1.png" width="100%" />

Please note that the ‘ggsegTracula’ project is released with a
[Contributor Code of Conduct](CODE_OF_CONDUCT.md). By contributing to
this project, you agree to abide by its terms.
