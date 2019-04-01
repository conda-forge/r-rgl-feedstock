#!/bin/bash
X11_CONFIGURE_ARGS="--x-includes=${PREFIX}/include --x-libraries=${BUILD_PREFIX}/x86_64-conda_cos6-linux-gnu/sysroot/usr/lib64"
export LD_LIBRARY_PATH=${BUILD_PREFIX}/x86_64-conda_cos6-linux-gnu/sysroot/usr/lib64

DISPLAY=${DISPLAY:-:0} $R CMD INSTALL --build . --configure-args="--disable-ftgl ${X11_CONFIGURE_ARGS}"
