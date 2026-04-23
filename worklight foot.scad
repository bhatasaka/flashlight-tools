$fn = 150;

///////// Variables
outside_h = 15;
inside_h = 16;

outside_cutout_w = 20.3 + .125;
outside_cutout_d = 10.5 + .125;
inside_cutout_w = 17.8 - .125;
inside_cutout_d = 7.96 - .125;

main_box_w = 24;
main_box_d = 14;
small_box_w = 4;
small_box_d = 2.5;

main_z_offset = outside_h / 2;
main_z_cutout_offset = main_z_offset + 4;
inside_z_offset = inside_h / 2;
inside_z_cutout_offset = main_z_cutout_offset;

///////// Code
difference() {
  translate([0, 0, main_z_offset]) {
    // Main box
    cube([main_box_w, main_box_d, outside_h], center=true);

    // Small boxes
    num_small_boxes = 4;
    // This formula distributes them evenly
    small_box_spacing = ( (main_box_w - small_box_w) / (num_small_boxes - 1));
    start = -(main_box_w / 2) + (small_box_w / 2);
    y_offset = (main_box_d / 2) + (small_box_d / 2);
    // Top boxes
    for (i = [0:3]) {
      translate([start + (small_box_spacing * i), y_offset, 0]) {
        cube([small_box_w, small_box_d, outside_h], center=true);
      }
    }
  }

  // Cutout to cover outside
  translate([0, 0, main_z_cutout_offset]) {
    cube([outside_cutout_w, outside_cutout_d, outside_h], center=true);
  }
}

difference() {
  translate([0, 0, inside_z_offset + 0.001]) {
    // Inside box
    cube([inside_cutout_w, inside_cutout_d, inside_h], center=true);
  }

  // Cutout to cover outside
  translate([0, 0, inside_z_offset + 1]) {
    cube([inside_cutout_w - 3, inside_cutout_d - 3, inside_h], center=true);
  }
}
