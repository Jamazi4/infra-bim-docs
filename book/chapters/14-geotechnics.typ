#import "../template.typ": *

== Geotechnics and Earthworks

Ground is the largest source of risk and cost overrun on infrastructure projects. Unlike every other discipline, the geotechnical engineer does not design the material, only *interprets* it from a small number of samples. A geotechnical model is therefore an *interpretation with uncertainty*, and BIM workflows that treat ground surfaces as exact geometry miss the point.

=== The ground investigation process

#datatable(
  columns: (1.2fr, 3fr),
  header: ("Step", "Content"),
  [*Desk study*], [Geological maps and memoirs, historical maps (old pits, landfills, ponds), mining records, existing borehole databases (e.g. BGS in the UK), aerial imagery and LiDAR, flood and groundwater data, unexploded ordnance (UXO) risk, contamination history, site walkover. Output: *preliminary ground model* and GI scope.],
  [*Ground investigation (GI) design*], [Locations, depths and types of exploratory holes and tests, targeted at structures (every pier/abutment), cuttings, embankments on soft ground, tunnels and drainage.],
  [*Fieldwork*], [Boreholes (cable percussion in soils, rotary coring in rock), trial pits, window samples, *CPT/CPTu* (cone penetration tests), *SPT* (standard penetration test), pressuremeter, plate load tests, geophysics (seismic refraction, ERT, MASW, GPR), groundwater monitoring (standpipes, piezometers), in-situ permeability.],
  [*Laboratory testing*], [Classification (moisture content, particle size distribution, Atterberg limits), strength (triaxial, shear box, unconfined compression, point load for rock), compressibility (oedometer), compaction and CBR (earthworks and pavement), chemical tests (sulphates, pH: concrete aggressivity), contamination testing.],
  [*Factual report*], [Exploratory hole logs, test results and *AGS data files* from the GI contractor. Facts only, no interpretation.],
  [*Interpretation and design*], [Ground model, geotechnical parameters, design of foundations, earthworks, retaining walls, ground improvement; monitoring plan.],
)

=== The report chain (Eurocode 7 and contract practice)

#datatable(
  columns: (1.3fr, 3fr),
  header: ("Document", "Purpose"),
  [*Ground Investigation Report (GIR)*], [Presents and evaluates the GI results: the *ground model* and derived values of parameters. In Eurocode 7 it forms part of the GDR.],
  [*Geotechnical Design Report (GDR)*], [Design assumptions, the geotechnical design model, characteristic values, calculations, recommendations, risks, and the supervision and monitoring plan. Post-construction checks are added later.],
  [*Geotechnical Baseline Report (GBR)*], [A *contractual* document (US origin, ASCE guidelines; widely used for tunnels) that states baseline ground conditions for allocating ground risk between owner and contractor. Not defined by Eurocode 7.],
  [*Client-specific*], [e.g. UK DMRB CD 622 *Managing geotechnical risk* (geotechnical certification: Preliminary Sources Study Report, GI reports, Geotechnical Design Report, Geotechnical Feedback Report after construction).],
)

#note(title: "Eurocode 7, second generation")[
  The second-generation Eurocode 7 restructures the code into *EN 1997-1:2024* (general rules), *EN 1997-2:2024* (ground properties) and *EN 1997-3:2025* (geotechnical structures). Two explicit concepts matter for BIM: the *Ground Model* (geological and hydrogeological interpretation of the site) and the *Geotechnical Design Model* (the idealised ground with design parameters used for a specific structure or limit state). It also links design effort to a *Geotechnical Category* derived from consequence and complexity. Check national adoption dates. First and second generation coexist during the transition.
]

=== The ground model

A useful ground model has several layers of meaning:

+ *Conceptual model*: the geological story (depositional history, weathering, faults, groundwater regime, man-made ground). This drives everything else.
+ *Observational data*: exploratory holes, tests, geophysics, mapping, each with location, elevation datum and date.
+ *Geological model (3D)*: stratigraphic surfaces/volumes interpolated between holes (e.g. made ground, alluvium, glacial till, weathered rock, rock), faults, groundwater surfaces.
+ *Geotechnical design model*: units with parameter sets (unit weight, strength, stiffness, permeability) and design profiles for each structure or section.
+ *Uncertainty*: confidence of each surface (distance from data, geological complexity). Should be visible in the model, not hidden.

#warning(title: "Interpolated surfaces are not facts")[
  Between two boreholes 200 m apart, the interpolated rockhead is a guess. If a BIM model shows it as a crisp surface with millimetre precision, designers and contractors will treat it as fact: pile lengths, excavation quantities and tunnel alignments get fixed on it. Show data points, interpolation method and confidence zones, and record the *model version* used for each design.
]

=== Data formats

