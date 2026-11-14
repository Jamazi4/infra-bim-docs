#import "../template.typ": *

== Bridge Design Process, Codes and Analysis

This chapter explains what bridge designers actually do, in the order they do it, and what analysis their software must support. You will not learn to design a bridge from it. You will learn enough to understand a design basis, follow a calculation package, and specify software functions.

=== Design stages and technical approval

Every country has a gated process in which an *independent authority* agrees the design basis before detailed design, and *certifies* the design before construction. The names differ:

#datatable(
  columns: (1.2fr, 1.6fr, 1.6fr, 1.6fr),
  header: ("Stage", "UK (DMRB CG 300)", "USA (typical State DOT)", "Germany (RE-ING, Bundesfernstraßen)"),
  [Options / feasibility], [Options report; preliminary structures report], [Planning, NEPA; bridge type selection], [Vorplanung, Variantenuntersuchung],
  [Design basis agreed], [*Approval in Principle (AIP)* agreed by the Technical Approval Authority (TAA)], [*TS&L* (Type, Size & Location) report approved by DOT bridge office], [Entwurf (RE-ING) approved; *Bauwerksentwurf*],
  [Detailed design], [Detailed design + calcs; *Design & Check Certificate*; check category 0–3 (Cat 3 = independent check by a separate organisation)], [Preliminary plans (30 %) → 60 % → 90 % → final *PS&E* (Plans, Specifications & Estimate)], [Ausführungsplanung; independent checking engineer (*Prüfingenieur*) checks the structural calculations (*Prüfstatik*)],
  [Construction], [Construction compliance certificates; temporary works checks], [Shop drawings review, RFIs], [Werkstattpläne, Bauüberwachung],
  [Handover / operation], [As-built records, *H&S file*, maintenance manual, inventory & inspection (CS 450)], [As-builts, *load rating* (AASHTO MBE), NBI/SNBI inventory, inspection], [Bauwerksbuch, inspection to DIN 1076, data in SIB-Bauwerke / ASB-ING],
)

#note(title: "What an AIP contains (UK)")[
  The AIP is a short, form-based document that records the agreed *basis* for design: the structure's location, type and principal dimensions; the reasons for choosing it; the design life; the codes and standards and any *departures* from them; the loads (traffic, special vehicles, rail loading, accidental loads); ground conditions and foundation type; clearances and constraints; durability and inspection/maintenance access; the proposed construction method; and the check category. It has a validity period (typically three years) and must be re-approved if the basis changes. A US TS&L report plays the same role.
]

=== Design codes

