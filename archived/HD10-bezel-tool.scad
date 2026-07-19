// Wurkkos HD10 Bezel Tool
// Version 1.0

$fn = 150;

///////// Variables
// Width of box for wrench
box_outer_width = 11.95; // 12mm wrench
// box_outer_width = 12.65; // 1/2" wrench

main_diameter = 16.95; // mm - diameter of big cylinder
wing_radius = 1.5; // mm - radius of smaller cylinders
wing_offset = (main_diameter / 2) - (0.25 * wing_radius); // offset inward slightly
main_height = 2.0; // mm - height of cylinder and wings

box_inner_width = 6.4; // mm for 1/4 ratchet
box_height = 6.5; // mm
box_z_offset = (main_height / 2) + (box_height / 2);

///////// Code
// Main cylinder
cylinder(h = main_height, d = main_diameter, center = true);

// Wing circles
for (i = [0:3]) {
    rotate([0, 0, (i * 90) + 45]) {
        translate([0, wing_offset, 0]) {
            cylinder(h = main_height, r = wing_radius, center = true);
        }
    }
}

// Box for wrench
translate([0, 0, box_z_offset-0.001]) { // offset to make sure they form one object
    difference() {
        cube(size = [box_outer_width, box_outer_width, box_height], center = true);
        translate([0, 0, .25]) {
            cube(size = [box_inner_width, box_inner_width, box_height], center = true);
        }
    }
}