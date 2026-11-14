#import "../template.typ": *

== Bridge Software and Workflows

=== The software map

Bridge work uses more specialised tools than road or rail design. A typical project touches four or five packages. Products change fast. The list below gives *examples* in each category (not a recommendation), as of 2026.

#datatable(
  columns: (1.2fr, 2.3fr, 2fr),
  header: ("Category", "Examples", "Role"),
  [*Alignment & corridor*], [Autodesk Civil 3D; Bentley OpenRoads / OpenRail Designer; Trimble Novapoint / Quadri; 12d Model; Card/1; Allplan civil tools], [Source of the road/rail alignment, profile, cross-section and terrain the bridge sits on.],
  [*Parametric bridge modelling*], [Allplan Bridge; Bentley OpenBridge Modeler / Designer; SOFiSTiK Bridge Modeler; MIDAS CIM; Autodesk Revit + Civil 3D (with Dynamo-based or add-in bridge tools); Tekla Structures; OpenBrIM; Rhino + Grasshopper; CATIA / 3DEXPERIENCE (complex projects)], [Physical 3D model driven by alignment, stations and cross-section templates; drawings; quantities; IFC.],
  [*General bridge analysis*], [MIDAS Civil (NX); LUSAS Bridge; CSiBridge; SOFiSTiK; Bentley RM Bridge; Allplan Bridge (analysis); LARSA 4D; Autodesk Structural Bridge Design; Dlubal RFEM; Strand7; SAP2000; Brigade/Plus], [Moving loads, construction stages, prestress, time-dependent effects, dynamic & seismic analysis, code checks.],
  [*Routine / code-specific design*], [AASHTOWare Bridge Design & Rating (BrD/BrR); PGSuper/PGSplice (WSDOT, free); Bentley LEAP (CONSPAN, RC-PIER, STEEL); MDX; national tools in many countries], [Fast design/rating of standard girder bridges, piers; US load rating.],
  [*Advanced / local FE*], [Abaqus, ANSYS, DIANA, LS-DYNA, ATENA], [Non-linear and local analysis, assessment of existing structures, impact.],
  [*Connections & details*], [IDEA StatiCa (steel connections, concrete details, prestressed members); RFEM add-ons], [Code-checking of joints, anchorage zones, discontinuity regions.],
  [*Reinforcement & steel detailing*], [Allplan Engineering; Tekla Structures; Revit rebar; Bentley ProStructures; Nemetschek / Trimble fabrication links], [Rebar 3D model, bar bending schedules, steel shop drawings, CNC data.],
  [*Geotechnical*], [PLAXIS; LPILE / GROUP; GeoStudio; Oasys], [Foundations, piles, integral abutment soil interaction.],
  [*Hydraulics / scour*], [HEC-RAS; Flood Modeller; TUFLOW; HY-8 (culverts)], [Water levels, freeboard, scour depth.],
  [*Federation, review, 4D*], [Navisworks; Synchro; Bentley iTwin; Solibri; Revizto; BIMcollab; Trimble Connect; Dalux], [Coordination, clash, checking, 4D.],
)

#note(title: "What practitioners say")[
  Engineers' forum discussions typically describe a split: a simple tool (or in-house spreadsheet) for preliminary sizing, then a general FE package (MIDAS, LUSAS, CSiBridge, SOFiSTiK, RM, LARSA) for final design, with an *independent* package used by the checker so that results are verified by a different model and often different software. Strong opinions exist on usability (MIDAS is considered powerful but complex, LUSAS and CSiBridge more approachable), but the choice is usually driven by company standard, code coverage and the checker's software.
]

=== A typical bridge BIM workflow

