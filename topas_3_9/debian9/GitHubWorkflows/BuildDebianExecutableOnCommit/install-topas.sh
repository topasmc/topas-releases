#!/bin/bash

# exit at first failure
set -e

cd "$TOPAS_SOURCE_PATH" || exit
unzip Geant4Headers.zip > /dev/null
cmake -DTOPAS_EXTENSIONS_DIR="$NBIO_SOURCE_PATH" -DCMAKE_INSTALL_PREFIX=~/topas-install
cmake --build .
cmake --install .