#datatable(
  columns: (1.1fr, 3fr),
  header: ("Format", "Use"),
  [*AGS 4* (UK, widely international)], [Text/CSV-like format of grouped tables (holes, samples, tests, logs) for *factual* GI data, in use since 1991. Most GI contractors deliver AGS files; many clients require them.],
  [*AGSi*], [AGS's newer format (JSON) for *interpreted* ground models: model elements, surfaces and volumes, parameters, and links to factual data.],
  [*DIGGS*], [US XML standard for geotechnical and geoenvironmental data (supported by FHWA / State DOTs).],
  [*IFC 4.3 geotechnics*], [`IfcBorehole`, `IfcGeotechnicalStratum`, `IfcGeomodel`, `IfcGeoslice`, `IfcGeotechnicalAssembly`. Support in authoring tools is still limited.],
  [*OGC GeoSciML / GroundWaterML*], [GIS-side standards for geological data.],
)

=== Software

Data management: Bentley *OpenGround* (successor of gINT and HoleBASE), Seequent/Bentley tools, *Keynetix HoleBASE SI*. 3D ground modelling: *Seequent Leapfrog Works*, Civil 3D Geotechnical Modeler, Bentley OpenGround/PLAXIS links, GSI3D/Groundhog. Analysis: *PLAXIS* 2D/3D, GeoStudio (SLOPE/W, SEEP/W, SIGMA/W), Rocscience suite, Oasys (Pdisp, Alp, Frew, Safe), GEO5, LPILE/GROUP, FLAC.

=== Earthworks

#datatable(
  columns: (1.1fr, 3fr),
  header: ("Topic", "Key points"),
  [*Cut and fill*], [Volumes from existing ground (survey) and formation surfaces, by chainage block and material layer. Topsoil strip handled separately.],
  [*Material classification*], [Excavated material is classified as *acceptable* or *unacceptable* for reuse (UK Specification for Highway Works Series 600: general granular fill, general cohesive fill, selected fills for specific uses, unacceptable U1/U2). Classification drives the *materials balance* and cost.],
  [*Mass haul*], [Balancing cut and fill along the route, minimising haul distance, using borrow pits and disposal sites. Mass-haul diagrams also define the earthworks programme (see Chapter 18).],
  [*Bulking / shrinkage*], [Volume changes between in-situ, loose and compacted states (factors per material). Quantities must state which state they are in.],
  [*Slopes*], [Side slopes (e.g. 1:2 to 1:3 in soils, steeper in rock), stability analyses with factors of safety or partial factors; benches; erosion protection; slope drainage.],
  [*Embankments on soft ground*], [Settlement and stability: staged construction, surcharge/preloading, wick drains, lightweight fill, ground improvement (stone columns, rigid inclusions with a load transfer platform, deep soil mixing), basal reinforcement; settlement monitoring.],
  [*Retaining structures*], [Gravity, cantilever RC, reinforced soil, sheet piles, contiguous/secant/king-post walls, soil nails, anchored walls.],
  [*Formation and capping*], [Formation level = bottom of pavement or track bed; capping layer where subgrade is weak; protection of formation against weather.],
)

=== BIM deliverables and LOIN for geotechnics

- *Exploratory holes* as objects (location, elevation, datum, depth, type, date, link to log and AGS data).
- *Geological surfaces/volumes* with unit codes, interpolation method, version and confidence.
- *Design profiles* per structure (parameters at each depth).
- *Earthworks solids* by chainage block and layer (topsoil, cut by material class, fill, capping), with quantities in a declared state (in-situ/compacted).
- *Geotechnical structures*: retaining walls, ground improvement zones, piles (with as-built pile records later).
- *Instrumentation*: inclinometers, piezometers, settlement plates and monuments with trigger levels.

=== Checklist: reviewing geotechnical and earthworks information

#datatable(
  columns: (0.25fr, 3fr, 0.4fr),
  header: ("", "Check", "✓"),
  [1], [Exploratory holes: coordinates and ground levels in the project CRS and height datum; depths and dates; AGS file valid.], [☐],
  [2], [Ground model version, method and data cut-off date stated; uncertainty shown.], [☐],
  [3], [Every structure foundation has supporting GI data within a reasonable distance.], [☐],
  [4], [Groundwater levels (and seasonal variation) represented and used in design.], [☐],
  [5], [Earthworks quantities by material class and state; topsoil, capping and unacceptable material separated.], [☐],
  [6], [Slopes and formation match the geotechnical design; drainage at slope toes and crests.], [☐],
  [7], [Soft ground treatments, settlement predictions and monitoring points modelled with the construction sequence.], [☐],
  [8], [Interfaces: piles vs utilities and drainage; retaining walls vs road edge and barriers; earthworks vs structures (abutment backfill).], [☐],
)

#builder[
  - Import AGS 4 (and AGSi/DIGGS where possible) and display boreholes as 3D objects with logs.
  - Store *model provenance* (data set, method, version) and visualise *confidence* (distance-to-data maps).
  - Compute earthworks volumes by chainage block, layer and material class, with bulking factors and declared volume state.
  - Link ground model versions to the designs that used them, and flag designs when the ground model changes.
]

#keypoints[
  - Ground investigation goes desk study → GI → factual report (AGS) → GIR → GDR. A GBR is a contractual extra, mostly for tunnels.
  - Second-generation Eurocode 7 formalises the *Ground Model* and *Geotechnical Design Model*.
  - Ground models are interpretations: show data, method, version and uncertainty.
  - Earthworks are about material classification, mass haul and quantities in a declared state.
]
