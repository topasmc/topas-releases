#!/bin/bash
chmod +x get_geant4_data.sh
./get_geant4_data.sh
export TOPAS_G4_DATA_DIR=G4Data
export TOPAS_HEADLESS_MODE="ON"
bin/topas $1