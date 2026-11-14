#import "../template.typ": *

== Drainage

Water is the enemy of every pavement, track bed, slope and structure. Drainage design is also where 3D modelling most often goes wrong: pipes that rise downstream, manholes with impossible depths, outfalls below river levels. This chapter explains the logic behind a drainage design so you can check it.

=== What drainage does on a linear project

+ *Collect surface water* from carriageways, track, slopes and paved areas.
+ *Convey* it through channels, pipes and ditches.
+ *Attenuate* it (store and release slowly) so downstream flood risk does not increase.
+ *Treat* it (remove sediment, hydrocarbons, metals from road runoff) before discharge.
+ *Discharge* it to watercourses, sewers or ground (infiltration), with consents.
+ *Drain the subsurface*: keep pavement foundations, track formation and slopes dry.
+ *Carry watercourses across the route* in culverts and bridges, without increasing flood risk and with passage for fish and mammals.

=== Components

#datatable(
  columns: (1.2fr, 3fr),
  header: ("Component", "Notes"),
  [*Kerbs and gullies*], [Classic urban/inter-urban collection: kerb channel flow into gully pots at intervals that limit the *flow width* on the carriageway; gully spacing increases with gradient and decreases at sag points.],
  [*Kerb drainage units, combined kerb-drains, linear drains*], [Continuous collection with fewer outlets.],
  [*Surface water channels*], [Concrete V- or triangular channels at the carriageway edge (common on UK trunk roads), discharging at outlets.],
  [*Over-the-edge drainage*], [Runoff flows over the verge into *filter drains*, ditches or swales (rural roads).],
  [*Filter (French) drains*], [Perforated pipe in permeable stone: both surface and subsurface drainage. *Fin/narrow filter drains* drain the pavement foundation.],
  [*Carrier drains, manholes, catchpits*], [The piped network. Manholes at changes of direction, gradient, size and junctions, and at maximum spacing for maintenance.],
  [*Attenuation*], [Ponds, basins, oversized pipes, cellular tanks, with flow controls (orifice, vortex control) limiting discharge to agreed rates.],
  [*Treatment / SuDS*], [Swales, filter strips, wetlands, retention ponds, bioretention, oil separators/interceptors, spillage containment (penstocks). The CIRIA *SuDS Manual (C753)* is the main UK reference.],
  [*Outfalls and headwalls*], [Discharge points with erosion protection and flap valves where backflow is possible.],
  [*Culverts*], [Pipe, box or arch structures carrying watercourses under the route; often structures in their own right (technical approval above a size threshold).],
  [*Pumping stations*], [For underpasses and sag points without a gravity outfall; critical assets.],
  [*Rail drainage*], [Cess drains, track drains (piped, between tracks), catchpits, crest and toe ditches on cuttings and embankments, under-track crossings.],
)

=== Hydrology and hydraulics in brief

- *Design storms and return periods*: networks are designed so that, e.g., pipes flow without surcharge in a frequent event (such as 1 in 1 or 1 in 2 years), the carriageway does not flood in a less frequent event (such as 1 in 5 years), and property is not flooded for the 1 in 100-year event *plus a climate change allowance*. Exact criteria depend on the client and country (UK DMRB *CG 501* for highway drainage; *CD 521* for road-edge channels and outlets; separate standards for outfalls and culverts).
- *Climate change allowances*: rainfall intensity is uplifted for future climate. UK practice uses the Environment Agency's peak rainfall allowances, typically 20–40 % depending on epoch and location. Planning authorities sometimes require specific values.
- *Runoff*: Rational method (Q = C·i·A) for small catchments; hydrograph methods (FEH/ReFH in the UK, SCS/NRCS in the US) for larger catchments and storage design.
- *Pipe hydraulics*: Colebrook-White or Manning; minimum self-cleansing velocity (around 0.75–1 m/s at pipe-full), maximum velocities, minimum pipe sizes.
- *Flow on the carriageway*: allowable flow width in the channel (to protect traffic and avoid aquaplaning) drives gully/outlet spacing.
- *Greenfield runoff rates*: discharge from new development often limited to the pre-development (greenfield) rate.
- US references: FHWA *HEC-22* (urban drainage design), *HDS-5* (culverts), *HEC-RAS* (river hydraulics). Europe: EN 752 (drain and sewer systems outside buildings).

=== Deliverables

