#import "../template.typ": *

== Checklists for an Infrastructure BIM Software Suite

This chapter collects the purple boxes from the whole book into one list of capabilities, grouped by area. Use it to review your product backlog, or to test whether your suite can support each step of an ISO 19650 project. Priority: *M* = must-have for professional use, *S* = should-have, *C* = could-have / differentiator.

=== Information management (ISO 19650)

#datatable(
  columns: (0.3fr, 3.2fr, 0.35fr),
  header: ("#", "Capability", "Pri."),
  [IM1], [Parties, appointments and task teams as a hierarchy; permissions derived from roles.], [M],
  [IM2], [Distinct, auditable workflow steps: check → review → approve (share) → authorise → accept; rejection back to WIP with comments.], [M],
  [IM3], [CDE states WIP / Shared / Published / Archived; configurable status and revision code lists (UK NA, legacy, client-specific).], [M],
  [IM4], [Naming validation against configurable fields and code lists at upload; status/revision as metadata.], [M],
  [IM5], [EIR and BEP as structured data; compliance matrix (EIR clause → BEP section → evidence).], [S],
  [IM6], [Responsibility matrix (high-level → detailed) linked to TIDP lines.], [S],
  [IM7], [TIDP/MIDP database: planned vs actual, status counts per milestone, dependencies, late/rejected dashboards.], [M],
  [IM8], [Each requirement stores its source (ISO clause / client document / BEP section).], [S],
  [IM9], [Security: container-level sensitivity classification and access control (ISO 19650-5).], [S],
  [IM10], [H&S risk objects linked to model elements (ISO 19650-6).], [C],
  [IM11], [Lessons learned capture at close-out.], [C],
  [IM12], [ISO 19650-2 §5.1.7 capabilities demonstrable: coded unique IDs, status/revision/classification, transitions logged with user and date, container-level access.], [M],
  [IM13], [openCDE Foundation + Documents API and BCF API; metadata mapping for multi-CDE projects.], [S],
  [IM14], [Infrastructure metadata (chainage range, structure ID, line reference) with spatial search of containers.], [S],
  [IM15], [CDE KPI dashboards (compliance, review times, overdue items) and complete export of files + metadata + journal.], [M],
)

=== LOIN, data and checking

#datatable(
  columns: (0.3fr, 3.2fr, 0.35fr),
  header: ("#", "Capability", "Pri."),
  [LD1], [LOIN stored as (purpose, milestone, actor, object type) → geometry facets + properties + documents.], [M],
  [LD2], [Generate LOIN spreadsheets and *IDS* files from the same source; import external IDS.], [M],
  [LD3], [Run IDS checks on upload to Shared; show results to the author first.], [M],
  [LD4], [Track LOIN maturity per object instance, not per file.], [S],
  [LD5], [Classification support (Uniclass, client dictionaries) via bSDD URIs.], [S],
  [LD6], [Project property set templates; mapping to IFC `Pset_` where available.], [M],
)

=== Linear infrastructure and IFC 4.3

#datatable(
  columns: (0.3fr, 3.2fr, 0.35fr),
  header: ("#", "Capability", "Pri."),
  [LI1], [Alignment with full business logic (segment types incl. transitions, vertical curves, cant, station equations), not just tessellated curves.], [M],
  [LI2], [Every object locatable by alignment + chainage + offset; computed automatically and exported (linear placement or properties).], [M],
  [LI3], [Georeferencing validation (EPSG CRS, map conversion, height datum, scale factor); warnings for objects outside the project extent.], [M],
  [LI4], [IFC 4.3 import/export with correct spatial structure (IfcRoad/IfcRailway/IfcBridge + parts), predefined types, no unnecessary proxies.], [M],
  [LI5], [Chainage ranges usable as location in naming, filters, issue tracking and 4D.], [S],
  [LI6], [Alignment version tracking; dependency alerts when the alignment changes.], [M],
  [LI7], [BCF with chainage/structure ID fields.], [S],
)

=== Bridges

#datatable(
  columns: (0.3fr, 3.2fr, 0.35fr),
  header: ("#", "Capability", "Pri."),
  [BR1], [Component-based bridge model: deck, girders, diaphragms, piers, crossheads, abutments, wing walls, foundations/piles, bearings, joints, parapets, approach slabs.], [M],
  [BR2], [Alignment-driven parametrics: supports by chainage + skew; deck levels from profile and crossfall; varying cross-sections.], [M],
  [BR3], [Bearing data: ID, type, fixity/guiding direction, loads, movements, preset; fixity-pattern validation.], [M],
  [BR4], [Clearance envelopes (road headroom, rail gauge/OLE, navigation, flood) and clash checks against them.], [M],
  [BR5], [Physical ↔ analytical mapping (GUID ↔ members/nodes) and export to at least one analysis format; consistency checks on spans and supports.], [S],
  [BR6], [Generated setting-out tables and bearing/joint/pile schedules with persistent IDs and revision comparison.], [M],
  [BR7], [Construction segmentation (pours, segments, lifts) as child objects; construction stage IDs; camber data separate from design geometry.], [S],
  [BR8], [Design code + national annex + edition as metadata on the model and results.], [S],
  [BR9], [Detection of manual overrides on drawing dimensions and levels.], [C],
  [BR10], [Quantity take-off reconciled to BoQ structure (concrete by class, rebar by diameter, steel tonnage).], [S],
)

