# Persian Ney Haft-Band — Sol Tuning (3D-Printable)

A parametric, seven-piece, 3D-printable **Persian Ney Haft-Band** in the key of **Sol (G)**, designed in OpenSCAD.

![status](https://img.shields.io/badge/status-ready%20for%20printing-brightgreen)
![tuning](https://img.shields.io/badge/tuning-Sol%20(G)-blue)
![length](https://img.shields.io/badge/length-540%20mm-lightgrey)
![license](https://img.shields.io/badge/license-MIT-green)

> ⚠️ **Acoustic tuning requires physical testing.** Hole positions are based on proportional ratios and may need fine adjustment after printing.

---

## Table of Contents

- [What is a Ney Haft-Band?](#what-is-a-ney-haft-band)
- [Features](#features)
- [Repository Contents](#repository-contents)
- [Quick Start](#quick-start)
- [Parameter Reference](#parameter-reference)
- [Printing Recommendations](#printing-recommendations)
- [Assembly](#assembly)
- [Tuning & Calibration](#tuning--calibration)
- [Design Notes & Known Limitations](#design-notes--known-limitations)
- [License](#license)

---

## What is a Ney Haft-Band?

The **Ney** is one of the oldest wind instruments still played today, central to Persian classical music. The **Haft-Band** ("seven-node") variety is a Ney with internal bamboo nodes that influence its distinctive tone color.

This project provides a **parametric OpenSCAD model** for a 3D-printable Haft-Band in **Sol tuning (G)**, inspired by traditional bamboo Neys. It is a **modular instrument**: seven sections print separately and snap together.

---

## Features

- **Seven modular printable sections** with male/female snap-fit joints
- **Internal bamboo nodes** with tapered transitions (bamboo-like feel and tone)
- **Conical mouthpiece bore** with plastic-wrap compensation
- **Five front finger holes + one rear thumb hole**
- **Conical open end** (outer and inner taper) for a natural look and stable tuning
- **Overlap-aware hole cutting**: holes that straddle a joint are cut through both parts
- **Half-section inspection view** for verifying the internal bore
- **Fully parametric**: change tuning, length, diameters, and hole positions

---

## Repository Contents


---

## Quick Start

1. **Install [OpenSCAD](https://openscad.org/)** (version 2021.01 or newer recommended).
2. Open either `ney_haft_band_sol_en.scad` or `ney_haft_band_sol_fa.scad`.
3. By default, all 7 sections appear side by side — ready to export.
4. **File → Export → Export as STL** to generate printable files.
5. Print all seven parts, then assemble (see [Assembly](#assembly)).
6. **Fine-tune the tuning** by gently enlarging or filling holes (see [Tuning & Calibration](#tuning--calibration)).

---

## Parameter Reference

All parameters are at the top of the `.scad` file, grouped by section. The most important ones:

### Main Dimensions

| Parameter | Default | Description |
| :--- | :--- | :--- |
| `total_length` | `540` | Total instrument length in mm (540 mm = 54 cm, standard for Sol) |
| `number_of_parts` | `7` | Number of printable sections |
| `outer_diameter` | `22` | Outer tube diameter (mm). Standard: 20–23 mm |
| `inner_diameter` | `16` | Inner bore diameter (mm). Wall = (OD–ID)/2 |

### Internal Nodes

| Parameter | Default | Description |
| :--- | :--- | :--- |
| `band_bore_diameter` | `12.5` | Narrow bore at each node |
| `band_width` | `5` | Length of narrow central section |
| `band_taper_length` | `3` | Taper length on each side |
| `band_positions` | `[35, 89, 195, 240, 343, 397, 497]` | Node positions from mouthpiece (z=0). Each node must fit entirely within one section. |

### Joints

| Parameter | Default | Description |
| :--- | :--- | :--- |
| `male_length` | `16` | Length of male connector |
| `male_outer_diameter` | `19.2` | Male connector OD |
| `joint_clearance` | `0.25` | Clearance per side (increase if too tight) |
| `snap_fit` | `true` | Enable/disable the snap-fit lock |
| `snap_slots` | `true` | Enable flexible slots on the male connector |

### Finger Holes (Sol tuning)

| Parameter | Default | Description |
| :--- | :--- | :--- |
| `hole_diameter` | `7` | Finger hole diameter (mm) |
| `hole_cut_extra` | `2.0` | Extra cutter depth to ensure full penetration |
| `front_holes` | `[130, 157, 185, 230, 255]` | Front hole positions from mouthpiece |
| `back_hole` | `105` | Rear thumb hole position |

**Hole layout** (from mouthpiece to open end):

| Position | Element | Spacing |
| :--- | :--- | :--- |
| 105 | **Thumb hole (rear)** | — |
| 130 | Front hole 1 (upper hand) | 25 mm |
| 157 | Front hole 2 | 27 mm |
| 185 | Front hole 3 | 28 mm |
| **230** | **Front hole 4 (lower hand)** | **45 mm (between-hand gap)** |
| 255 | Front hole 5 | 25 mm |

### Mouthpiece

| Parameter | Default | Description |
| :--- | :--- | :--- |
| `mouthpiece_start_id` | `10` | Finished inner diameter at the entrance |
| `mouthpiece_cone_length` | `30` | Length of conical transition |
| `plastic_wrap_thickness` | `0.3` | Plastic wrap thickness (compensated automatically) |

### Lower End Cone

| Parameter | Default | Description |
| :--- | :--- | :--- |
| `lower_outer_conical` | `true` | Narrow the outer diameter at the end |
| `lower_inner_conical` | `true` | Narrow the inner diameter at the end |
| `lower_cone_length` | `25` | Length of tapered region |
| `lower_end_outer_diameter` | `18` | Outer diameter at the very end |
| `lower_end_inner_diameter` | `12` | Inner diameter at the very end |

---

## Printing Recommendations

- **Material**: PLA is fine for a first prototype; PETG or ABS offer better durability and moisture resistance. **Do not use brittle resin.**
- **Layer height**: 0.15–0.20 mm for a good balance of quality and speed.
- **Wall/perimeter count**: at least **3 walls** (3 × 0.4 mm nozzle ≈ 1.2 mm) for airtight walls — critical for a wind instrument.
- **Infill**: 15–25% is sufficient; walls dominate acoustic performance.
- **Supports**: none needed if printed vertically (parts are designed with this in mind).
- **Orientation**: print each section vertically with the **male end down** or the **female end down** (either works; the female end down gives a cleaner mouthpiece for part 1).
- **Post-processing**: gently sand hole edges with 400–600 grit sandpaper to improve airflow. A smooth inner bore improves tone.

**First-print suggestion**: print a single section (e.g. `part_number = 2`) to verify joint clearances before committing to all seven.

---

## Assembly

1. Lay out the seven printed sections in order: **Section 1 = mouthpiece**, **Section 7 = open end**.
2. Gently insert each male connector into the next section's female socket. The snap-fit ridge should click into its groove.
3. If a joint is too tight, lightly sand the male connector. If too loose, add a thin layer of Teflon tape or increase `snap_height` in the code and reprint.
4. Verify the bore is continuous by looking through the assembled instrument toward a light source.

---

## Tuning & Calibration

- **Mouthpiece wrap**: wrap the mouthpiece with 0.3 mm Teflon tape (or a piece of silicone tubing) to reach the designed 10 mm final inner diameter.
- **Hole tuning**: after printing and playing, use a **round file** to slightly enlarge any hole that sounds flat, or fill it with beeswax/putty to raise the pitch. **Always make small adjustments and re-test.**
- **Overall pitch**: if the whole instrument is consistently flat or sharp, adjust the effective length by trimming the open end (sharpens) or adding a small extension (flattens).
- **Node tuning**: the internal nodes strongly affect tone color. If the sound is too "open", slightly enlarge the node bore; if too "closed", reduce it.

> **Note:** A 3D-printed Ney will never sound identical to a bamboo Ney — the material and surface roughness differ. Expect it to be a **practice instrument** or a **starting point** for personalization.

---

## Design Notes & Known Limitations

- **Hole positions** follow proportional ratios derived from standard Ney measurements. They are **a starting point**, not a final tuning.
- **Band (node) positions** must satisfy two constraints:
  1. Each node (with its taper) must fit **entirely within one section**.
  2. Each node must **not overlap any finger hole**.
  If you change `total_length`, `number_of_parts`, or `front_holes`/`back_hole`, re-check `band_positions` accordingly.
- **`lower_cone_segments`** is currently unused (the cone is linear). It is reserved for a future curved-taper implementation.
- **`inspection_extra`** is currently unused. Reserved for a future slice-inspection mode.
- The **snap-fit** is designed for FDM printing. If you print in resin, expect tighter tolerances and consider reducing `snap_height`.

---

## License

MIT — see [LICENSE](LICENSE) for details.

You are free to use, modify, and redistribute this design for personal or commercial purposes, with attribution.

---

## Acknowledgements

- Inspired by traditional Persian Ney Haft-Band instruments.
- Acoustic ratios and hole spacing informed by general Ney construction literature.
- Built with [OpenSCAD](https://openscad.org/).