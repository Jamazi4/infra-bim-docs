#import "../template.typ": *

== Utilities

Utility diversions are among the most common causes of delay on road and rail projects. They are usually designed and built by *third parties* (the utility owners), have long lead times, and depend on records that are often wrong. The BIM challenge is to represent *uncertain* information honestly and to coordinate it early.

=== What counts as a utility

Water mains and service pipes, sewers (foul, surface, combined), gas (low/medium/intermediate/high pressure), electricity (LV, HV, EHV cables; overhead lines and pylons), telecoms and fibre, street lighting and traffic signal cables, district heating, oil/fuel and chemical pipelines, and the project's own systems (ITS ducts, rail signalling and power cables). Owners are the *utility companies* (in the UK, *statutory undertakers*) with legal rights to keep their apparatus in place or be compensated for moving it.

=== Finding utilities: quality levels

Utility information has *quality levels* that describe how it was obtained:

#datatable(
  columns: (0.8fr, 2.2fr, 2.2fr),
  header: ("Level", "UK PAS 128:2022", "US ASCE 38-22"),
  [*D*], [*QL-D*: desktop utility records search only.], [*QL-D*: existing records and one-call/oral information only.],
  [*C*], [*QL-C*: records + site reconnaissance (visible features such as covers, valves, poles) correlated with records.], [*QL-C*: records + survey of visible above-ground features.],
  [*B*], [*QL-B*: detection with geophysical methods (EMLD, GPR), subdivided *B1–B4* by method and confidence.], [*QL-B*: designating horizontal position with geophysics, tied to the project survey datum.],
  [*A*], [*QL-A*: verification by exposure (trial holes / vacuum excavation) with measured horizontal and vertical position at the exposed point.], [*QL-A*: locating by exposure; precise horizontal and vertical position, size, material, condition recorded.],
)

PAS 128:2022 also defines the survey deliverables and how accuracy and confidence are reported. ASCE 38-22 (Subsurface Utility Engineering, SUE) adds *utility attribute* requirements and a professional standard of care. Many US DOTs require SUE to ASCE 38-22. In practice, a project combines all levels: QL-D everywhere, QL-B along the corridor, QL-A at critical conflicts (pile positions, deep excavations, tunnel portals).

#warning(title: "Records lie")[
  Utility records are frequently schematic (“about 1 m from the kerb”), missing depth, outdated after decades of works, or missing entirely for abandoned apparatus. A utility shown in a federated model from records alone (QL-D) should *look* uncertain: different colour or transparency, a positional tolerance buffer, and its quality level as a property. Otherwise designers will treat it as surveyed.
]

=== The diversion process

In the UK, the *New Roads and Street Works Act 1991* (NRSWA) and its *Code of Practice for Measures Necessary where Apparatus is Affected by Major Works* define a staged process between the promoter (highway/rail authority or its contractor) and each utility:

#datatable(
  columns: (0.9fr, 3fr),
  header: ("Stage", "Content"),
  [*C2*], [Preliminary enquiry: the utility provides records and a preliminary assessment of whether apparatus is affected.],
  [*C3*], [Budget estimate: the utility provides an outline diversion scheme and a budget cost.],
  [*C4*], [Detailed design and firm estimate: the utility designs the diversion; the promoter then orders the works, which are executed with costs shared under the Code of Practice.],
)

Other countries have similar staged agreements. The US uses *utility relocation agreements* and SHRP2's *Utility Conflict Matrix* (UCM), a structured table of each conflict, its resolution and responsibility.

Key planning facts:
- Lead times of 6–24 months for HV electricity or major gas and water mains are common. Utility diversions are often on the *critical path*.
- Many diversions must be done *before* main works start (enabling works), during specific seasons (e.g. no gas main outages in winter, no water main shutdowns in summer peaks).
- Some apparatus is protected in place (slabbing, sleeving, load-spreading) rather than diverted.

=== Utility conflict management

