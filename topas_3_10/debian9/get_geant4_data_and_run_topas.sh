#!/bin/bash
chmod +x get_geant4_data.sh
./get_geant4_data.sh
pwd
ls -la
export TOPAS_G4_DATA_DIR=/tmp/topas_3_10/debian9/G4Data
mkdir -p /tmp/topasio
cd /tmp/topasio
ls -la
/tmp/topas_3_10/debian9/bin/topas $1
ls -la
