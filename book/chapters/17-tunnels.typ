#import "../template.typ": *

== Tunnels

Tunnels combine the ground uncertainty of geotechnics, the structural design of bridges, the systems complexity of railways and some of the strictest safety rules in infrastructure. They are also where the construction method shapes the design most strongly.

=== Tunnel types and construction methods

#datatable(
  columns: (1.15fr, 1.6fr, 1.9fr),
  header: ("Method", "How it works", "Typical use and BIM implications"),
  [*Cut and cover*], [Excavate a trench between retaining walls (diaphragm, secant pile, sheet pile), build the box, backfill. *Bottom-up* (build from the base) or *top-down* (roof slab first, then excavate underneath, which allows early reinstatement of the surface).], [Shallow tunnels, stations, portals, underpasses. Heavy temporary works (props, dewatering); strong interface with utilities and traffic management.],
  [*TBM: EPB*], [Earth Pressure Balance shield supports the face with excavated soil under pressure; screw conveyor; precast segmental lining erected inside the shield.], [Soft ground with low permeability (clays, silts); metros and rail tunnels.],
  [*TBM: slurry / mixshield*], [Face supported by pressurised bentonite slurry; spoil pumped out and separated in a treatment plant.], [Permeable granular soils, high groundwater, under rivers.],
  [*TBM: hard rock*], [Open gripper, single or double shield machines cutting rock with disc cutters.], [Rock tunnels, long base tunnels.],
  [*SCL / NATM*], [Sequential excavation with sprayed concrete lining and support (rock bolts, lattice girders), using the strength of the surrounding ground; often a secondary cast lining afterwards.], [Short tunnels, caverns, cross passages, junctions, variable cross-sections, mixed ground.],
  [*Drill and blast*], [Rock excavated by blasting rounds; support by bolts and shotcrete.], [Rock tunnels where TBMs are uneconomic; lower capital cost, slower.],
  [*Immersed tube*], [Prefabricated elements floated, sunk into a dredged trench and joined underwater.], [Shallow water crossings with soft beds.],
  [*Pipe jacking / microtunnelling / box jacking*], [Units jacked from a launch pit.], [Utility tunnels, short crossings under railways and roads.],
)

=== The parts of a tunnel

- *Portals* and *approach ramps* (often cut and cover, with retaining walls).
- *Shafts*: TBM launch and reception, ventilation, emergency access, intermediate stations.
- *Primary lining*: precast *segments* forming *rings* (e.g. 6 segments + key; ring widths ~1.2–2.0 m; *tapered universal rings* rotated to steer the alignment), or sprayed concrete.
- *Waterproofing* (membranes, gaskets between segments) and possibly a *secondary lining*.
- *Invert*, track bed or road deck, walkways, cable troughs, drainage and *sumps* with pumping.
- *Cross passages* between twin bores (emergency egress; spacing set by safety rules, often a few hundred metres on rail tunnels).
- *Mechanical and electrical (M&E) / tunnel systems*: ventilation (longitudinal jet fans, transverse or semi-transverse systems, smoke extraction), fire detection and suppression, lighting (high-luminance entrance zones for road tunnels), emergency points, CCTV, radio, PA, power, SCADA, traffic control (road tunnels).

=== Safety requirements

#datatable(
  columns: (1.2fr, 3fr),
  header: ("Source", "Content"),
  [*EU Directive 2004/54/EC*], [Minimum safety requirements for road tunnels on the Trans-European Road Network longer than 500 m: tunnel manager and safety officer roles, risk analysis, emergency exits (where provided, no more than 500 m apart), ventilation, lighting, emergency stations, drainage of flammable liquids, traffic control.],
  [*TSI SRT*], [EU Technical Specification for Interoperability *Safety in Railway Tunnels*: evacuation, safe areas, cross passages or escape shafts, fire resistance, firefighting points.],
  [*NFPA 502 / NFPA 130*], [US standards for road tunnels and fixed-guideway transit systems (fire life safety, ventilation, egress).],
  [*National guidance*], [e.g. UK DMRB tunnel standards, German RABT for road tunnels, PIARC technical reports, BTS/ITA guidelines (lining design, fire), *BTS Specification for Tunnelling*.],
)

=== Design topics

