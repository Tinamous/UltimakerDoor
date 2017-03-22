@echo off

@echo Deleting old STL files.
del *.stl

@echo Building Test Piece for hole alignment and size check
"C:\Program Files\OpenSCAD\openscad.com" -o UltimakerDoorSlider-TestPiece.stl -D testPiece=true UltimakerDoorSlider.scad

@echo Building Ultimaker Extended Files
@echo Building Lower Sections
"C:\Program Files\OpenSCAD\openscad.com" -o UM2E-Door-Lower-Both-3mm.stl -D acrylicWidth=4;testPiece=false;extended=true;includeLowerSections=true;includeUpperSections=false;includeLeftSections=true;includeRightSections=true UltimakerDoorSlider.scad
"C:\Program Files\OpenSCAD\openscad.com" -o UM2E-Door-Lower-Left-3mm.stl -D acrylicWidth=4;testPiece=false;extended=true;includeLowerSections=true;includeUpperSections=false;includeLeftSections=true;includeRightSections=false UltimakerDoorSlider.scad
"C:\Program Files\OpenSCAD\openscad.com" -o UM2E-Door-Lower-Right-3mm.stl -D acrylicWidth=4;testPiece=false;extended=true;includeLowerSections=true;includeUpperSections=false;includeLeftSections=false;includeRightSections=true UltimakerDoorSlider.scad

@echo Building Upper Sections
"C:\Program Files\OpenSCAD\openscad.com" -o UM2E-Door-Upper-Both-3mm.stl -D acrylicWidth=4;testPiece=false;extended=true;includeLowerSections=false;includeUpperSections=true;includeLeftSections=true;includeRightSections=true UltimakerDoorSlider.scad
"C:\Program Files\OpenSCAD\openscad.com" -o UM2E-Door-Upper-Left-3mm.stl -D acrylicWidth=4;testPiece=false;extended=true;includeLowerSections=false;includeUpperSections=true;includeLeftSections=true;includeRightSections=false UltimakerDoorSlider.scad
"C:\Program Files\OpenSCAD\openscad.com" -o UM2E-Door-Upper-Right-3mm.stl -D acrylicWidth=4;testPiece=false;extended=true;includeLowerSections=false;includeUpperSections=true;includeLeftSections=false;includeRightSections=true UltimakerDoorSlider.scad

@echo Building Ultimaker (Regular) Files.
@echo Building Lower Sections
"C:\Program Files\OpenSCAD\openscad.com" -o UM2-Door-Lower-Both-3mm.stl -D acrylicWidth=4;testPiece=false;extended=false;includeLowerSections=true;includeUpperSections=false;includeLeftSections=true;includeRightSections=true UltimakerDoorSlider.scad
"C:\Program Files\OpenSCAD\openscad.com" -o UM2-Door-Lower-Left-3mm.stl -D acrylicWidth=4;testPiece=false;extended=false;includeLowerSections=true;includeUpperSections=false;includeLeftSections=true;includeRightSections=false UltimakerDoorSlider.scad
"C:\Program Files\OpenSCAD\openscad.com" -o UM2-Door-Lower-Right-3mm.stl -D acrylicWidth=4;testPiece=false;extended=false;includeLowerSections=true;includeUpperSections=false;includeLeftSections=false;includeRightSections=true UltimakerDoorSlider.scad

@echo Building Upper Sections
"C:\Program Files\OpenSCAD\openscad.com" -o UM2-Door-Upper-Both-3mm.stl -D acrylicWidth=4;testPiece=false;extended=false;includeLowerSections=false;includeUpperSections=true;includeLeftSections=true;includeRightSections=true UltimakerDoorSlider.scad
"C:\Program Files\OpenSCAD\openscad.com" -o UM2-Door-Upper-Left-3mm.stl -D acrylicWidth=4;testPiece=false;extended=false;includeLowerSections=false;includeUpperSections=true;includeLeftSections=true;includeRightSections=false UltimakerDoorSlider.scad
"C:\Program Files\OpenSCAD\openscad.com" -o UM2-Door-Upper-Right-3mm.stl -D acrylicWidth=4;testPiece=false;extended=false;includeLowerSections=false;includeUpperSections=true;includeLeftSections=false;includeRightSections=true UltimakerDoorSlider.scad

@echo Building Door Handles and bits.
"C:\Program Files\OpenSCAD\openscad.com" -o UltimakerDoorHandle-Left.stl -D acrylicWidth=3.5;buildLeft=true;buildRight=false UltimakerDoorHandle.scad
"C:\Program Files\OpenSCAD\openscad.com" -o UltimakerDoorHandle-Right.stl -D acrylicWidth=3.5;buildLeft=false;buildRight=true UltimakerDoorHandle.scad
"C:\Program Files\OpenSCAD\openscad.com" -o UltimakerDoorHandle-Simple.stl -D acrylicWidth=3.5;buildLeft=false;buildRight=false UltimakerDoorHandle.scad

@echo Done :-)
