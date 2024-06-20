//
// ********************************************************************
// *                                                                  *
// * Copyright 2022 The TOPAS Collaboration                           *
// *                                                                  *
// * Permission is hereby granted, free of charge, to any person      *
// * obtaining a copy of this software and associated documentation   *
// * files (the "Software"), to deal in the Software without          *
// * restriction, including without limitation the rights to use,     *
// * copy, modify, merge, publish, distribute, sublicense, and/or     *
// * sell copies of the Software, and to permit persons to whom the   *
// * Software is furnished to do so, subject to the following         *
// * conditions:                                                      *
// *                                                                  *
// * The above copyright notice and this permission notice shall be   *
// * included in all copies or substantial portions of the Software.  *
// *                                                                  *
// * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,  *
// * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES  *
// * OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND         *
// * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT      *
// * HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,     *
// * WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING     *
// * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR    *
// * OTHER DEALINGS IN THE SOFTWARE.                                  *
// *                                                                  *
// ********************************************************************
//

#ifndef TsVElectroMagneticField_hh
#define TsVElectroMagneticField_hh

#include "G4ElectricField.hh"
#include "G4RotationMatrix.hh"

class TsParameterManager;
class TsGeometryManager;
class TsVGeometryComponent;

class G4EqMagElectricField;
class G4FieldManager;
class G4MagErrorStepper;
class G4MagInt_Driver;
class G4ChordFinder;
class G4Navigator;

class TsVElectroMagneticField : public G4ElectricField{
public:
	TsVElectroMagneticField(TsParameterManager* pM, TsGeometryManager* gM,
					 TsVGeometryComponent* component);
	~TsVElectroMagneticField();

	virtual void GetFieldValue(const G4double[4], G4double *fieldBandE) const = 0;
	virtual void ResolveParameters();

	virtual void UpdateForSpecificParameterChange(G4String parameter);
	virtual void UpdateForNewRun();

	TsVGeometryComponent* GetComponent();

protected:
	TsParameterManager*	fPm;
	TsGeometryManager* fGm;

	TsVGeometryComponent* fComponent;

	G4Navigator* fNavigator;

	G4ThreeVector fElectricFieldValue;
	G4ThreeVector fMagneticFieldValue;
	G4ElectricField* fField;
	G4FieldManager* fFieldManager;
	G4EqMagElectricField* fFieldEquation;
	G4MagErrorStepper* fStepper;
	G4MagInt_Driver* fIntgrDriver;
	G4ChordFinder* fChordFinder;
};

#endif
