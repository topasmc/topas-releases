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

cmake_minimum_required (VERSION 3.8 FATAL_ERROR)

if (CMAKE_VERSION VERSION_GREATER_EQUAL 3.17)
	cmake_policy (SET CMP0100 NEW)
endif ()

project (topas)

# Print compiler information
message (STATUS "CMAKE_CXX_COMPILER_ID: " ${CMAKE_CXX_COMPILER_ID})
message (STATUS "CMAKE_CXX_COMPILER_VERSION: " ${CMAKE_CXX_COMPILER_VERSION})

# Set cmake module Path and load modules
set (CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR}/cmake/Modules ${CMAKE_MODULE_PATH})
include (TOPAS_Options)
include (TOPAS_BuildSettings)

set (CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)

include (CMakeHandleExtensions.cmake)

include_directories (
	${CMAKE_BINARY_DIR}
	${CMAKE_BINARY_DIR}/extensions
	${PROJECT_SOURCE_DIR}/Geant4Headers
	${PROJECT_SOURCE_DIR}/include
)

file (GLOB EXTENSIONS CONFIGURE_DEPENDS ${PROJECT_BINARY_DIR}/extensions/*)
add_library (extensions ${EXTENSIONS})

if (APPLE)
	set (CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -F ${PROJECT_SOURCE_DIR}/Frameworks")
	find_library (COREFOUNDATION_LIBRARY CoreFoundation)
	link_directories (${PROJECT_SOURCE_DIR}/lib ${PROJECT_SOURCE_DIR}/Frameworks)
else ()
	link_directories (${PROJECT_SOURCE_DIR}/lib)
endif ()

add_executable (topas topas.cc)

target_compile_definitions (extensions PUBLIC)

set (TOPAS_Libs
	main
	parameter
	chemistry
	geometry
	extensions
	graphics
	material
	physics
	variance
	filtering
	scoring
	outcome
	io
	sequence
	primary)

set (GDCM_Libs
	gdcmMSFF
	gdcmDICT
	gdcmIOD
	gdcmexpat
	gdcmDSED
	gdcmCommon
	gdcmzlib
	gdcmjpeg8
	gdcmjpeg12
	gdcmjpeg16
	gdcmopenjpeg
	gdcmcharls
	gdcmuuid)

set (Geant4_Libs
	G4Tree
	G4GMocren
	G4visHepRep
	G4RayTracer
	G4VRML
	G4OpenGL
	G4gl2ps
	G4interfaces
	G4persistency
	G4analysis
	G4error_propagation
	G4readout
	G4physicslists
	G4parmodels
	G4FR
	G4vis_management
	G4modeling
	G4run
	G4event
	G4tracking
	G4processes
	G4zlib
	G4digits_hits
	G4track
	G4particles
	G4geometry
	G4materials
	G4graphics_reps
	G4intercoms
	G4global
	G4clhep)

# Add G4visQt3D (created when Geant4 >=10.07.x is built against Qt >=5.15.x)
find_library (G4visQt3D-LIBRARY G4visQt3D PATHS ${PROJECT_SOURCE_DIR}/lib ${PROJECT_SOURCE_DIR}/Frameworks)
if (G4visQt3D-LIBRARY)
	set (Geant4_Libs "G4visQt3D;${Geant4_Libs}")
endif ()

if (APPLE)
	set (Qt_Libs
		"-framework QtCore"
		"-framework QtGui"
		"-framework QtOpenGL"
		"-framework QtWidgets"
		"-framework QtPrintSupport"
		${COREFOUNDATION_LIBRARY})
else ()
	set (Qt_Libs
		Qt5Core
		Qt5Gui
		Qt5OpenGL
		Qt5Widgets
		Qt5PrintSupport)
endif ()

target_link_libraries (topas
	${TOPAS_Libs}
	${GDCM_Libs}
	${Geant4_Libs}
	${Qt_Libs}
)