#figure(
  {
    set text(font: heading-font, size: 7.6pt)
    let bx(t, c) = rect(width: 100%, inset: 5pt, radius: 3pt, fill: c.lighten(85%), stroke: 0.8pt + c, align(center + horizon, t))
    let ar = align(center + horizon, text(size: 11pt, fill: muted)[→])
    grid(columns: (1fr, 0.25fr, 1fr, 0.25fr, 1fr, 0.25fr, 1fr), row-gutter: 8pt,
      bx([*1 Alignment* \ road/rail centreline, profile, superelevation (LandXML / IFC / native)], accent), ar,
      bx([*2 Bridge layout* \ support chainages, skews, spans, clearances, deck cross-section], accent), ar,
      bx([*3 Parametric model* \ deck, girders, piers, abutments, bearings referencing alignment], good), ar,
      bx([*4 Analysis model* \ centreline + sections + supports → FE; load models, stages], warn),
      grid.cell(colspan: 7, align(right, text(size: 11pt, fill: muted)[↓ #h(1.2cm)])),
      bx([*8 Delivery* \ IFC 4.3, drawings (PDF), schedules, data to CDE; later as-built + AIM], tool), align(center + horizon, text(size: 11pt, fill: muted)[←]),
      bx([*7 Drawings & schedules* \ GA, setting-out, rebar, bearing & joint schedules, BBS], good), align(center + horizon, text(size: 11pt, fill: muted)[←]),
      bx([*6 Detailing* \ rebar, tendons, steel connections, embedded items], good), align(center + horizon, text(size: 11pt, fill: muted)[←]),
      bx([*5 Design checks* \ ULS/SLS/fatigue; results → sizes, prestress, bearing forces], warn),
    )
  },
  caption: [Typical bridge BIM workflow. Iterations between steps 3–5 are frequent; any alignment change restarts the loop at step 2.],
)

==== Step by step

+ *Import the alignment* from the road/rail designer. Check: same CRS, same chainage (including station equations), same version. The bridge team should *reference* the alignment, not copy it.
+ *Lay out the bridge*: support lines at chainages with skew angles, span arrangement, deck width (from the road cross-section, including widening on curves), clearance envelopes below (road headroom, e.g. 5.3 m; rail gauge and OLE clearance; navigation and flood freeboard).
+ *Build the parametric model*: deck cross-section templates (varying along the alignment), girders placed by offset, piers and abutments as parametric components at support lines, bearings on plinths, deck levels = road profile − surfacing − deck depth (with crossfall).
+ *Derive the analysis model* (by export or within an integrated tool): centrelines, section properties, supports and bearings (stiffness, fixity), load lanes from the road cross-section, construction stages.
+ *Analyse and design*: iterate sizes, prestress, reinforcement; produce design forces for bearings, joints and foundations.
+ *Detail*: reinforcement (often in a separate detailing tool), tendons, steel connections, drainage, ducts, embedded items, parapet anchors.
+ *Produce drawings and schedules* from the model (Chapter 11).
+ *Deliver* to the CDE: native, IFC 4.3, PDF drawings, schedules, calculations. In construction, update to *as-built* with survey data.

=== Interoperability: where the problems are

#datatable(
  columns: (1.3fr, 3fr),
  header: ("Interface", "Typical issues"),
  [Alignment → bridge], [Transition curve types not supported; station equations lost; vertical curve type (parabola vs circle) changed; superelevation not transferred; version mismatch (bridge built on an outdated alignment).],
  [Physical → analytical], [Varying sections approximated; skew and curvature simplified; offsets between centroid and bearing level lost; diaphragms omitted; manual rework after every change.],
  [Analysis → physical], [Results (forces, tendon profiles, rebar areas) rarely flow back automatically; tendon geometry re-entered by hand.],
  [Bridge → IFC 4.3], [Exporters may map everything to `IfcBuildingElementProxy` or `IfcBeam`; bridge parts missing; no linear placement; property sets not mapped; huge tessellated files for swept geometry.],
  [Bridge ↔ highway model], [Interface ownership: approach slabs, wing walls vs earthworks, drainage, parapet-to-road-barrier transitions, utilities in deck.],
  [Rebar → fabrication], [Bar shapes must match the shape codes of the bending standard (BS 8666, ISO 4066 or the national equivalent), and BBS data must match the drawings exactly.],
)

#tip(title: "What to test in a mobilisation exchange")[
  Before production, export one *pilot structure* (e.g. a two-span overbridge) through every link in the chain: alignment → bridge model → analysis → IFC 4.3 → federation tool → 4D tool → asset data. Check spans, levels, chainages, bearing data, classification and property sets at each step. Write the results into the BEP and the risk register (ISO 19650-2 §5.5.3).
]

#builder[
  - Build bridges from *alignment-relative parameters* (station, offset, skew, elevation from profile) and keep the link live: an alignment revision should flag every dependent bridge.
  - Provide a *physical ↔ analytical mapping* (element GUID ↔ member/node IDs) and export to at least one common analysis format. Validate equilibrium-relevant data (spans, support conditions, section properties).
  - Export IFC 4.3 with correct `IfcBridge` / `IfcBridgePart` structure, `IfcBearing` with `PredefinedType`, linear placement (or at least station/offset properties), classification and project property sets. Run a *self-check* with an IDS before export.
  - Make *alignment version* a property of the bridge model, so federation tools can detect mismatches.
]

#keypoints[
  - Separate tools for alignment, parametric modelling, analysis, detailing and federation are normal. The *interfaces* are where errors happen.
  - The bridge must follow the alignment, which is the reason for parametric, station-based modelling.
  - Analytical and physical models differ by design; their mapping must be explicit.
  - Test the whole chain on a pilot structure during mobilisation.
]
