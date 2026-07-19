# Flashlight 3D Printable Tools
This repo contains the OpenSCAD files for tools to unscrew the bezels and switches on various flashlights. Most of the tools can be used with a 1/4" ratchet square drive or just your fingers. They can all be printed without support. I was able to print these on an Ender 3 V2 Neo in PLA. Measurements can be adjusted to print better or to generate a file for your own light.

In this repo:
- `emisar-6-wing-button-tool.scad`
  - OpenSCAD file for tool to remove the button on many Emisar/Noctigon flashlights including the D4V2, D1, DW4, and more.
- `HD10-bezel-tool-v2.scad`
  - OpenSCAD file for tool to remove Wurkkos HD10 bezel.
- `M21H-bezel-tool.scad`
  - OpenSCAD file for tool to remove Convoy M21H bezel.
- `M150-bezel-tool.scad`
  - OpenSCAD file for Skilhunt M150 bezel.
- `Z1-bezel-tool.scad`
  - OpenSCAD file for the Fireflies Z1 Artemis bezel.

Archived:
- `HD10-bezel-tool.scad`
  - OLD - `HD10-bezel-tool-v2.scad` preferred.
  - OpenSCAD for the tool itself that inserts into the flashlight.
  - Modify the `box_outer_width` variable at the top of the file to change the size of the box for different wrench sizes.
- `12mm-finger-box-wrench.scad`
  - OLD - `HD10-bezel-tool-v2.scad` preferred.
  - Printable wrench that can fit over or be glued to the tool so the tool can be used without the need for another wrench.
  - Modify the `box_inner_width` variable at the top of the file to change wrench size.


## Photos
Tool rendering

![Tool in OpenSCAD](images/tool_scad.png)

Wrench rendering

![Wrench in OpenSCAD](images/wrench_scad.png)

Tool with HD10

![Tool with HD10](images/tool_with_ratchet.jpg)
