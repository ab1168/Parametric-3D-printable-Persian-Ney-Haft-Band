/*
=========================================================
 PERSIAN NEY HAFT-BAND — V4 (Sol Tuning)
 Seven-piece modular 3D-printable Ney

 TUNING:   Sol (G)
 UNITS:    millimeters
 LICENSE:  MIT (see LICENSE file)

 ACOUSTIC TUNING REQUIRES PHYSICAL TESTING.
 The hole positions are based on proportional ratios
 and may need fine adjustment after printing.
=========================================================
*/

// Circle quality. Higher = smoother curves but slower rendering.
// 100 is fine for normal work; reduce to 50-60 if rendering is slow.
$fn = 100;


// =======================================================
// 1. MAIN DIMENSIONS
// =======================================================

// Total length of the instrument in mm.
// Example: 540 mm = 54 cm, the standard length for a Sol Ney.
// For lower tunings (e.g. Fa), increase this value (e.g. 600).
total_length = 540;

// Number of printable sections.
// Example: 7 means the instrument is split into 7 parts.
// Reduce to 5 for longer parts and fewer joints.
number_of_parts = 7;

// Outer diameter of the tube in mm.
// Example: 22 mm. Standard range for Persian Ney: 20–23 mm.
outer_diameter = 22;

// Inner bore diameter in mm.
// Example: 16 mm. Wall thickness = (22-16)/2 = 3 mm.
// Smaller bore (e.g. 14) → brighter sound.
// Larger bore (e.g. 18) → darker, warmer sound.
inner_diameter = 16;

// Length of each section (computed automatically).
// Example: 540 / 7 ≈ 77.14 mm.
part_length = total_length / number_of_parts;

// Outer and inner radii (for internal calculations).
ro = outer_diameter / 2;
ri = inner_diameter / 2;

// Wall thickness in mm.
wall = ro - ri;


// =======================================================
// 2. INTERNAL BAMBOO NODES
// =======================================================

// Diameter of the narrowed bore at each node.
// Example: 12.5 mm — the bore narrows from 16 to 12.5 at nodes.
// This simulates natural bamboo nodes and affects tone color.
band_bore_diameter = 12.5;

// Width of the narrow central section of the node.
// Example: 5 mm.
band_width = 5;

// Taper length on each side of the node.
// Example: 3 mm per side. Total node length = 3+5+3 = 11 mm.
band_taper_length = 3;

// Node positions from the mouthpiece (z=0).
// IMPORTANT: Each node (with taper) must fit entirely within one section,
// and must not overlap any finger hole. The values below are pre-tuned:
// - 35, 89: fine
// - 195: shifted from 189 to avoid the hole at 185
// - 240: shifted from 243 to avoid the hole at 255
band_positions = [
    35,
    89,
    195,
    240,
    343,
    397,
    497
];


// =======================================================
// 3. MALE / FEMALE CONNECTIONS
// =======================================================

// Length of the male connector that inserts into the next section.
// Example: 16 mm.
male_length = 16;

// Outer diameter of the male connector.
// Example: 19.2 mm (slightly smaller than the 22 mm body).
male_outer_diameter = 19.2;

// Clearance between male and female parts.
// Example: 0.25 mm per side → female ID is 0.5 mm larger than male OD.
// If joints are too tight after printing, increase to 0.3–0.4.
joint_clearance = 0.25;

// Female inner diameter (computed automatically).
// Example: 19.2 + 2×0.25 = 19.7 mm.
female_inner_diameter = male_outer_diameter + 2*joint_clearance;

// Enable/disable the snap-fit locking system.
// true = a small ridge on the male and matching groove on the female.
snap_fit = true;

// Snap ridge height.
// Example: 0.25 mm. If the joint is loose, increase to 0.3–0.4.
snap_height = 0.25;

// Snap ridge width (along the tube axis).
// Example: 1.5 mm.
snap_width = 1.5;

