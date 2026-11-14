#import "../template.typ": *

== The Documents: From Requirements to Delivery Plans

This chapter goes through every document of the ISO 19650 process in the order it is created. For each one: *purpose*, *author*, *contents*, and *how it is actually used* after it is written. The last sections give a BEP review checklist and the typical failures.

=== The requirements hierarchy: OIR → AIR / PIR → EIR

#figure(
  {
    set text(font: heading-font, size: 8pt)
    let bx(t, c) = rect(width: 100%, inset: 6pt, radius: 3pt, fill: c.lighten(85%), stroke: 0.8pt + c, align(center, t))
    grid(columns: (1fr, 1fr), column-gutter: 8pt, row-gutter: 6pt,
      grid.cell(colspan: 2, bx([*OIR* — Organisational Information Requirements \ “What does the organisation need to know to run its business?” (strategy, regulation, funding, asset management)], accent)),
      bx([*AIR* — Asset Information Requirements \ What information about *assets* is needed for operation and maintenance → feeds the *AIM*], good),
      bx([*PIR* — Project Information Requirements \ What information the client needs at *project* decision points (stage gates, business case, consents) → answered by the *PIM*], warn),
      grid.cell(colspan: 2, bx([*EIR* — Exchange Information Requirements \ Per appointment: the AIR and PIR translated into concrete deliverables, standards, LOIN, milestones, acceptance criteria], tool)),
    )
  },
  caption: [Requirements flow from organisation level to each appointment. ISO 19650-1 §5.],
)

- *OIR* are high level (“we must report the condition of all bridges to the national inventory annually”, “we must prove carbon reduction”).
- *AIR* say what the asset register and maintenance systems need: for a bridge, the structure ID, type, spans, bearing types and manufacturer data, inspection access, load rating and the as-built drawings; for a road, the pavement layers and materials, drainage assets, signs, lighting, and so on. Often expressed as an *asset data dictionary* (for example National Highways' ADMM, Network Rail's asset data standards, German OKSTRA/ASB-ING for bridge inventory).
- *PIR* say what the client must know at each *plain-language question* stage: “Which route option is preferred?”, “What will it cost?”, “Can we get planning consent?”, “Is the design safe to build?”. The UK BIM Framework recommends writing PIR as plain-language questions per stage.
- *EIR* are the contractual translation for a specific appointment.

=== Exchange Information Requirements (EIR)

*Author:* appointing party (or the lead appointed party toward its own appointed parties). *When:* §5.2, part of the tender documents. *Becomes:* part of the appointment (contract).

ISO 19650-2 §5.2.1 asks the appointing party to establish its EIR covering four groups of content. In practice, a good EIR for infrastructure contains the following:

#datatable(
  columns: (1.2fr, 3fr),
  header: ("EIR section", "What to look for"),
  [*1. Information requirements*], [Purpose of information (use cases), which deliverables (models, drawings, schedules, reports, data), per stage. For infra: alignment models, corridor/road models, earthworks, drainage, structures, utilities, rail track, OLE, signalling, geotechnical models, existing-condition (survey/point cloud), 4D, quantities.],
  [*2. Level of information need*], [Per object type and milestone: geometry, alphanumeric (property sets, classification), documentation. Often a separate LOIN / MDS spreadsheet.],
  [*3. Acceptance criteria*], [How each deliverable will be judged: compliance with the information standard (naming, metadata, coordinates, units, file format), with LOIN, with model quality rules (no duplicates, no clashes above tolerance), and with the software/format versions agreed.],
  [*4. Supporting information*], [Reference information and shared resources supplied by the client: survey, existing asset models, GIS layers, templates, object libraries, title blocks, the CDE.],
  [*5. Milestones and dates*], [Information delivery milestones (aligned with stage gates, e.g. preliminary design, statutory approval, detailed design, construction stages, handover) and by when each exchange is due.],
  [*Usually also*], [Coordinate reference system and height datum; geospatial requirements; security requirements (ISO 19650-5); H&S information requirements (ISO 19650-6 / CDM); handover / AIM requirements; competence and training requirements; required software versions or open formats (IFC 4.3, LandXML); review and audit regime; KPIs.],
)

#tip(title: "Using the EIR during the project")[
  The EIR is the *yardstick for acceptance*. Each time information is submitted at a milestone (§5.7), the appointing party's reviewer should be able to point at an EIR clause and say “accepted” or “rejected because…”. If an EIR cannot be used like that (vague clauses such as “models shall be of high quality”), it is a poor EIR. Push back at tender with a clarification question.
]

=== Project information standard and production methods