#datatable(
  columns: (1.1fr, 3fr),
  header: ("Code family", "Key parts for bridges"),
  [*Eurocodes* (EU, UK, many others)], [EN 1990 (basis, + Annex A2 for bridges: combinations, deformations and vibrations for rail), EN 1991-1-x (actions: self-weight, snow, wind, thermal, execution, accidental), *EN 1991-2 (traffic loads on bridges)*, EN 1992-2 (concrete bridges), EN 1993-2 (steel bridges), EN 1994-2 (composite bridges), EN 1997 (geotechnics), EN 1998-2 (seismic, bridges). Always used with the country's *National Annex*. The *second generation* is being published 2023–2027 (EN 1990:2023, EN 1991-2:2023 …), with a transition period during which both generations coexist (BSI plans to withdraw the first generation in 2028).],
  [*AASHTO LRFD* (USA, many other countries)], [AASHTO LRFD Bridge Design Specifications, *10th edition (2024)*, plus State DOT bridge design manuals; AASHTO Guide Specifications for LRFD Seismic Bridge Design; *Manual for Bridge Evaluation (MBE)* for load rating; AREMA Manual for rail bridges in North America.],
  [*UK DMRB*], [National Highways' Design Manual for Roads and Bridges: CG 300 (technical approval), CD 350 (design of highway structures), CD 3xx/CS 4xx series (assessment, inspection, bearings, joints, parapets…), on top of the Eurocodes + UK NA. Network Rail has its own NR/L2/CIV standards for rail bridges.],
  [*Others*], [Chinese JTG / TB codes, Indian IRC / IRS codes, Canadian CSA S6, Australian AS 5100, Japanese JRA specifications, Russian SP, Middle East (often AASHTO or BS/Eurocode with local amendments).],
)

=== Loads (actions) on bridges

#datatable(
  columns: (1.15fr, 3fr),
  header: ("Action", "What it is (with Eurocode / AASHTO references)"),
  [Permanent], [Self-weight of structure (DC), superimposed dead load: surfacing, waterproofing, parapets, services (DW/SDL; surfacing often with upper/lower bound for re-surfacing), *prestress*, *creep and shrinkage*, earth pressure, differential settlement.],
  [Road traffic (EN 1991-2)], [*LM1*: tandem system (axle loads 300/200/100 kN in lanes 1/2/3) + UDL (9 kN/m² lane 1, 2.5 kN/m² elsewhere), on 3 m notional lanes, with National Annex adjustment factors. *LM2*: single 400 kN axle (local effects). *LM3*: special/abnormal vehicles (National Annex, e.g. UK SV and SOV models). *LM4*: crowd 5 kN/m². Braking/acceleration, centrifugal forces, footway loads, fatigue load models FLM1–5.],
  [Road traffic (AASHTO)], [*HL-93*: design truck (8–32–32 kip axles) or design tandem (2 × 25 kip) *plus* design lane load 0.64 kip/ft; dynamic load allowance 33 % on truck/tandem; multiple presence factors; fatigue truck; State permit vehicles for load rating.],
  [Rail traffic (EN 1991-2)], [*LM71* (four 250 kN axles + 80 kN/m) with factor α (often 1.1 or more for main lines); *SW/0* and *SW/2* (heavy) for continuous structures; dynamic factor Φ; *HSLM* trains for dynamic analysis when speed > 200 km/h or resonance risk; traction (33 kN/m) and braking (20 kN/m) forces with caps; nosing (100 kN), centrifugal forces; derailment design situations; *track–bridge interaction*.],
  [Environmental], [Wind (EN 1991-1-4; dynamic/aeroelastic for long spans), thermal: *uniform* temperature change (expansion/contraction) and *temperature gradient* through the deck depth (EN 1991-1-5), snow (rarely governing), water flow and debris, ice, waves.],
  [Seismic], [EN 1998-2 / AASHTO seismic guide spec: response spectrum or time-history analysis, ductile vs limited-ductile design, seat lengths, seismic isolation bearings.],
  [Accidental], [Vehicle collision with piers and parapets, ship impact, derailment, fire, explosion. Robustness.],
  [Construction], [Execution loads (EN 1991-1-6): wet concrete, construction equipment, launching gantry, form travellers, wind during erection.],
)

==== Combinations and limit states

Loads are combined with partial factors and combination factors into *limit states*:

- *Ultimate (ULS):* strength (bending, shear, torsion, punching, buckling), equilibrium (uplift at bearings), fatigue, and in Eurocode terms STR/GEO/EQU/FAT. Typical factors: permanent ≈ 1.35, road traffic ≈ 1.35 (Eurocode) or live load 1.75 (AASHTO Strength I), rail traffic ≈ 1.45.
- *Serviceability (SLS):* stress limits, crack widths, decompression in prestressed concrete, deflections, vibrations, deck twist (rail), comfort criteria.
- AASHTO names: Strength I–V, Extreme Event I–II, Service I–IV, Fatigue I–II.

A bridge design produces thousands of load combinations and envelopes. Software that cannot manage combinations efficiently is unusable for bridges.

=== Analysis methods

