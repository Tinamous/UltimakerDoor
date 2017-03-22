// Allow a tollerance on the acrylic width
// e.g. 3mm acrylic can be 3.5 or even 4 in places.
acrylicWidth = 4;

// Ultimaker Extended
extended = true;

includeLowerSections = false;
includeUpperSections = true; 
includeLeftSections = true;
includeRightSections = true;

// debug support
includeVisualisation = false;
testPiece = false;

// Include knotches on the inside surface to help latch the sliding door.
knotches = true;


distanceBetweenHoles = 122;
ultimakerWidth = 339; 

seperationBetweenSides = 0;
// -32 for offset in right bracked.
//seperationBetweenSides = ultimakerWidth - (38*2);
// gives 0 width for ultimaker inbeterrn
 //seperationBetweenSides = -(38*2);

module showUltimaker() {
    // down 2mm as the runners are raised up by 2mm.
    translate([-(ultimakerWidth-38 +2) ,11,-2]) {
        cube([ultimakerWidth,200,490]);
        
        // Show Screws.
        translate([0,5-1,0]) {
            for (zOfffset = [69-1 : distanceBetweenHoles : 480]) {           
                translate([0,0,zOfffset]) {
                    cube([400,2,2]);
                }
            }
        }
    }
}

module showDoor() {
xOffset = -(ultimakerWidth-38 +2) + 19;

    translate([xOffset ,2,15]) {
        % cube([300,acrylicWidth,500]);
    }
}

module bracket(h) {
    linear_extrude(height = h) { 
        //+4 on the x.
        //polygon(points=[[0,0],[34,0],[34,25],[32,25],[32,7],[25.5,7],[25.5,11],[4,11],[4,8],[19,8],[19,2],[0,2], [0,0]]);
        
        difference() {
            union() {
                polygon(points=[[0,0],[36,0],[38,2],[38,20+acrylicWidth],[36,20+acrylicWidth],[36,2+acrylicWidth],[29.5,2+acrylicWidth],[29.5,6+acrylicWidth],[8,6+acrylicWidth],[8,2+acrylicWidth],[17.5,2+acrylicWidth],[17.5,2],[0,2], [0,0]]);
                
                translate([36,2,0]) {
                    // 4.2mm hole allows for a M3 pushfit nut
                    // or small cable/string run inside
                    circle(d=4, $fn=60);
                }
            }
            union() {
                translate([23,4,0]) {
                    // 4.2mm hole allows for a M3 pushfit nut
                    // or small cable/string run inside
                   // circle(d=4.2, $fn=60);
                }
            }
        }
    }
}

// Well, more take them away
module addRightKnotches(h) {
    // start at 15mm as this keeps the underside
    // vent gap in the Ultimaker open
    for (zOffset = [15: 15: h]) {
        translate([0,6+acrylicWidth, zOffset]) {
            rotate([0,90,-90]) {
                linear_extrude(height = 4) { 
                    polygon(points=[[0,0],[10,4],[0,4],[0,0]]);
                }
            }
        }
    }
}

module addLeftKnotches(h) {
    // start at 15mm as this keeps the underside
    // vent gap in the Ultimaker open
    for (zOffset = [15: 15: h]) {
        translate([-3,6+acrylicWidth, zOffset]) {
            rotate([0,90,-90]) {
                linear_extrude(height = 4) { 
                    polygon(points=[[10,0],[10,0],[0,4],[00,0]]);
                }
            }
        }
    }
}

module rightBracket (h)  {
    bracket(h);
    if (knotches) {
        translate([4,0,0]) {
            addRightKnotches(h);
        }
    }
}

module leftBracket (h)  {
    translate([-4,0,h]) {
        rotate([0,180,0]) {
            bracket(h);
        }
    }
    if (knotches) {
        translate([-9,0,0]) {
            addLeftKnotches(h);
        }
    }
}    

