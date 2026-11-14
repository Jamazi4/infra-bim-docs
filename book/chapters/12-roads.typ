#import "../template.typ": *

== Roads and Highways

You have modelled many roads. This chapter adds the *engineering view*: the design rules behind the corridor, the pavement design behind the layers, the deliverables, and the checks a reviewer (or your software) should run.

=== Road hierarchy and design standards

Roads are designed according to their *function* (motorway, expressway, all-purpose trunk road, distributor, local/access road, street), their *environment* (rural/urban) and their *design speed*. Each country has a design manual that turns these into geometric limits:

#datatable(
  columns: (1.1fr, 3fr),
  header: ("Region", "Key geometric design standards"),
  [UK (strategic roads)], [DMRB: *CD 109* Highway link design (alignment, sight distance), *CD 127* Cross-sections and headrooms, CD 116 roundabouts, CD 122 grade-separated junctions, CD 123 at-grade priority and signal junctions, plus the *Departures from Standard* process. Local roads use Manual for Streets and local authority guides.],
  [USA], [AASHTO *A Policy on Geometric Design of Highways and Streets* (“Green Book”), 7th edition 2018, more performance-based and multimodal than earlier editions; an 8th edition has been in development under NCHRP. Supplemented by State DOT design manuals, MUTCD (signs and markings) and the AASHTO Roadside Design Guide.],
  [Germany], [RAA (motorways), RAL (rural roads), RASt (urban streets), RPS (passive protection systems), RStO (pavement structure).],
  [Others], [Austroads (Australia/NZ), TAC (Canada), IRC (India), national standards in Scandinavia, Middle East (often AASHTO-based with local amendments).],
)

=== Geometric design elements

#datatable(
  columns: (1.2fr, 3fr),
  header: ("Element", "Design logic and typical checks"),
  [*Design speed*], [Selected per road class and environment; drives all other limits. Some standards use a *speed-related* approach, deriving design speed from the alignment constraint and layout (e.g. the UK's alignment constraint and layout constraint method).],
  [*Horizontal alignment*], [Straights, circular curves, transition curves (clothoid). Minimum radius depends on design speed and maximum superelevation; desirable vs absolute minimum values; relaxations and departures.],
  [*Superelevation (crossfall)*], [Typically up to 5–7 % (rural roads; up to 8–10 % in some US cases, lower in urban areas). *Rollover* points and superelevation development (rate of rotation, length) must avoid flat areas where water ponds: the resultant gradient should not drop below roughly 0.5 %.],
  [*Vertical alignment*], [Gradients (desirable max ~3–4 % on motorways, steeper on lower-class roads), vertical curves (parabolic) sized by *K values* for crest (sight distance) and sag (comfort, headlight distance).],
  [*Sight distance*], [*Stopping sight distance (SSD)* everywhere; overtaking sight distance on single carriageways; junction visibility splays. Checked in 3D against verges, barriers, bridge piers, noise fences, vegetation and signs.],
  [*Coordination*], [Horizontal and vertical curves should be *phased* (vertical curves within horizontal curves) to avoid hidden dips and misleading alignments.],
  [*Cross-section*], [Lane widths (3.65 m UK motorway; 12 ft / 3.6 m US), hard shoulders or hard strips, central reserve with safety barrier, verges, footways and cycleways, *headroom* under structures (5.3 m in the UK plus allowances), widening on tight curves.],
  [*Junctions*], [Priority, signalised, roundabouts, grade-separated (diamond, trumpet, cloverleaf, free-flow). Checked with *swept-path analysis* (design vehicles) and junction capacity models (e.g. ARCADY, PICADY, LinSig, Synchro, VISSIM).],
)

=== Pavement design

The pavement is designed to carry the *cumulative traffic* over its design life without unacceptable deterioration.

#datatable(
  columns: (1.1fr, 3fr),
  header: ("Concept", "Explanation"),
  [*Pavement types*], [*Flexible* (asphalt layers on granular base), *rigid* (concrete slabs: jointed plain JPCP, jointed reinforced, continuously reinforced CRCP), *composite* (asphalt over a cement-bound or concrete base).],
  [*Layers (top down)*], [Surface course → binder course → base (roadbase) → sub-base → capping (if subgrade weak) → subgrade (formation). Each is a separate object/course in the model.],
  [*Design traffic*], [Converted to *standard axles*: UK designs in *msa* (million standard axles, 80 kN) per *DMRB CD 226*; AASHTO 1993 uses *ESALs* (18-kip equivalent single axle loads). Mechanistic–empirical methods (AASHTO MEPDG / *Pavement ME*) use full axle-load spectra, climate data and predict distresses (rutting, cracking, IRI).],
  [*Foundation*], [Subgrade strength (CBR, stiffness modulus) defines the foundation class (UK CD 225 foundation classes) and capping/sub-base thickness.],
  [*Output*], [Layer types, materials and thicknesses per *pavement section* (main line, slip roads, hard shoulders, lay-bys, widening), plus tie-in details to existing pavement (stepped joints, overlay).],
)