#datatable(
  columns: (1.2fr, 3fr),
  header: ("Deliverable", "Content"),
  [Drainage strategy / report], [Catchments, discharge points and consents, attenuation and treatment approach, design criteria, flood risk assessment (FRA) link.],
  [Network calculations], [Hydraulic model results (pipe capacities, surcharge, flooding, storage volumes) for all design storms.],
  [Drainage layout drawings], [Plan with pipe runs, manholes/chambers (IDs), gullies, channels, ditches, outfalls, ponds; catchment boundaries.],
  [Longitudinal sections], [Each pipe run: ground and cover levels, invert levels, gradients, pipe sizes and materials, depths, crossings with other services.],
  [Manhole / chamber schedule], [ID, coordinates, cover level, invert levels in/out, depth, chamber size, cover class (e.g. D400 in carriageway), type, step irons/ladders, backdrop.],
  [Pipe schedule], [Length, diameter, material, gradient, bedding class, upstream/downstream nodes.],
  [Standard details], [Gullies, headwalls, filter drains, pond outlets, flow controls.],
  [Maintenance plan & asset data], [Inspection and cleaning regime; asset data for the owner's drainage database (e.g. National Highways' drainage data management system, HADDMS).],
)

=== Software

Autodesk Civil 3D pipe and pressure networks, Autodesk *InfoDrainage* (successor of MicroDrainage) and InfoWorks ICM, Bentley *OpenFlows* (StormCAD, CivilStorm, SewerGEMS) and OpenRoads drainage, 12d drainage, Flood Modeller, HEC-RAS, TUFLOW, HY-8 (culverts), Causeway Flow.

=== BIM and IFC 4.3 for drainage

Typical entities: `IfcPipeSegment` (incl. CULVERT, GUTTER types), `IfcPipeFitting`, `IfcDistributionChamberElement` (MANHOLE, INSPECTIONCHAMBER, SUMP, TRENCH …), `IfcFlowController`/`IfcValve` for flow controls, `IfcDistributionSystem` (e.g. STORMWATER, DRAINAGE) grouping the network, `IfcEarthworksElement` or surfaces for ditches, swales and ponds. Networks should keep *topology* (which pipe connects which chambers), not just geometry, so hydraulic and asset systems can use the data.

=== Checklist: reviewing a drainage model

#datatable(
  columns: (0.25fr, 3fr, 0.4fr),
  header: ("", "Check", "✓"),
  [1], [Every pipe falls in the flow direction; downstream invert ≤ upstream invert; soffits (not inverts) matched at size increases.], [☐],
  [2], [Gradients within min/max (self-cleansing and maximum velocity); pipe sizes never decrease downstream.], [☐],
  [3], [Cover depths sufficient (traffic loading, frost) and not excessive; manhole depths buildable.], [☐],
  [4], [Gullies/outlets at all sag points and flat areas; spacing consistent with flow-width calculation.], [☐],
  [5], [Outfall invert above normal (and ideally flood) water level in the receiving watercourse, or flap valve provided.], [☐],
  [6], [Attenuation volumes and flow controls match calculations; ponds have freeboard and maintenance access.], [☐],
  [7], [Model = calculations = drawings: same IDs, levels, sizes.], [☐],
  [8], [Clashes with utilities, foundations, piles, OLE foundations, retaining walls, sign and lighting foundations.], [☐],
  [9], [Network topology complete (no orphan pipes/chambers); system and catchment assignment.], [☐],
  [10], [Cover classes appropriate to location (carriageway, verge, footway).], [☐],
)

#builder[
  - Treat drainage as a *network graph* (nodes = chambers, edges = pipes) with topology checks: connectivity, flow direction, invert continuity, size progression.
  - Rule checks for cover depth, gradient, velocity (from linked hydraulic results), and outfall vs water level.
  - Low-point detection on finished road surfaces cross-checked with gully positions.
  - Generate manhole and pipe schedules and long sections from the model; compare them with the hydraulic model by ID.
]

#keypoints[
  - Drainage = collect → convey → attenuate → treat → discharge, plus subsurface drainage and culverts.
  - Design is driven by return periods, climate change allowances, flow widths and discharge limits.
  - Deliverables are layouts, long sections, schedules and calculations, all of which must agree.
  - Model drainage as a network with topology, and check it with simple hydraulic rules.
]
