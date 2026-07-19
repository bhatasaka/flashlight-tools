// Wurkkos HD10 Bezel Tool Finger Wrench
// 12mm Finger Box Wrench
// Version 1.0

$fn = 150;

///////// Variables
// Width of opening for wrench
box_inner_width = 12.08; // Fits over 12mm box

box_outer_width = box_inner_width + 3.25; // mm
box_height = 6.5; // mm

main_diameter = sqrt(pow(box_outer_width, 2) * 2) + 2.5; // mm - diameter of big cylinder
wing_width = 3; // mm
wing_offset = (main_diameter / 2) - (0.25 * wing_width); // offset inward slightly
wing_count = 12;
main_height = 2.0; // mm - height of cylinder and wings

box_z_offset = (main_height / 2) + (box_height / 2);

///////// Code
// Main cylinder
cylinder(h = main_height, d = main_diameter, center = true);

// Wings for grip
wing_spacing = 360 / wing_count;
for (i = [0:(wing_count - 1)]) {
    rotate([0, 0, (i * wing_spacing)]) {
        translate([0, wing_offset, 0]) {
            cube([wing_width, wing_width, main_height], center = true);
        }
    }
}

// Box as wrench
translate([0, 0, box_z_offset-0.001]) { // offset to make sure they form one object
    difference() {
        cube(size = [box_outer_width, box_outer_width, box_height], center = true);
        translate([0, 0, .25]) {
            cube(size = [box_inner_width, box_inner_width, box_height], center = true);
        }
    }
}