=== Road furniture and systems

- *Road restraint systems:* safety barriers (containment levels, e.g. EN 1317 N2/H1/H2/H4b; working width; length of need; terminals; transitions to bridge parapets), crash cushions.
- *Signs and road markings:* regulatory, warning, directional signs (UK TSRGD; US MUTCD); gantries and cantilevers (which are structures, with their own technical approval).
- *Lighting:* columns, cabling, feeder pillars; lighting design to EN 13201 or national standards.
- *ITS / technology:* detection loops, CCTV, variable message signs, emergency roadside telephones, communication ducts. These are often a separate contract with their own models.
- *Fencing, environmental barriers, landscaping:* noise barriers, mammal fencing, planting, ecological mitigation.

=== The road design process and deliverables

#datatable(
  columns: (1.1fr, 3fr),
  header: ("Stage", "Typical outputs"),
  [Options / route selection], [Route corridors, outline alignments, junction strategies, traffic and economic appraisal, environmental constraints, early 3D/visualisations.],
  [Preliminary design], [Main alignment and junction layouts, typical cross-sections, outline drainage and earthworks, land requirements, *departures register*, Road Safety Audit Stage 1 (UK GG 119), consent drawings.],
  [Detailed design], [Final alignment and *plan & profile* drawings, cross-sections at regular intervals (e.g. 20–25 m) and at key points, setting-out, pavement layout and construction details, kerbing, drainage, earthworks, signs and markings, RRS layout, lighting, fencing, schedules, *specification* (e.g. UK Specification for Highway Works appendices), RSA Stage 2.],
  [Construction], [*Machine-control data* (surfaces, string lines; LandXML or vendor formats) for graders, dozers and pavers; setting-out data; RSA Stage 3 before opening.],
  [Handover], [As-built model and drawings, asset data (e.g. National Highways ADMM), H&S file, RSA Stage 4 (monitoring after opening).],
)

#tip(title: "Machine control is a key BIM deliverable")[
  On modern road projects the *model drives the machines*. Graders and pavers follow 3D surfaces with GNSS or total stations. The surfaces delivered to the contractor (top of each layer, triangulated or as string lines) must be clean: no spikes, no gaps at tie-ins, correct layer offsets, consistent with the drawings. Many contractors rebuild surfaces themselves because the designer's corridor is not fit for machine control. A good EIR asks for *layer surfaces* explicitly, with tolerances.
]

=== Software

Corridor design: Autodesk Civil 3D, Bentley OpenRoads Designer, 12d Model, Trimble Novapoint/Quadri, Card/1, ProVI, RIB, Allplan Civil. Specialist: swept path (Vehicle Tracking, AutoTURN), sight-line and visibility analysis (often within the corridor tool or as scripts), junction capacity (ARCADY/PICADY/LinSig/Synchro), traffic micro-simulation (VISSIM, Aimsun, Paramics), signs (SignPlot, Guidsign), lighting (DIALux, Lighting Reality). Machine control: Trimble Business Center, Leica, Topcon formats.

