#import "../template.typ": *

== OpenBIM for Linear Infrastructure

Buildings are organised by storeys. Roads, railways and bridges are organised by *alignments*, *chainage* and *sections*. This chapter covers the parts of IFC 4.3 and the georeferencing practice that make infrastructure models work. They also shape how every BEP, LOIN table and 4D model for infra has to be written.

=== IFC 4.3 in one page

IFC 4.3 (ISO 16739-1:2024) merged several buildingSMART infrastructure projects (IFC Alignment, IFC Bridge, IFC Road, IFC Rail, IFC Ports & Waterways, and common infrastructure extensions) into one schema. The main additions:

#datatable(
  columns: (1.3fr, 3fr),
  header: ("Concept", "New in IFC 4.3"),
  [Facilities], [`IfcFacility` subtypes: `IfcBridge`, `IfcRoad`, `IfcRailway`, `IfcMarineFacility`, plus `IfcBuilding`. Facility parts: `IfcBridgePart`, `IfcRoadPart`, `IfcRailwayPart`, `IfcMarinePart`, `IfcFacilityPart`.],
  [Alignment], [`IfcAlignment` composed of horizontal, vertical and cant layouts (`IfcAlignmentHorizontal`, `IfcAlignmentVertical`, `IfcAlignmentCant`) made of `IfcAlignmentSegment`s. Business logic (design parameters) and geometric representation (`IfcCompositeCurve`, `IfcGradientCurve`, `IfcSegmentedReferenceCurve`) are both stored.],
  [Linear placement], [`IfcLinearPlacement` positions objects by distance along an alignment (+ offsets). `IfcReferent` marks stations, kilometre posts and reference points.],
  [Infra geometry], [`IfcSectionedSolidHorizontal`, `IfcSectionedSurface`, `IfcDirectrixDerivedReferenceSweptAreaSolid`: profiles swept along an alignment with varying cross sections, which is how corridors and decks are made.],
  [Road], [`IfcCourse`, `IfcPavement`, `IfcKerb`, `IfcEarthworksCut`, `IfcEarthworksFill`, `IfcSign`, `IfcSignal`, road part types (carriageway, shoulder, roadside, intersection …).],
  [Rail], [`IfcRail`, `IfcTrackElement` (sleeper, fastening …), `IfcCourse` (ballast), OLE and signalling elements, rail part types (track structure, superstructure, substructure …).],
  [Bridge], [`IfcBridge` (types: arched, cable-stayed, cantilever, culvert, framework, girder, suspension, truss), `IfcBridgePart` (types include deck, deck segment, pier, pier segment, pylon, abutment, foundation, substructure, superstructure, surface structure), `IfcBearing`, `IfcTendon`, `IfcTendonConduit`, `IfcReinforcingBar`, `IfcDeepFoundation` / `IfcPile`.],
  [Geotechnics], [`IfcGeotechnicalStratum`, `IfcBorehole`, `IfcGeomodel`, `IfcGeoslice` for ground models and investigation data.],
  [Georeferencing], [`IfcMapConversion` (+ `IfcMapConversionScaled` in IFC 4.3 for a project grid scale factor), `IfcProjectedCRS` with EPSG codes.],
)

#figure(
  {
    set text(font: ("Menlo"), size: 7.6pt)
    rect(width: 100%, inset: 8pt, fill: rgb("#f4f6f8"), stroke: none, radius: 3pt)[
      ```
      IfcProject  (units, IfcProjectedCRS + IfcMapConversion)
       └─ IfcSite
           ├─ IfcAlignment "ML-01"  (horizontal, vertical, cant layouts; IfcReferent stations)
           ├─ IfcRoad "A99 Main line"
           │   ├─ IfcRoadPart CARRIAGEWAY  ── IfcCourse, IfcPavement, IfcKerb …
           │   └─ IfcRoadPart ROADSIDE     ── IfcEarthworksFill, IfcSign …
           └─ IfcBridge "B01 Riverside Overbridge" (GIRDER)
               ├─ IfcBridgePart SUPERSTRUCTURE
               │   └─ IfcBridgePart DECK ── IfcBeam (girders), IfcSlab (deck slab), IfcRailing (parapets)
               └─ IfcBridgePart SUBSTRUCTURE
                   ├─ IfcBridgePart ABUTMENT "A1" ── IfcWall, IfcFooting, IfcBearing
                   ├─ IfcBridgePart PIER "P1"     ── IfcColumn, IfcBeam (crosshead), IfcBearing
                   └─ IfcBridgePart FOUNDATION    ── IfcFooting (pile cap), IfcPile
      ```
    ]
  },
  caption: [A typical IFC 4.3 spatial breakdown for a highway scheme with one bridge.],
)

