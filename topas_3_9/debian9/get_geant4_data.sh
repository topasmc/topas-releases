#!/bin/bash

mkdir ~/G4Data
cd ~/G4Data
wget -4q https://geant4-data.web.cern.ch/geant4-data/datasets/G4NDL.4.6.tar.gz
wget -4q https://geant4-data.web.cern.ch/geant4-data/datasets/G4EMLOW.7.13.tar.gz
wget -4q https://geant4-data.web.cern.ch/geant4-data/datasets/G4PhotonEvaporation.5.7.tar.gz
wget -4q https://geant4-data.web.cern.ch/geant4-data/datasets/G4RadioactiveDecay.5.6.tar.gz
wget -4q https://geant4-data.web.cern.ch/geant4-data/datasets/G4PARTICLEXS.3.1.1.tar.gz
wget -4q https://geant4-data.web.cern.ch/geant4-data/datasets/G4SAIDDATA.2.0.tar.gz
wget -4q https://geant4-data.web.cern.ch/geant4-data/datasets/G4ABLA.3.1.tar.gz
wget -4q https://geant4-data.web.cern.ch/geant4-data/datasets/G4INCL.1.0.tar.gz
wget -4q https://geant4-data.web.cern.ch/geant4-data/datasets/G4PII.1.3.tar.gz
wget -4q https://geant4-data.web.cern.ch/geant4-data/datasets/G4ENSDFSTATE.2.3.tar.gz
wget -4q https://geant4-data.web.cern.ch/geant4-data/datasets/G4RealSurface.2.2.tar.gz
wget -4q https://geant4-data.web.cern.ch/geant4-data/datasets/G4TENDL.1.3.2.tar.gz
tar -zxf G4NDL.4.6.tar.gz
tar -zxf G4EMLOW.7.13.tar.gz
tar -zxf G4PhotonEvaporation.5.7.tar.gz
tar -zxf G4RadioactiveDecay.5.6.tar.gz
tar -zxf G4PARTICLEXS.3.1.1.tar.gz
tar -zxf G4SAIDDATA.2.0.tar.gz
tar -zxf G4ABLA.3.1.tar.gz
tar -xzf G4INCL.1.0.tar.gz
tar -zxf G4PII.1.3.tar.gz
tar -zxf G4ENSDFSTATE.2.3.tar.gz
tar -zxf G4RealSurface.2.2.tar.gz
tar -zxf G4TENDL.1.3.2.tar.gz

export TOPAS_G4_DATA_DIR=~/G4Data