A *utility conflict register* (or matrix) is the core coordination artefact. Each line:

- conflict ID, location (chainage/structure/coordinates), utility owner, type and size, quality level;
- the design element in conflict (pile, drainage run, pavement box-out, OLE foundation, tunnel portal);
- proposed resolution (divert, lower, protect, design change, trial hole to confirm);
- responsible party, stage (C2–C4), cost estimate, programme dates;
- status and evidence (trial hole results).

BIM supports this with *clash detection* between proposed works and existing utilities with tolerance buffers sized by quality level, and with issues tracked in BCF linked to the register.

=== Design rules and clearances

- Minimum separation between services (and from foundations, trees, drainage) per utility company standards and national guidance (in the UK, NJUG guidelines on positioning and colour coding).
- Minimum cover depths (by service type and location: carriageway, footway, verge).
- Access for maintenance: no new structures or ponds over mains without agreement; easements.
- Colour coding of ducts and marker tapes differs by country. In the US, the APWA uniform colour code is used for surface marking: red electric, yellow gas/oil, orange communications, blue potable water, green sewer/drain, purple reclaimed water, white proposed excavation, pink temporary survey marks.

=== Data standards and registers

- *PAS 128:2022* (UK survey specification) and *PAS 256* (sharing buried asset information).
- *ASCE 38-22* (US SUE) and ASCE 75 (recording and exchanging utility infrastructure data).
- *National Underground Asset Register (NUAR)* in the UK: a government-led digital map of buried assets that brings utility records together for safe digging and planning.
- *IFC 4.3*: `IfcPipeSegment`, `IfcCableSegment`, `IfcCableCarrierSegment` (ducts), `IfcDistributionChamberElement`, `IfcDistributionSystem` (by system type), plus properties for owner, quality level and status (existing/proposed/abandoned/to be removed).
- *Security*: utility data is often sensitive (ISO 19650-5). Restrict access in the CDE and apply sensitivity labels.

=== Deliverables

Utility survey drawings and 3D model (with quality levels), utility records compilation, trial hole reports, utility conflict register/matrix, diversion and protection designs (by the utility or the contractor), C2–C4 correspondence, utility programme, and as-laid records after diversion.

=== Checklist: reviewing utility information

#datatable(
  columns: (0.25fr, 3fr, 0.4fr),
  header: ("", "Check", "✓"),
  [1], [Every utility object has owner, type, size, status (existing/proposed/abandoned) and *quality level*.], [☐],
  [2], [Depths: is the vertical position measured (QL-A) or assumed? Assumed depths flagged.], [☐],
  [3], [Clash detection uses tolerance buffers consistent with quality levels.], [☐],
  [4], [Conflicts with piles, foundations, drainage, OLE bases, excavations and tunnels captured in the conflict register.], [☐],
  [5], [Diversion routes clear of the permanent works and of each other; separation and cover rules met.], [☐],
  [6], [Diversions programmed (lead times, outages, seasonal constraints) and in the 4D model.], [☐],
  [7], [Sensitive utility data access-controlled in the CDE.], [☐],
)

#builder[
  - Store *quality level*, positional accuracy and source on every utility object; render uncertainty visually (transparency, buffers).
  - Tolerance-aware clash detection: buffer = f(quality level, utility type).
  - A built-in *utility conflict register* linked to clashes, trial holes, BCF issues and the programme.
  - Import PAS 128 / ASCE 38 survey deliverables and utility owner records (CAD, GIS, shapefile, GeoJSON) with source tagging.
]

#keypoints[
  - Utilities are third-party assets with long lead times, and often on the critical path.
  - Quality levels (PAS 128 / ASCE 38-22: D → C → B → A) say how reliable each line is; show them in the model.
  - The utility conflict register, staged agreements (C2–C4 in the UK) and early trial holes are the management tools.
  - Utility data is uncertain and sensitive: model it honestly and protect it.
]