// Retaining groove width in the female part.
// Example: 2 mm (slightly wider than the 1.5 mm ridge).
groove_width = 2;

// Groove offset from the female opening.
// Example: 2 mm.
groove_position = 2;

// Enable/disable flexible slots in the male connector.
// true = the male is split into flexible fingers for easier insertion.
snap_slots = true;

// Width of each slot.
// Example: 0.8 mm. Increase to 1.0 if your printer has low resolution.
slot_width = 0.8;

// Number of slots around the male connector.
// Example: 4 slots (every 90°).
slot_count = 4;

// Distance from each slot's end to the male tip.
// Example: 3 mm — keeps the male tip solid and unbroken.
slot_end_margin = 3;


// =======================================================
// 4. FINGER HOLES (Sol Tuning)
// =======================================================

// Diameter of finger holes.
// Example: 7 mm is standard for a Persian Ney.
// Larger (e.g. 8) → warmer; smaller (e.g. 6) → brighter.
hole_diameter = 7;

// Extra cutter depth beyond the inner wall.
// Example: 2 mm ensures the hole fully penetrates the wall.
// Increase to 3–4 if holes are not fully open after printing.
hole_cut_extra = 2.0;

// Front hole positions from the mouthpiece (z=0).
// Array order: from the one closest to the mouthpiece to the farthest.
// Spacing within each hand group: 25–28 mm.
// Spacing between the two hand groups: 45 mm.
// Layout (from mouthpiece to open end):
//   Thumb hole at 105
//   Hand A group:  130, 157, 185
//   Hand B group:  230, 255
front_holes = [
    130,   // hole 1 — first finger of upper hand
    157,   // hole 2 — +27 mm
    185,   // hole 3 — +28 mm
    230,   // hole 4 — first finger of lower hand (+45 mm)
    255    // hole 5 — +25 mm
];

// Rear thumb hole position from the mouthpiece.
// MUST be closer to the mouthpiece than any front hole.
// Example: 105 mm — 25 mm above the first front hole.
back_hole = 105;


// =======================================================
// 5. MOUTHPIECE
// =======================================================

// Desired finished inner diameter at the mouthpiece entrance.
// Example: 10 mm.
mouthpiece_start_id = 10;

// Length of the conical transition from mouthpiece to main bore.
// Example: 30 mm. Longer → softer tone; shorter → sharper tone.
mouthpiece_cone_length = 30;

// Plastic lining thickness (Teflon tape / silicone tube).
// Example: 0.3 mm. Protects the lips and prevents moisture.
plastic_wrap_thickness = 0.3;

// Compensate the CAD opening for the plastic wrap.
// true = CAD opening is enlarged so the finished ID equals mouthpiece_start_id.
compensate_for_wrap = true;

// Actual CAD opening (computed automatically).
// Example: 10 + 2×0.3 = 10.6 mm.
mouthpiece_bare_id = mouthpiece_start_id + (compensate_for_wrap ? 2*plastic_wrap_thickness : 0);

// Width of the notch on the mouthpiece.
// Example: 9 mm — marks the lip rest position.
mouthpiece_notch_width = 9;

// Depth of the mouthpiece notch.
// Example: 3 mm.
mouthpiece_notch_depth = 3;


/* =========================================
   LOWER-END CONICAL GEOMETRY
   ========================================= */

// Enable outer taper at the open end.
// true = outer diameter narrows from 22 to 18 over the last 25 mm.
lower_outer_conical = true;

// Enable inner taper at the open end.
// true = inner diameter narrows from 16 to 12 over the last 25 mm.
lower_inner_conical = true;

// Length of the tapered region.
// Example: 25 mm.
lower_cone_length = 25;

// Outer diameter at the very end.
// Example: 18 mm.
lower_end_outer_diameter = 18;

// Inner diameter at the very end.
// Example: 12 mm.
lower_end_inner_diameter = 12;