=== BIM and IFC 4.3 for roads

#datatable(
  columns: (1.2fr, 3fr),
  header: ("Object", "IFC 4.3 representation (typical)"),
  [Road and parts], [`IfcRoad`; `IfcRoadPart` with predefined types such as CARRIAGEWAY, TRAFFICLANE, HARDSHOULDER, SHOULDER, CENTRALRESERVE, ROADSIDE, ROADSEGMENT, INTERSECTION, ROUNDABOUT, BUS_STOP, SIDEWALK, BICYCLECROSSING.],
  [Pavement layers], [`IfcCourse` (predefined type PAVEMENT) and `IfcPavement`; usually sectioned solids along the alignment (`IfcSectionedSolidHorizontal`).],
  [Kerbs], [`IfcKerb`.],
  [Earthworks], [`IfcEarthworksCut`, `IfcEarthworksFill`, `IfcEarthworksElement`.],
  [Signs, signals, markings], [`IfcSign` (incl. MARKER, PICTORAL…), `IfcSignal`, road markings as `IfcSurfaceFeature` (LINEMARKING, SYMBOLMARKING, …).],
  [Barriers, fences], [Often `IfcRailing` (GUARDRAIL, FENCE) or exporter-specific; check what your client expects.],
  [Lighting, ITS], [`IfcLightFixture`, `IfcCableSegment`, `IfcCableCarrierSegment`, `IfcCommunicationsAppliance`, `IfcSensor`…],
)

Practical BIM issues: corridors produce huge tessellated solids; models should be *broken by section and layer*; object IDs must remain stable between corridor rebuilds (most corridor tools regenerate everything); and properties such as *pavement section ID* and *layer thickness* must survive export.

=== Checklist: reviewing a road model

#datatable(
  columns: (0.25fr, 3fr, 0.4fr),
  header: ("", "Check", "✓"),
  [1], [Alignment elements comply with the design speed (radii, transitions, K values); every relaxation/departure is recorded in the departures register.], [☐],
  [2], [Superelevation development: no flat areas (resultant gradient ≥ ~0.5 %), consistent with drainage low points.], [☐],
  [3], [3D stopping sight distance checked against barriers, piers, signs, fences, planting and vertical curves.], [☐],
  [4], [Cross-section widths match the standard and the typical sections; curve widening applied.], [☐],
  [5], [Headroom under every structure ≥ required + allowances (resurfacing, sag curve effect).], [☐],
  [6], [Pavement layers per pavement section, thicknesses per design, tie-ins to existing.], [☐],
  [7], [Swept paths of design vehicles at junctions and accesses.], [☐],
  [8], [Barrier length of need, working width clear of hazards, transitions to bridge parapets.], [☐],
  [9], [Layer surfaces fit for machine control (no spikes/gaps; tolerances).], [☐],
  [10], [Interfaces: drainage (gully positions at low points), structures (approach slabs), utilities (cover depth), earthworks (formation level = pavement bottom).], [☐],
)

#builder[
  - Implement *design-speed-aware geometry checks* driven by configurable rule tables (one per standard: DMRB, Green Book, RAA…).
  - 3D *sight-distance analysis* along the alignment against all model objects, reporting chainage ranges that fail.
  - *Flat-area detection* on finished surfaces (resultant gradient below threshold) and drainage low-point reports.
  - Persistent IDs for corridor-generated objects, and export of *layer surfaces* for machine control.
]

#keypoints[
  - Roads follow a design-speed-driven rulebook (DMRB, Green Book, RAA…). Departures must be justified and recorded.
  - Pavement design converts traffic into layer thicknesses (msa / ESAL / mechanistic–empirical) on a foundation class.
  - Road furniture (barriers, signs, lighting, ITS) is a big part of the asset register and often under-modelled.
  - Machine control makes surface quality a contractual issue.
]
