#!/bin/bash

if [[ ${HOST} =~ .*darwin.* ]]; then
  if [[ ! -d ${CONDA_BUILD_SYSROOT}/opt/X11 ]]; then
    echo "XQuartz not found in sysroot (${CONDA_BUILD_SYSROOT})"
    echo "Please unpack it there via:"
    echo "pushd /tmp"
    echo "curl -SLO https://dl.bintray.com/xquartz/downloads/XQuartz-2.7.11.dmg"
    echo "hdiutil attach XQuartz-2.7.11.dmg"
    echo "pkgutil --expand /Volumes/XQuartz-2.7.11/XQuartz.pkg /tmp"
    echo "pushd x11.pkg"
    echo "tar -zxvf Payload"
    echo "mv opt ${CONDA_BUILD_SYSROOT}"
    echo "hdiutil detach /Volumes/XQuartz-2.7.11"
    echo ".. or better, make conda packages for it"
    exit 1
  fi
  X11_CONFIGURE_ARGS="--x-includes=${CONDA_BUILD_SYSROOT}/opt/X11/include --x-libraries=${CONDA_BUILD_SYSROOT}/opt/X11/lib"
  export DYLD_FALLBACK_LIBRARY_PATH=${CONDA_BUILD_SYSROOT}/opt/X11/lib
fi

DISPLAY=:0 \
  $R CMD INSTALL --build . --configure-args="--disable-ftgl ${X11_CONFIGURE_ARGS}"
