// Emisar DW4 Bezel Tool
// Version 1.0

$fn = 150;

///////// Variables
main_diameter = 23.28; // mm - diameter of big cylinder cutout
cone_wider_diameter = 25.7;
wing_diameter = 2.95; // mm - diameter of smaller cylinders
wing_offset = (main_diameter / 2) - (0.1 * wing_diameter); // offset inward slightly
main_height = 1.90; // mm - height of cylinder and wings

grip_height = 5.5; // mm
grip_z_offset = (grip_height / 2);
main_z_offset = (main_height / 2) + grip_height;

num_grips = 60;
grips_radius = 18;
gear_rotation_offset = 360 / num_grips;
grip_box_width = .5;

num_wings = 8;

///////// Code

// Wing circles
translate([0, 0, main_z_offset - 0.001]) {
    translate([0,0,0]){
    // Create wings
    wing_rotation_offset = 360 / num_wings;
    for (i = [0:(num_wings - 1)]) {
        rotate([0, 0, (i * wing_rotation_offset)]) {
            translate([0, wing_offset, 0]) {
                cylinder(h = main_height, d = wing_diameter, center = true);
            }
        }
    }
    // Cone for wings to attach to
    cylinder(h = main_height, d1 = cone_wider_diameter, d2 = main_diameter, center = true);
    }
}


// Grip - made of rotated cubes to use the corners as little grips
translate([0, 0, grip_z_offset]) { // offset to make sure they form one object
    difference() {
        translate([0,0,0]) { // Group grips and filler cylinder together
        for (i = [0:(num_grips - 1)]) {
            rotate([0, 0, (i * gear_rotation_offset) + 45]) {
                translate([0, grips_radius, 0]) {
                    rotated_box(w = grip_box_width * 2, h = grip_height);
                }
            }
        }
        
        cylinder(h = grip_height, r = grips_radius, center = true);
        }
        
        // Square drive cutout - sink into wing part a bit
        square_drive_cutout(grip_height+0.01);
    }
}

module rotated_box(w, h) {
    rotate([0, 0, 45]) {
        cube([w, w, h], center = true);
    }
}

module square_drive_cutout(height) {
    box_inner_width = 6.4; // mm for 1/4in ratchet
    
    // Square drive cutout
    cube(size = [box_inner_width, box_inner_width, height], center = true);
    // Rotate 4 cylinders around the edge of the box (offset in by 25%) as a ball detent channel
    for(i = [0:3]) {
        rotate([0, 0, (i * 90)]) {
            translate([0, (box_inner_width/2) - (0.25 * box_inner_width / 2), 0]) {
                cylinder(h = height, r = 1.2, center = true);
            }
        }
    }
}