#warning(title: "Software support is uneven")[
  Export and import of IFC 4.3 matured during 2023–2026, but support differs a lot between products and versions, especially for alignments (cant, transition curves other than clothoids), linear placement, and bridge-specific entities. buildingSMART runs a software certification programme for IFC 4.3. Always run a *test exchange during mobilisation* (ISO 19650-2 §5.5) and write the result into the BEP.
]

=== Alignment: the backbone of every infrastructure model

As a highway/rail modeller you know alignments well. What matters for information management:

- *Every object should be locatable by alignment + chainage + offset*, not only by coordinates. Asset registers, inspection systems, traffic management and 4D planning all work in chainage.
- Horizontal geometry: lines, circular arcs, transition curves (*clothoid* in most countries; *Bloss*, *cubic parabola*, *sine/cosine* or *Helmert/Viennese bend* in some rail standards; IFC 4.3 supports several).
- Vertical geometry: constant gradients and vertical curves (usually *parabolic* in roads; *circular* in many rail standards).
- *Cant* (superelevation in rail) is a separate layout in IFC 4.3. Roads usually express superelevation in the corridor cross-section instead.
- *Station equations* (chainage breaks) must be preserved. Losing them shifts every chainage-referenced object downstream.

#tip(title: "Alignments and bridges")[
  Bridge geometry is usually defined *relative to the road or rail alignment*: deck edges as offsets, pier positions as chainages along the alignment and skew angles to it, bearing levels from the vertical profile minus the deck depth. If the alignment changes, the bridge model must update. This is the single biggest source of coordination errors between highway and structures teams. Chapter 10 returns to it.
]

=== Coordinates, datums and the scale factor

#datatable(
  columns: (1.2fr, 3fr),
  header: ("Issue", "Why it matters"),
  [Projected CRS], [National grids (e.g. OSGB36 British National Grid, ETRS89/UTM, state plane) distort distances. In UTM the *point scale factor* ranges from 0.9996 on the central meridian to about 1.0004 near the zone edge, i.e. up to ±40 cm per km.],
  [Grid vs ground], [Designers sometimes work in *ground* (true) distances while the survey is in *grid*. A 1 km bridge or viaduct can be several centimetres to decimetres out. Many rail and long-bridge projects use a *low-distortion project grid* (e.g. the snake projections used for UK rail projects such as HS2).],
  [Height datum], [Orthometric heights (above geoid) vs ellipsoidal (GNSS). Must be stated with the geoid model.],
  [Large coordinates], [Six- and seven-digit coordinates cause floating-point jitter in many authoring tools. Use a local origin + documented transformation (IfcMapConversion) and never “move the model to 0,0” without recording it.],
  [Units], [Metres for infra, but survey feet (US) vs international feet still cause errors in US projects.],
)

=== BCF, issue management and federation

The *BIM Collaboration Format* (BCF 2.1/3.0) carries issues (viewpoint, element GUIDs, comment, status) independently of the model file. Federation tools (Navisworks, Solibri, BIMcollab, Revizto, Trimble Connect, Bentley iTwin, Autodesk Construction Cloud) exchange issues via BCF or the BCF API. For linear projects, it helps a lot if issues also carry the *chainage* and *structure ID*. Most tools do not do this natively, so projects add it as a label or custom field.

=== Model breakdown for linear projects

There is no “level 1, level 2” to split by. Common strategies, often combined:

+ *By discipline:* highways, structures, drainage, geotechnics, utilities, track, OLE, signalling, landscaping, ITS.
+ *By section/chainage:* e.g. 2 km sections with defined overlaps, aligned with *construction sections* so 4D and quantity take-off follow the same breakdown.
+ *By asset:* each structure (bridge, culvert, retaining wall, gantry) as its own volume with an asset ID.
+ *By system:* drainage networks, utility networks, signalling systems.

#builder[
  - Make *alignment + chainage + offset* a first-class property of every object, computed automatically and exported to IFC as linear placement or at least as properties.
  - Validate georeferencing on import (EPSG code present, map conversion present, scale factor documented). Warn when a model's coordinates are far from the project extent.
  - Preserve station equations and the alignment's *business logic* (segment parameters), not just tessellated geometry.
  - Treat a chainage range as a valid *location* in naming, filtering, 4D and issue tracking.
]

#keypoints[
  - IFC 4.3 gives infrastructure its own spatial structure (`IfcRoad`, `IfcRailway`, `IfcBridge` + parts) and the *alignment* as a reference for placement.
  - Chainage-based thinking runs through everything: model breakdown, naming, LOIN, 4D, asset data.
  - Georeferencing (CRS, height datum, scale factor) belongs in the information standard and must be tested in mobilisation.
]
