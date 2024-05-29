#!/bin/bash
chmod +x get_geant4_data.sh
./get_geant4_data.sh
export TOPAS_G4_DATA_DIR=G4Data
mkdir -p topasio
cp tapasio/TsUserParameters.txt . 2> /dev/null
bin/topas $1
cp -f *.* topasio/
