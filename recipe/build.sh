#!/bin/bash
DISPLAY=:0 \
  $R CMD INSTALL --build . --configure-args="--disable-ftgl"
