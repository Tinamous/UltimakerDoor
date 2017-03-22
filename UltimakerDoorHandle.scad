handleLength = 25;
catchLength = 10;
acrylicWidth = 3;

module handle(h) {
    linear_extrude(height = h) {         
        // 20 -> 25 gives 5mm acrylic.
        polygon(points=[[0,13],[20,13],[20,3],[20 + acrylicWidth,3],[20+acrylicWidth,18], [23+acrylicWidth,18],[23+acrylicWidth,0],[17,0],[17,8], [15,10], [0,10],[0,13]]);
        
        translate([0,11.5,0]) {
            circle(d=8, $fn=60);
        }
    }
    
    
}

module leftCatch() {
    translate([20+acrylicWidth,5,-catchLength]) {
        cube([3,1.5,catchLength]);   
    }
}

module rightCatch() {
    translate([20+acrylicWidth,5,handleLength]) {
        cube([3,1.5,catchLength]);   
    }
}

handle(handleLength);

leftCatch();
//rightCatch();