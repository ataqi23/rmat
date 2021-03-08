#!/bin/bash

# Remove the existing files
rm -rf R/matrices.R
rm -rf R/spectrum.R
rm -rf R/dispersion.R
rm -rf R/mat-diag.R

# Copy them from developing environment
cp ../thesis-taqi/R/matrices.R R/matrices.R
cp ../thesis-taqi/R/spectrum.R R/spectrum.R
cp ../thesis-taqi/R/dispersion.R R/dispersion.R
cp ../thesis-taqi/R/mat-diag.R R/mat-diag.R