*Author:* appointing party (§5.1.4 and §5.1.5). These are often one document called the “BIM Standard”, “Information Standard” or “Digital Delivery Standard”, together with appendices.

#datatable(
  columns: (1.2fr, 3fr),
  header: ("Contents", "Typical infrastructure examples"),
  [Exchange of information], [Formats per deliverable (native + IFC 4.3 + PDF + LandXML), how often, through which CDE.],
  [Container breakdown structure], [How the project is split into volumes/systems and locations, e.g. by *chainage section*, by *structure ID*, by discipline. Critical for linear projects.],
  [Naming and metadata], [Naming convention fields and code lists, status and revision codes, required metadata in the CDE.],
  [Classification], [Uniclass 2015 / client dictionary; how classification is applied to objects and containers.],
  [Coordinates and units], [Project CRS (e.g. a national grid or UTM zone, sometimes a low-distortion *project grid*), height datum (e.g. ODN, NAP, DHHN2016), scale factor handling, origin and shared coordinates.],
  [Production methods & procedures], [How information is captured (survey methods, point cloud density), generated (modelling rules, tolerances), reviewed and approved (QA check process), secured, and delivered.],
  [Templates and libraries], [Title blocks, drawing templates, object libraries, property set templates, IDS files.],
)

=== Project information protocol

*Author:* appointing party (§5.1.8), then incorporated into every appointment (§5.4.7). It is the *legal* wrapper: licensing of information (who may use models for what), liability for the use of information, intellectual property, use of shared resources, obligations on information security, and how the information standard and BEP sit in the contract hierarchy. In the UK the *CIC BIM Protocol* (2nd edition, 2018) is a common basis. In other markets, the protocol may be an appendix to FIDIC or NEC conditions.

#warning[
  Check whether the BEP is a *contract document*. If it is, every promise in the pre-appointment BEP may become binding. Bid teams sometimes copy marketing text into the BEP (“we will deliver LOD 500 digital twin”) that later becomes an unmet contractual obligation.
]

=== Pre-appointment BEP

*Author:* prospective lead appointed party, at tender (§5.3.2). *Purpose:* to show the appointing party how the delivery team will meet the EIR. It is evaluated together with the commercial and technical bid.

ISO 19650-2 requires the pre-appointment BEP to include:

+ The *proposed information management function*: names, roles and CVs of the people who will perform it.
+ The *information delivery strategy*: how the team will meet the EIR, the objectives for collaborative production, how the federation will be organised, and the *federation strategy*: how the information model is broken into containers and how they are combined (e.g. per discipline × per chainage section × per structure).
+ The proposed *information container breakdown structure*.
+ A *high-level responsibility matrix*: which task team is responsible for each information model element / deliverable type.
+ Proposed *amendments or additions* to the project information production methods and procedures.
+ Proposed *additions or amendments to the project information standard*.
+ A proposed *schedule of software, hardware and IT infrastructure* (with versions) the team intends to use.

=== Capability, capacity, mobilisation and risk

Also part of the tender response (§5.3.3–5.3.6):

- *Capability and capacity assessment:* each task team declares its information management capability, production capability (software skills, IFC export experience), and IT capacity. The lead appointed party compiles a *delivery team capability and capacity summary*.
- *Mobilisation plan:* how and when the team will set up the CDE connections, software, training, templates and test exchanges (§5.5).
- *Information delivery risk register:* risks to timely, compliant delivery, e.g. “Bridge analysis software cannot export IFC 4.3 bearings”; “survey of existing structure not available until month 4”; “client CDE does not support large point clouds”, with owners and mitigations.

=== Post-appointment BEP

*Author:* lead appointed party, confirmed with the appointing party after award (§5.4.1). It is the pre-appointment BEP *completed and agreed*. A typical post-appointment BEP for a large infra scheme is organised like this:

