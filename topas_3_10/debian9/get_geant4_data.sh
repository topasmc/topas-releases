#!/bin/bash

#
# ************************************************************************************
# *                                                                                  *
# * MIT License                                                                      *
# *                                                                                  *
# * Copyright © 2024 The Board of Trustees of the Leland Stanford Junior University. *
# *                                                                                  *
# * Permission is hereby granted, free of charge, to any person obtaining a copy     *
# * of this software and associated documentation files (the "Software"), to deal    *
# * in the Software without restriction, including without limitation the rights     *
# * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell        *
# * copies of the Software, and to permit persons to whom the Software is            *
# * furnished to do so, subject to the following conditions:                         *
# *                                                                                  *
# * The above copyright notice and this permission notice shall be included in all   *
# * copies or substantial portions of the Software.                                  *
# *                                                                                  *
# * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR       *
# * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,         *
# * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE      *
# * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER           *
# * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,    *
# * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE    *
# * SOFTWARE.                                                                        *
# *                                                                                  *
# ************************************************************************************
#

mkdir G4Data
cd G4Data
wget -4nv https://geant4-data.web.cern.ch/geant4-data/datasets/G4NDL.4.6.tar.gz
wget -4nv https://geant4-data.web.cern.ch/geant4-data/datasets/G4EMLOW.7.13.tar.gz
wget -4nv https://geant4-data.web.cern.ch/geant4-data/datasets/G4PhotonEvaporation.5.7.tar.gz
wget -4nv https://geant4-data.web.cern.ch/geant4-data/datasets/G4RadioactiveDecay.5.6.tar.gz
wget -4nv https://geant4-data.web.cern.ch/geant4-data/datasets/G4PARTICLEXS.3.1.1.tar.gz
wget -4nv https://geant4-data.web.cern.ch/geant4-data/datasets/G4SAIDDATA.2.0.tar.gz
wget -4nv https://geant4-data.web.cern.ch/geant4-data/datasets/G4ABLA.3.1.tar.gz
wget -4nv https://geant4-data.web.cern.ch/geant4-data/datasets/G4INCL.1.0.tar.gz
wget -4nv https://geant4-data.web.cern.ch/geant4-data/datasets/G4PII.1.3.tar.gz
wget -4nv https://geant4-data.web.cern.ch/geant4-data/datasets/G4ENSDFSTATE.2.3.tar.gz
wget -4nv https://geant4-data.web.cern.ch/geant4-data/datasets/G4RealSurface.2.2.tar.gz
wget -4nv https://geant4-data.web.cern.ch/geant4-data/datasets/G4TENDL.1.3.2.tar.gz
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