#datatable(
  columns: (1.2fr, 3fr),
  header: ("Topic", "Explanation"),
  [*Alignment and space proofing*], [Horizontal/vertical alignment (minimum radius for TBM steering; gradients for drainage and rail limits), *space proofing* of the internal cross-section for the kinematic envelope or road traffic envelope, walkways, OLE, ventilation fans, signs and systems.],
  [*Ground and groundwater*], [GI along the route, *GBR* for contractual risk (Chapter 14), face stability, groundwater control (dewatering, grouting, ground freezing).],
  [*Lining design*], [Loads from ground and water, TBM jacking forces, segment handling and stacking, joints and gaskets, fire resistance (e.g. RWS / hydrocarbon fire curves; polypropylene fibres against spalling), durability (120-year design life is common).],
  [*Settlement and impact assessment*], [Predicted surface settlement trough (empirical Gaussian methods: *volume loss* as % of face area, trough width parameter), then assessment of buildings, utilities and infrastructure. A three-stage approach is standard: (1) screen by settlement contours, (2) estimate tensile strains and assign *Burland damage categories* 0–5 (negligible → very severe), (3) detailed analysis for sensitive structures, with mitigation (compensation grouting, underpinning).],
  [*Instrumentation and monitoring*], [Settlement points, inclinometers, extensometers, piezometers, building tilt monitoring, convergence in the tunnel; *trigger levels* (green/amber/red) with predefined actions; links to TBM parameters (face pressure, grout volume).],
  [*Numerical analysis*], [PLAXIS, FLAC, RS2/RS3, Midas GTS NX, Abaqus for ground–structure interaction, staged excavation and 3D effects at junctions and shafts.],
)

=== Deliverables

Tunnel alignment and profile, typical cross-sections and space-proofing drawings, segment and ring drawings (geometry, reinforcement or fibre specification, gaskets, bolts, grout holes), ring build sequence / ring schedule, shaft and portal GAs, cross-passage designs (SCL sequences and support classes), waterproofing details, M&E layouts and schematics, ventilation and fire design reports, *settlement contour plots and building damage assessments*, instrumentation and monitoring plan, GBR, and during construction the *as-built ring data* (ring position, deviation from design alignment, ovality, segment IDs), TBM logs and monitoring records.

=== BIM for tunnels

- *Ring-by-ring modelling*: segments as objects with ring number, position (key segment position), segment ID, cast date and supplier. As-built ring position comes from the TBM guidance system. The as-built tunnel is generated from data, not drawn.
- *TBM data integration*: advance rate (typically 10–30 m/day for soft-ground TBMs in good conditions), face pressure, grout volume and thrust linked to chainage and to monitoring results. This is a natural *digital twin* and 4D use case.
- *Settlement BIM*: settlement contours and damage categories linked to building objects (from city models) and utilities; alignment options compared by impact. Research tools at universities (Birmingham, Strathclyde and others) have shown real-time settlement-risk assessment inside BIM frameworks.
- *Software*: Bentley OpenTunnel Designer, Allplan, Civil 3D + Revit + Dynamo workflows, Tekla (segments and rebar), Rhino/Grasshopper for parametric rings, plus TBM-supplier and monitoring platforms.
- *IFC*: IFC 4.3 has no dedicated tunnel entity. buildingSMART's *IFC Tunnel* project has developed a schema extension (requirements analysis from 2020, conceptual model and test projects since then) planned for a future IFC release. Until then, projects use `IfcFacility`/`IfcFacilityPart` with classification, generic built elements, and project property sets. Check the current buildingSMART status before specifying.

=== Checklist: reviewing a tunnel model

#datatable(
  columns: (0.25fr, 3fr, 0.4fr),
  header: ("", "Check", "✓"),
  [1], [Space proofing: kinematic/traffic envelope, walkways, systems and tolerances (construction and alignment deviation) fit inside the lining.], [☐],
  [2], [Ring geometry follows the alignment within steering tolerance; ring sequence and key positions valid (no continuous longitudinal joints).], [☐],
  [3], [Cross passages, sumps, low points and drainage falls consistent with the vertical profile.], [☐],
  [4], [Shafts and portals coordinated with utilities, traffic management and existing structures.], [☐],
  [5], [Settlement contours and damage categories for every building and asset in the zone of influence; mitigation recorded.], [☐],
  [6], [Instrumentation modelled with trigger levels and owners.], [☐],
  [7], [Safety provisions (exit spacing, ventilation, fire systems) meet the governing directive or standard.], [☐],
  [8], [As-built ring data captured and linked to segment objects.], [☐],
)

#builder[
  - Parametric ring generation along an alignment (universal tapered rings, key position rules) and *as-built ring import* from TBM guidance data.
  - Space-proofing envelope sweeps with tolerance offsets.
  - Settlement trough computation from volume loss and trough parameters along the alignment; damage category per building, linked to city/asset models.
  - Time-series data (TBM, monitoring) linked to chainage and model objects, as a foundation for 4D and digital twin views.
]

#keypoints[
  - The construction method (cut and cover, TBM type, SCL, drill and blast, immersed tube) is chosen by ground, water, depth, length and surface constraints.
  - Tunnels are governed by strict safety rules (EU 2004/54/EC, TSI SRT, NFPA 502/130).
  - Settlement and building damage assessment (volume loss → strains → Burland categories) is a core deliverable and a good BIM use case.
  - IFC Tunnel is still in development. Ring-based modelling and TBM data integration are where tunnel BIM adds value today.
]