#datatable(
  columns: (0.4fr, 1.5fr, 3fr),
  header: ("#", "Section", "Content"),
  [1], [Project information], [Scope, location, contract form, stages, milestones, key dates.],
  [2], [Delivery team & information management function], [Org chart with names, the information management roles, contact matrix, task team list.],
  [3], [Information delivery strategy], [Objectives, BIM uses/use cases by stage (e.g. clash detection, quantity take-off, 4D, design review, AIM handover) and how each is executed.],
  [4], [Federation strategy & container breakdown], [Model split (discipline × location × system), federation diagram, file size limits, model origin. For linear projects: section boundaries by chainage, with overlaps.],
  [5], [Information standard (adopted + amendments)], [Naming convention codes actually used, metadata, classification, units, CRS, drawing standards.],
  [6], [Production methods & procedures], [Modelling guidelines per discipline, QA check procedures, tolerances, clash rules and matrix, issue management (BCF), review and approval workflow.],
  [7], [CDE workflow], [States, status codes, who approves which transition, folder structure, permissions, archive policy.],
  [8], [Detailed responsibility matrix], [See next section.],
  [9], [LOIN / MDS], [Per object type and milestone, often as a spreadsheet appendix + IDS files.],
  [10], [Schedule of software, hardware & IT], [Software versions, plugins, IFC exporters, interoperability tests passed.],
  [11], [Security, H&S, handover], [ISO 19650-5 measures; H&S information approach; AIM handover data structure and asset data population process.],
  [12], [Appendices], [MIDP (or reference), TIDPs, mobilisation plan, risk register, templates.],
)

#tip(title: "How the BEP is actually used")[
  - *Onboarding:* new team members read the BEP's naming, CDE and modelling sections. It is the project's “rule book”.
  - *Audits:* the client's information manager audits against the BEP (e.g. monthly sample checks of naming, metadata, model quality).
  - *Disputes:* when a deliverable is rejected, both sides go back to the EIR and BEP to see what was promised.
  - *Change:* the BEP must be *revised* when scope, team or stage changes. Look for a revision history; a BEP still at revision C01 after two years is a red flag.
]

=== The responsibility matrix

ISO 19650-2 uses the responsibility matrix in two stages:

- *High-level responsibility matrix* (pre-appointment, §5.3.2): which *task team* is responsible for each *information model element* or deliverable category.
- *Detailed responsibility matrix* (post-appointment, §5.4.3): refined to *what* information is produced, *when* it is exchanged and with *whom*, and *who* is responsible. It feeds the TIDPs.

The UK guidance also distinguishes the *assignment matrix*, which assigns *information management functions* (Chapter 2) to parties. Do not confuse the two.

#figure(
  datatable(
    columns: (1.6fr, 0.7fr, 0.7fr, 0.7fr, 0.7fr, 0.7fr, 0.7fr),
    header: ("Element / deliverable", "HWY", "STR", "DRN", "GEO", "SUR", "4D"),
    [Horizontal & vertical alignment], [*R*], [C], [C], [–], [I], [I],
    [Road corridor & pavement layers], [*R*], [I], [C], [C], [–], [I],
    [Earthworks & ground model], [C], [I], [I], [*R*], [C], [I],
    [Bridge deck, piers, abutments], [C], [*R*], [I], [C], [–], [I],
    [Bearings & expansion joints], [–], [*R*], [–], [–], [–], [I],
    [Drainage network], [C], [C], [*R*], [–], [–], [I],
    [Existing ground survey / point cloud], [I], [I], [I], [I], [*R*], [I],
    [Construction sequence (4D)], [C], [C], [C], [I], [–], [*R*],
  ),
  kind: table,
  caption: [Extract of a high-level responsibility matrix (R = responsible, C = contributes/consulted, I = informed). HWY = highways, STR = structures, DRN = drainage, GEO = geotechnics, SUR = survey.],
)

=== TIDP and MIDP

*TIDP — Task Information Delivery Plan* (§5.4.4). *Author:* each task team. A schedule of every information container the task team will deliver, with:

- container name / number (following the naming convention), title/description;
- type (model, drawing, schedule, report, data);
- LOIN reference and *milestone* it serves;
- *production duration* and dependencies on other teams' information;
- responsible author;
- planned date and (later) actual date and status.

*MIDP — Master Information Delivery Plan* (§5.4.5). *Author:* lead appointed party. It *aggregates* all TIDPs, aligns them with the project programme and milestones, resolves dependencies (e.g. structures needs the alignment frozen before GA drawings), and is agreed with the appointing party. Increasingly the MIDP lives in a database or the CDE itself, not in Excel.

#figure(
  {
    set text(size: 7.2pt)
    datatable(
      columns: (2.3fr, 2fr, 0.6fr, 0.8fr, 0.9fr, 0.9fr, 0.8fr),
      header: ("Container ID", "Title", "Type", "LOIN", "Milestone", "Planned", "Status"),
      [`A99R-ABC-B01-ZZ-M3-S-0001`], [Overbridge B01, structural model], [M3], [LOIN-D2], [DD (M4)], [2027-03-15], [S1],
      [`A99R-ABC-B01-ZZ-DR-S-0101`], [B01 General arrangement], [DR], [LOIN-D2], [DD (M4)], [2027-03-29], [S0],
      [`A99R-ABC-B01-ZZ-DR-S-0201`], [B01 Pier P1 reinforcement], [DR], [LOIN-D3], [IFC (M5)], [2027-05-10], [–],
      [`A99R-ABC-B01-ZZ-CA-S-0001`], [B01 Design calculations, deck], [CA], [–], [DD (M4)], [2027-03-22], [S3],
      [`A99R-ABC-B01-ZZ-SH-S-0001`], [B01 Bearing schedule], [SH], [LOIN-D3], [IFC (M5)], [2027-05-10], [–],
    )
  },
  kind: table,
  caption: [TIDP extract for a structures task team (naming per UK National Annex: Project-Originator-Volume-Level-Type-Role-Number).],
)

