#!/bin/bash

if [[ $target_platform =~ linux.* ]] || [[ $target_platform == win-32 ]] || [[ $target_platform == win-64 ]] || [[ $target_platform == osx-64 ]]; then
  export DISABLE_AUTOBREW=1
  mv DESCRIPTION DESCRIPTION.old
  grep -v '^Priority: ' DESCRIPTION.old > DESCRIPTION
  $R CMD INSTALL --build --configure-args="--x-includes=${PREFIX}/include --x-lib=${PREFIX}/lib" .
else
  mkdir -p $PREFIX/lib/R/library/rgl
  mv * $PREFIX/lib/R/library/rgl
fi
