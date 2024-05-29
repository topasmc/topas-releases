#!/bin/bash
chmod +x get_geant4_data.sh
./get_geant4_data.sh
export TOPAS_G4_DATA_DIR=G4Data
pwd
mkdir -p topasio
ls -la topasio
la -la /tmp/topasio
cp tapasio/*.txt . 2> /dev/null
ls -la
bin/topas $1
cp -f *.* topasio/