// Number of facets for the cone (reserved for future curved implementation).
lower_cone_segments = 40;


// =======================================================
// 6. DISPLAY / INSPECTION
// =======================================================

// 0 = show all 7 parts side by side (print layout)
// 1–7 = show only that single part
part_number = 0;

// false = separate parts (for printing)
// true = assembled instrument (for inspection)
assembly_view = false;

// Enable half-section view (for inspecting the internal bore).
cross_section_view = false;

// 0 = remove positive X half
// 1 = remove negative X half
cross_section_side = 0;

// Reserved for future slice inspection.
inspection_extra = 1;


// =======================================================
// 7. INTERNAL BORE
// =======================================================
// Builds the internal bore for each section.
// Part 1: conical mouthpiece + cylindrical bore.
// Part 7: cylindrical bore + conical end.
// Others: cylindrical bore.

module main_bore(n) {
    if (n == 1) {
        cylinder(h=mouthpiece_cone_length, d1=mouthpiece_bare_id, d2=inner_diameter);
        translate([0,0,mouthpiece_cone_length])
            cylinder(h=part_length - mouthpiece_cone_length + 1, d=inner_diameter);
    }
    else if (n == number_of_parts && lower_inner_conical) {
        // Cylindrical bore up to the cone start
        translate([0,0,-male_length-1])
            cylinder(h=(part_length - lower_cone_length) + male_length + 2, d=inner_diameter);
        // Conical bore at the open end
        translate([0,0,part_length - lower_cone_length - 0.1])
            cylinder(h=lower_cone_length + 0.2, d1=inner_diameter, d2=lower_end_inner_diameter);
    }
    else {
        translate([0,0,-male_length-1])
            cylinder(h=part_length+male_length+2, d=inner_diameter);
    }
}


// =======================================================
// 8. INTERNAL BAMBOO NODE
// =======================================================
// Builds a solid node with a narrow central passage.
// The node's outer surface is flush with the inner wall.

module internal_node(z) {
    translate([0, 0, z-band_taper_length])
    difference() {
        // Solid node cylinder
        cylinder(h=band_width+2*band_taper_length, d=inner_diameter);
        // Narrow passage with tapered transitions
        union() {
            cylinder(h=band_taper_length, d=inner_diameter);
            translate([0,0,band_taper_length])
                cylinder(h=band_taper_length, d1=inner_diameter, d2=band_bore_diameter);
            translate([0,0,2*band_taper_length])
                cylinder(h=band_width, d=band_bore_diameter);
            translate([0,0,2*band_taper_length+band_width])
                cylinder(h=band_taper_length, d1=band_bore_diameter, d2=inner_diameter);
        }
    }
}


// =======================================================
// 9. PLACE INTERNAL NODES
// =======================================================
// Renders only the nodes that fit entirely within section n.

module section_nodes(n) {
    z_start = (n-1)*part_length;
    z_end = n*part_length;
    for (z = band_positions) {
        if (z-band_taper_length >= z_start && z+band_width+band_taper_length <= z_end) {
            internal_node(z-z_start);
        }
    }
}


// =======================================================
// 10. BODY AND CONNECTORS
// =======================================================

