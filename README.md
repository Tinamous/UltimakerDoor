# Sliding Door for Ultimaker 2/2+

This is a set of runners that bolt to the Ultimaker 2+ so that a 3mm acrylic sheet can be used as a vertical sliding door. It does require the use of the Ultimaker bolts so may void your warranty.

*** WORK IN PROGRESS ***

** Regular (non-extended) Ultimaker runners untested.
** Sizes other than 3mm untested.

## 3D Printed Parts

The stl files are for 3mm Acrylic. If you wish to use another thickness modify the Build.bat file (or the scad file and build manually).

Change the variable: acrylicWidth 
It should include a tollerance for your acrylic (3mm is often 3.5 in places) and a tollerance to allow it to slide (e.g. 0.5mm on the Ultimaker for PLA appears to work well), hence a 4.0 value for 3mm Acrylic.

the -Both files include both left and right for either the lower sections or the upper sections, this takes about 6 hours to print.

-Left and -Right files include individual left and right sections if you with to print them individually.

A small gap is left at the base to keep the runners clear of the desk top.

Lower sections include a stop block at the bottom to prevent the door from going below the level of the Ultimaker box which may hinder ventilation to the electronics mounted underneath the UM.

Printer settings:
Slicer: Cura
Layer Height: 0.2 or 0.25
Wall Thickness: 0.7
Infill Density: 18%
Speed: 60mm/s
Supports: None
Build Plade Adhesion: Brim (14mm)


## Laser Cut Parts.

A sheet of 3mm 300mm acrylic is required

Cut to the height required.

SVG file to be added when door latching is figured out.