#tip(title: "MIDP as a progress tool")[
  Once agreed, the MIDP is used every week: planned vs actual delivery, containers late, containers rejected. A healthy MIDP report tracks counts by status (WIP / Shared S1–S4 / Published A / rejected) per milestone. If you can see that 40 % of drawings for the detailed-design milestone are still WIP two weeks before the deadline, the MIDP is doing its job.
]

=== Reviewer's checklist for a BEP

Use this list when you review a BEP (or test whether your software can generate or validate one).

#datatable(
  columns: (0.25fr, 3fr, 0.4fr),
  header: ("", "Check", "✓"),
  [1], [Every EIR requirement is answered and traced (a compliance matrix EIR clause → BEP section is best practice).], [☐],
  [2], [Named people for each information management function, with competence evidence.], [☐],
  [3], [Use cases listed per stage, each with *who*, *how*, *software*, *output* and *acceptance*.], [☐],
  [4], [Federation strategy is explicit and matches the container breakdown (codes in the naming convention exist for every volume/zone).], [☐],
  [5], [Coordinate system, height datum, units, origin and scale-factor handling stated, plus how *linear* objects are referenced (chainage/stationing, alignment IDs).], [☐],
  [6], [Naming convention with *complete code lists* (originators, volumes, levels/locations, types, roles).], [☐],
  [7], [CDE states, status/suitability codes, revision scheme and approval authority per transition.], [☐],
  [8], [QA check procedure (what is checked, by whom, with which tool, and evidence kept).], [☐],
  [9], [Clash/coordination procedure with clash matrix, tolerances and frequency; issue tracking (BCF).], [☐],
  [10], [LOIN per object and milestone, consistent with the EIR (no silent downgrades).], [☐],
  [11], [Software schedule with *versions* and *IFC export tests* already performed.], [☐],
  [12], [Responsibility matrix covers every element type, *including interfaces* (bearings between structures and highways, drainage under structures, utilities diversions).], [☐],
  [13], [MIDP aligned with the *construction programme* and design milestones; dependencies modelled.], [☐],
  [14], [Security (ISO 19650-5) measures proportional to the asset's sensitivity.], [☐],
  [15], [Handover: how the AIM will be populated (asset IDs, properties, documents), by whom, validated how.], [☐],
  [16], [Revision history and a defined BEP update trigger (each stage, team change, scope change).], [☐],
)

=== Typical failures in practice

- *Copy-paste BEP:* still mentions buildings, “levels” and Revit families on a rail project. A sure sign that nobody reads it.
- *Naming convention without a container breakdown:* volume/location codes that do not map to chainage sections, so models cannot be found.
- *LOIN defined as “LOD 350”* without saying which properties are required. It is impossible to check and impossible to reject.
- *No interface ownership:* nobody owns the bridge approach slab, the drainage through the abutment or the cable ducts in the deck parapet.
- *MIDP disconnected from the programme:* information milestones that do not match construction need dates.
- *Acceptance criteria missing:* the client cannot reject anything, so the information quality decays.

#builder[
  - Generate the *compliance matrix* (EIR clause → BEP section → evidence) automatically if the EIR is structured data.
  - Validate container names against code lists *at upload*, and derive volume/location from the *chainage range* of the content where possible.
  - Give the MIDP a status dashboard: counts by suitability code, planned-vs-actual by milestone, late and rejected containers.
  - Let a LOIN line produce an *IDS* file automatically, so the “acceptance criteria” become executable.
]

#keypoints[
  - *OIR → AIR/PIR → EIR*: from business needs to contractual deliverables.
  - *EIR* (client) asks; *BEP* (lead appointed party) promises; *TIDP/MIDP* schedule the actual containers.
  - The *responsibility matrix* evolves from high-level (tender) to detailed (appointment) and feeds the TIDPs.
  - A good BEP is traceable, specific to infrastructure (chainage, CRS, structures), versioned, and used every week.
]