module connector_outer(n) {
    difference() {
        union() {
            // Main body (with optional lower-end cone for the last part)
            if (n == number_of_parts && lower_outer_conical) {
                cylinder(h=part_length - lower_cone_length, d=outer_diameter);
                translate([0,0,part_length - lower_cone_length])
                    cylinder(h=lower_cone_length, d1=outer_diameter, d2=lower_end_outer_diameter);
            } else {
                cylinder(h=part_length, d=outer_diameter);
            }

            // Male connector (parts 2–7)
            if (n > 1) {
                translate([0,0,-male_length])
                    cylinder(h=male_length, d=male_outer_diameter);
                if (snap_fit) {
                    translate([0,0,-male_length+2])
                        cylinder(h=snap_width, d=male_outer_diameter+2*snap_height);
                }
            }
        }

        // Female socket (parts 1–6)
        if (n < number_of_parts) {
            translate([0,0,part_length-male_length])
                cylinder(h=male_length+0.1, d=female_inner_diameter);
            if (snap_fit) {
                translate([0,0,part_length-male_length+groove_position])
                    cylinder(h=groove_width, d=female_inner_diameter+2*snap_height);
            }
        }

        // Flexible slots on the male connector (parts 2–7)
        if (n > 1 && snap_fit && snap_slots) {
            for (a = [0:360/slot_count:359]) {
                rotate([0,0,a])
                    translate([-slot_width/2, 0, -male_length])
                        cube([slot_width, male_outer_diameter/2+1, male_length-slot_end_margin]);
            }
        }

        // Internal bore
        main_bore(n);

        // Mouthpiece notch (part 1 only)
        if (n == 1) {
            translate([-mouthpiece_notch_width/2, -ro-1, 0])
                cube([mouthpiece_notch_width, ro+2, mouthpiece_notch_depth]);
        }
    }
}


// =======================================================
// 11. FINGER HOLES (OVERLAP-AWARE)
// =======================================================
// Checks actual circle overlap with each region (not just the center),
// so that a hole straddling a joint is cut through both sides.

module finger_holes(n) {
    z_start = (n-1)*part_length;
    z_end   = z_start + part_length;
    cutter_depth = wall + 2*hole_cut_extra;
    hr = hole_diameter / 2;

    // FRONT HOLES
    for (z = front_holes) {
        in_main = (z + hr > z_start) && (z - hr < z_end);
        in_male = (n > 1) && (z + hr > z_start - male_length) && (z - hr < z_start);
        if (in_main || in_male) {
            translate([0, -ro - hole_cut_extra, z - z_start])
                rotate([-90, 0, 0])
                    cylinder(h=cutter_depth, d=hole_diameter, center=false);
        }
    }

    // REAR THUMB HOLE
    in_main = (back_hole + hr > z_start) && (back_hole - hr < z_end);
    in_male = (n > 1) && (back_hole + hr > z_start - male_length) && (back_hole - hr < z_start);
    if (in_main || in_male) {
        translate([0, ro + hole_cut_extra, back_hole - z_start])
            rotate([90, 0, 0])
                cylinder(h=cutter_depth, d=hole_diameter, center=false);
    }
}


// =======================================================
// 12. COMPLETE SECTION
// =======================================================

module ney_section(n) {
    difference() {
        union() {
            connector_outer(n);
            section_nodes(n);
        }
        finger_holes(n);
    }
}


// =======================================================
// 13. CROSS-SECTION INSPECTION
// =======================================================

module inspection_cut() {
    if (cross_section_view) {
        difference() {
            children();
            if (cross_section_side == 0) {
                translate([0, -100, -100]) cube([100, 200, 1000]);
            } else {
                translate([-100, -100, -100]) cube([100, 200, 1000]);
            }
        }
    } else {
        children();
    }
}


// =======================================================
// 14. INDIVIDUAL PART DISPLAY
// =======================================================

if (part_number >= 1 && part_number <= number_of_parts) {
    inspection_cut() {
        translate([0,0,male_length])
            ney_section(part_number);
    }
}


// =======================================================
// 15. PRINT LAYOUT (ALL PARTS SIDE BY SIDE)
// =======================================================

if (part_number == 0 && !assembly_view) {
    for (i = [1:number_of_parts]) {
        translate([(i-1)*(outer_diameter+12), 0, male_length])
            ney_section(i);
    }
}


// =======================================================
// 16. ASSEMBLED INSTRUMENT
// =======================================================

if (assembly_view) {
    inspection_cut() {
        union() {
            for (i = [1:number_of_parts]) {
                translate([0, 0, (i-1)*part_length])
                    ney_section(i);
            }
        }
    }
}