#datatable(
  columns: (1.2fr, 2.4fr, 1.6fr),
  header: ("Method", "What it is", "Used for"),
  [*Line beam* (1D)], [Each girder analysed as a beam; transverse distribution by factors (AASHTO distribution factors).], [Preliminary design; routine US girder bridges.],
  [*Grillage*], [Deck modelled as a grid of longitudinal and transverse beams (Hambly's method).], [Slab and beam-and-slab decks, skew decks; still widespread in UK practice.],
  [*FE shell / plate*], [Deck and girders as shell elements, often with beam elements for girders (offset).], [Complex geometry, wide decks, local effects, box girders.],
  [*FE solid*], [3D solids.], [Local details: anchorages, diaphragms, pier heads, bearing zones, connections.],
  [*Influence lines / surfaces & moving load*], [Response at a point to a unit load at every position; the software places the load model in the worst position automatically.], [All traffic loads. A must-have function.],
  [*Construction stage analysis*], [Structure assembled stage by stage, with element activation, changing supports, prestress and time-dependent creep/shrinkage (EN 1992 / fib Model Code / AASHTO / CEB-FIP).], [Every concrete and composite bridge built in stages; ILM, cantilever, cable-stayed.],
  [*Prestress design*], [Tendon geometry, friction and wobble losses, anchorage slip, time losses, equivalent loads.], [PSC decks.],
  [*Dynamic analysis*], [Modal analysis; moving train time-history (HSLM); pedestrian-induced vibration of footbridges; deck acceleration checks (e.g. EN 1990 A2 limits such as 3.5 m/s² for ballasted track).], [High-speed rail, footbridges, slender decks.],
  [*Seismic*], [Response spectrum, time-history, pushover; bearing/isolator modelling.], [Seismic regions.],
  [*Non-linear*], [Geometric (P-Δ, large displacement, cable sag), material (cracking, plasticity), contact.], [Cable-stayed/suspension, arches, assessment of existing bridges.],
  [*Buckling*], [Linear/non-linear stability.], [Steel plate girders (especially during deck pour), arches, slender piers.],
  [*Track–bridge interaction*], [Rails, deck and supports modelled with non-linear track resistance springs; checks additional rail stresses (typically ≤ 72 N/mm² compression / 92 N/mm² tension for CWR on ballast) and deck displacements under braking and temperature.], [Rail bridges and viaducts with continuous welded rail (EN 1991-2 §6.5.4 / UIC 774-3).],
  [*Soil–structure interaction*], [Springs or coupled geotechnical models; cyclic earth pressure on integral abutments.], [Integral bridges, piles, retaining structures.],
  [*Aerodynamics*], [Vortex shedding, buffeting, flutter; wind tunnel or CFD.], [Long spans, slender decks, cables.],
)

==== The analytical model is not the physical model

A crucial point for BIM. The *analytical model* is a simplification: girders are lines at their centroid, bearings are springs or nodes, the deck is a grillage with fictitious transverse members, and supports are idealised. The *physical (BIM) model* has true solids. The two are related but *not* identical:

- Node positions lie on centroid/neutral axes or on the bearing centreline, not on surfaces.
- Section properties may be *effective* (shear lag, cracked, composite with modular ratio) rather than geometric.
- Construction stages exist in the analysis model and often not in the BIM model.

#tip(title: "How engineers really work")[
  Most bridge teams keep separate tools: a *geometry/BIM* tool (alignment-based modeller) and an *analysis* tool. The link is usually one-way at the start (geometry → analysis via a centreline + cross-section export) and then manual. Integrated suites (e.g. Allplan Bridge, OpenBridge Designer, SOFiSTiK, MIDAS CIM, LUSAS with Revit link) try to keep both in sync. Round-tripping design changes from analysis back to the BIM model is still the weak point of the industry.
]

=== Design checks: what the calculation package contains

A typical design calculation report for a highway bridge has:

+ *Design basis* (copy of AIP/TS&L), codes, materials, durability (exposure classes, cover), design life (typically 100–120 years for bridges).
+ *Loads* and combinations.
+ *Analysis model* description, idealisation, validation (hand checks, equilibrium checks).
+ *Superstructure*: longitudinal bending, shear, torsion; transverse slab design; cantilever; prestress; fatigue; SLS stress and crack checks; deflections and precamber.
+ *Bearings*: design forces (max/min vertical, horizontal), movements, rotations → bearing schedule.
+ *Expansion joints*: movement range and setting temperatures → joint schedule.
+ *Substructure*: piers, crossheads, abutments (including earth pressure), wing walls.
+ *Foundations*: pile loads, settlement, lateral capacity (with geotechnical input).
+ *Parapets/barriers*, drainage, special details.
+ *Construction stages* and temporary conditions; *camber*.
+ *Robustness*, accidental situations, *inspection and maintenance* considerations.

#builder[
  - Keep a typed link between *physical elements* and *analytical members* (with offsets), so design forces can be attached to bearings, piers and girders in the BIM model.
  - Bearing and joint schedules should be *generated from data* (forces, movements, types, preset values) and be traceable to the analysis run that produced them.
  - Record *design code + national annex + edition* as project metadata and on the analysis results. With two Eurocode generations in parallel, you will need to know which one was used.
  - Validation rules: spans and support chainages in analysis = in BIM model (within tolerance); bearing type and function consistent between schedule, model and analysis; material grades consistent.
]

#keypoints[
  - Design runs through gated stages with independent approval: AIP / TS&L / Entwurf → detailed design → check & certification.
  - Codes: Eurocodes (+ NA), AASHTO LRFD (10th ed.), plus client standards (DMRB, Network Rail, State DOT manuals).
  - Bridge analysis = moving loads, construction stages, time-dependent effects, prestress, dynamics and, for rail, track–bridge interaction.
  - The analytical model is an *idealisation* of the physical model; keeping them consistent is the core BIM challenge for bridges.
]