module screwHole(zPosition) {
    translate([-395,0,zPosition]) {
        rotate([0,90,0]) {
            #cylinder(d=3.5, h=600, $fn=20);
        }
    }
}

module main(h, firstHoleZ, fillBase) {
    // for 2 sections to make a door on extended
    
    echo ("Height = ", h);
    echo ("First Hole At = ", firstHoleZ);
    
    difference() {
        union() {
            if (includeRightSections) {
                rightBracket(h);            
            }
            
            if (includeLeftSections) {
                translate([-seperationBetweenSides,0,0]) {
                   leftBracket(h);    
                }
            }
        }
        union() {
            translate([34-3,11+acrylicWidth,0]) {
                // Holes distance from top which actually becomes the bottom
                screwHole(firstHoleZ);
                screwHole(firstHoleZ+distanceBetweenHoles);
            }
        }
    }   
    
    // fill the bottom(/top) to stop acrylic calling out.
    if (fillBase) {
        if (includeRightSections) {
            cube([20,6 + acrylicWidth,15]);
        }
        
        if (includeLeftSections) {
            translate([-seperationBetweenSides-24,0,0]) {
                cube([20,6 + acrylicWidth,15]);
            }
        }
    }
}



// Help visualise if we have the screwholes in the correct place.
module lowerSectionMarker() {
    translate([30,10,0]) {
        // first hole
        cube([10,10,70]);
        // second hole
        translate([0,10,0]) cube([10,10,70+122]);
        // top
        translate([0,20,0]) cube([10,10,70+122+61]);
    }
}

module upperSectionMarker() {
    translate([30,10,0]) {
        // first hole
        cube([10,10,61]);
        // second hole
        translate([0,10,0]) cube([10,10,61+122]);
        // top
        translate([0,20,0]) cube([10,10,61+122+61]);
    }
}

module extendedUpperDoorRunners() {
    // Set-up so that 2 pieced
    // can be stacked on top of each other
    
    // For upper parts.
    lowerPartHeight = (distanceBetweenHoles/2); // 122/2 == 61mm.
    
    // 28mm lower in height to so they don't jut over the top.
    height = lowerPartHeight + (distanceBetweenHoles) + (distanceBetweenHoles/2) - 27; 
    
    main(height, lowerPartHeight, false);
}

module extendedLowerDoorRunners() {
    // For base parts
    // actual first hole at 70mm
    // leaves 2mm gap on floor
    lowerPartHeight = 68; 
    
    height = lowerPartHeight + (distanceBetweenHoles) + (distanceBetweenHoles/2); // distance between screw holes.
    
    main(height, lowerPartHeight, true);
}

module extendedDoorRunners() {
    // Set-up so that 2 pieced
    // can be stacked on top of each other
    if (includeUpperSections) {
        // For Printing
        translate([0,30,0]) {
        // For Visualisation
        //translate([0,0,68 + 122 + 61 + 0.5]) {
            extendedUpperDoorRunners();
        }
    }
        
    if (includeLowerSections) {
        extendedLowerDoorRunners();
    }
}

module regularDoorRunners() {
    if (includeUpperSections) {
        // For Printing
        translate([0,30,0]) {
            // For Visualisation
            //translate([0,0,68 + 122 + 61 + 0.5]) {
            height =  distanceBetweenHoles + distanceBetweenHoles/2;
            main(height, 0, false);
        }
    }
    
    if (includeLowerSections) {
        // Joint is in the middle of the second screw.
        height = 68 + distanceBetweenHoles;
        main(height, 68, true);
    }
}


// Application flow...

if (testPiece) {
    // Print test pieces for fit.
    main(10, 5, false);
} else {

    if (extended) {
        extendedDoorRunners();
    } else {
        regularDoorRunners();
    }

    if (includeVisualisation) {

        // Visualisation
        %showUltimaker();
        %showDoor();

        translate([0,0,251.5]) {
            %upperSectionMarker();
        }

        translate([0,0,-2]) {
            %lowerSectionMarker();
        }
    }
}