=== Roads, railways, ground, drainage, utilities, tunnels

#datatable(
  columns: (0.3fr, 3.2fr, 0.35fr),
  header: ("#", "Capability", "Pri."),
  [RD1], [Design-speed-aware geometry rule checks (radii, transitions, K values, superelevation) driven by configurable standards (DMRB, Green Book, RAA…).], [M],
  [RD2], [3D sight-distance analysis along the alignment against all model objects; flat-area and low-point detection on finished surfaces.], [S],
  [RD3], [Persistent IDs for corridor-generated objects; pavement layers per pavement section; machine-control surface export.], [M],
  [RL1], [Rail alignment rules: cant, cant deficiency/excess, rates of change, S&C exclusion zones.], [M],
  [RL2], [Kinematic envelope / structure gauge sweep with cant, clash-checked against all objects; signal sighting checks.], [S],
  [RL3], [Dual referencing: design chainage ↔ operational line reference (ELR + mileage, Strecke + km); railML exchange.], [S],
  [GT1], [AGS 4 import (AGSi / DIGGS where possible); boreholes as 3D objects with logs.], [M],
  [GT2], [Ground model provenance (data set, method, version) and confidence visualisation; designs flagged on ground-model change.], [S],
  [GT3], [Earthworks quantities by chainage block, layer and material class, with bulking factors and declared volume state.], [M],
  [DR1], [Drainage as a network graph with topology checks: connectivity, flow direction, invert continuity, size progression.], [M],
  [DR2], [Rule checks for cover depth, gradient, velocity and outfall vs water level; schedules and long sections generated from the model.], [M],
  [UT1], [Quality level (PAS 128 / ASCE 38-22), accuracy and source on every utility object; uncertainty rendered visually.], [M],
  [UT2], [Tolerance-aware clash detection and a utility conflict register linked to clashes, trial holes, issues and programme.], [S],
  [TN1], [Parametric ring generation (universal rings, key positions) and as-built ring import from TBM guidance data.], [C],
  [TN2], [Space-proofing envelope sweeps; settlement trough and building damage category computation along a tunnel alignment.], [C],
)

=== 4D

#datatable(
  columns: (0.3fr, 3.2fr, 0.35fr),
  header: ("#", "Capability", "Pri."),
  [4D1], [Import programmes from P6 (XER/XML), MS Project (XML), Asta, IFC; keep activity IDs, WBS, codes, calendars, logic; track data date.], [M],
  [4D2], [Rule-based linking (property = activity ID; location + type codes); link table export/import.], [M],
  [4D3], [Non-destructive, rule-based segmentation (by chainage interval, layer, lift height, pour polygons) keeping parent GUIDs.], [M],
  [4D4], [Task types (construct/demolish/temporary/maintain) and a configurable appearance legend.], [M],
  [4D5], [Automated QA report: link coverage, duplicates, unlinked activities, sequence sanity, temporary lifecycle, version consistency.], [M],
  [4D6], [Synchronised 3D, Gantt and time–chainage views.], [S],
  [4D7], [Overlays on video/snapshots: date, phase, legend, active activities, input versions & status code.], [M],
  [4D8], [Time–space conflict detection (workspaces, plant, temporary works vs live envelopes) with BCF export.], [S],
  [4D9], [Cycle templates for repetitive bridge and linear works.], [C],
  [4D10], [Planned vs actual; reality-capture comparison by chainage block.], [S],
  [4D11], [Export to IFC 4.3 (`IfcWorkSchedule`, `IfcTask`, `IfcRelAssignsToProcess`, `IfcRelSequence`).], [S],
  [4D12], [5D: quantities × rates per activity; cash-flow curves.], [C],
)

=== A test project for your suite

To check your software end to end, build a small *reference project* that exercises everything in this book:

+ A 2 km road alignment with a clothoid transition, a vertical crest curve and a station equation.
+ A two-span skewed overbridge (structure B01) at a known chainage, with bearings on the pier and integral abutments.
+ A drainage run passing under the bridge, and a utility crossing.
+ An information standard (naming code lists, LOIN for two milestones as IDS) and a mini-EIR.
+ A P6 programme (Level 4) with TM phases and a weekend beam-lift closure.
+ Expected results: valid container names, IDS pass/fail examples, a federated model with two deliberate clashes, a 4D model with ≥ 98 % link coverage and one deliberate time–space conflict, and an IFC 4.3 export that round-trips through at least two third-party viewers.

Each feature should be able to process this project. Regressions show up immediately.
