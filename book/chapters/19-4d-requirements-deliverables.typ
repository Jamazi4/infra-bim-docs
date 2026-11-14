#import "../template.typ": *

== 4D Requirements and the 4D Deliverable

=== Is there an official 4D standard?

*No single international standard* defines a 4D model. Requirements are assembled from several sources:

#datatable(
  columns: (1.4fr, 3fr),
  header: ("Source", "What it contributes"),
  [*ISO 19650 framework*], [4D is an *information requirement* in the EIR (purpose, milestones, acceptance criteria), answered in the BEP and scheduled as containers in the MIDP. The 4D model goes through the CDE like any other container.],
  [*LOIN (ISO 7817-1)*], [Defines the geometry and data needed *for the 4D purpose* (segmentation, activity ID property, temporary works objects).],
  [*Contract (NEC4, FIDIC, others)*], [Defines the *programme* (e.g. NEC4 Accepted Programme, clause 31; FIDIC clause 8.3) and its update cycle. The 4D model is usually a *supporting* deliverable. It explains the programme but does not replace it. Check whether the client's scope makes 4D a condition of programme acceptance.],
  [*Client BIM standards*], [Examples: the *Port Authority of NY & NJ* BIM Standard and VDC requirements (dedicated sections on the 4D simulation model, schedule setup, 4D animation video and a 4D simulation report); German *Masterplan BIM Bundesfernstraßen* use cases; National Highways and Network Rail scope documents; HS2 and other megaproject information standards; water-sector guidance (BIM4Water) on specifying 4D in an EIR.],
  [*Guidance documents*], [FHWA guidance on creating and maintaining 4D models for highway construction (2016): level of detail driven by the *purpose*, schedule task naming and WBS requirements stated in bid documents, 3D detail set in step with schedule detail. The Penn State *BIM Project Execution Planning Guide* use-case definition “Phase Planning (4D Modeling)”.],
  [*IFC 4.3*], [The data model for open 4D exchange: `IfcWorkPlan`, `IfcWorkSchedule`, `IfcTask` (+ `IfcTaskTime`), `IfcRelSequence` (logic), `IfcRelAssignsToProcess` / `IfcRelAssignsToProduct` (links between tasks and objects), `IfcWorkCalendar`. Tool support is still limited; most 4D exchange is native or via CSV link tables.],
)

=== Writing 4D requirements in an EIR

A useful 4D EIR clause answers six questions. Example wording for a highway scheme (adapt to your project):

#block(inset: 10pt, fill: rgb("#f7f9fb"), radius: 3pt, stroke: 0.5pt + rule)[
  #set text(size: 9.2pt)
  *EIR 7.4 — 4D construction sequencing (BIM use U-07)*

  + *Purpose.* The appointed party shall produce a 4D model to (a) demonstrate the construction sequence and traffic management phasing for each construction stage, (b) identify time–space conflicts, and (c) support the review and acceptance of the Contractor's programme.
  + *Milestones.* At tender (Level 2, whole scheme), at programme acceptance (Level 3), and updated with each accepted programme revision (monthly) during construction. Level 4–5 4D rehearsals for every possession or full road closure longer than 8 hours, delivered 4 weeks before the closure.
  + *Inputs.* The 4D model shall use the *latest Shared (S1 or higher)* design models and the *Accepted Programme* of the same date. Input versions shall be recorded.
  + *Content.* Permanent works, temporary works (falsework, cranes, piling rigs, temporary barriers), traffic management layouts per phase, compounds and haul roads, and existing assets to be demolished.
  + *Information.* All permanent model objects in scope shall carry the property `ActivityID` (in the project property set) matching the activity ID in the programme, or be linked through a link table delivered with the model.
  + *Deliverables and acceptance.* See the 4D deliverable list (§19.4). Acceptance criteria: ≥ 98 % of in-scope model objects linked; 100 % of construction activities with a physical scope linked; no object linked to more than one “construct” task; input versions identical to the referenced programme revision.
]

=== What the BEP should say about 4D

The delivery team's response in the BEP should specify:

- the *4D lead* and the planning interface (who owns the programme vs who owns the 4D model);
- the *software* (e.g. Synchro 4D, Navisworks TimeLiner, Bentley iTwin, Fuzor, Autodesk Construction Cloud, Trimble Connect, RIB iTWO, Asta Powerproject BIM) and versions; how the programme is imported (P6 XER/XML, MSP XML, Asta);
- the *linking method*: activity-ID properties in authoring tools, rule-based search sets, or manual selection, and how links survive model updates;
- the *segmentation strategy* (who cuts objects into pours, lifts, layers, chainage blocks, and where);
- *appearance conventions* and the *legend*;
- *update frequency* and *version control* (model revision + programme data date);
- *QA checks* before issue (§20.3);
- *outputs* and formats (§19.4).

=== The 4D deliverable package

A complete 4D deliverable at a milestone is a *package of containers*, not a single video:

#datatable(
  columns: (0.3fr, 1.4fr, 3fr),
  header: ("#", "Container", "Contents"),
  [1], [*4D native model*], [The linked model in the agreed tool format (e.g. Synchro project, Navisworks NWD/NWF with TimeLiner), plus all referenced model files at the stated revisions.],
  [2], [*Programme used*], [Exported programme (XER/XML/PDF) with *data date* and revision ID, identical to the version referenced in the 4D model.],
  [3], [*Link table*], [Machine-readable mapping: object GUID (and/or name, model file) ↔ activity ID ↔ task type (construct / demolish / temporary / maintain). CSV/XLSX or IFC `IfcRelAssignsToProcess`.],
  [4], [*Coverage & QA report*], [Statistics: objects linked/unlinked (by discipline and model), activities linked/unlinked, objects with multiple “construct” links, activities with zero duration but physical scope, programme logic issues (open ends, constraints). Results of the checks in §20.3.],
  [5], [*Simulation video(s)*], [Full sequence (and per stage/phase) at agreed resolution (e.g. 1920×1080), with overlays (date, active activities, legend, phase/TM name, Gantt strip, north arrow, chainage). Typically 2–10 minutes; key-period videos for critical operations.],
  [6], [*Snapshots / storyboard*], [Images at key dates (end of each phase, start/end of each possession, monthly) with captions; often compiled into a PDF *4D storyboard*.],
  [7], [*4D report*], [See below.],
  [8], [*Issues*], [Time–space conflicts and constructability issues as BCF topics (with viewpoint and date) in the issue tracker.],
  [9], [*Open export* (if required)], [IFC 4.3 with `IfcWorkSchedule`/`IfcTask` and assignments, for long-term archive and tool independence.],
)

==== The 4D report

A 4D report of 10–30 pages typically contains:

+ *Purpose and scope* of this 4D issue (milestone, use cases, area).
+ *Inputs*: model containers with names and revisions, programme ID and data date, TM drawings, temporary works designs.
+ *Methodology*: segmentation, linking method, appearance rules and legend, assumptions (e.g. “piling rig modelled as envelope only”).
+ *Coverage statistics* (from container 4).
+ *Sequence narrative by phase*: a short text + snapshot per phase (“Phase 2: northbound carriageway in contraflow; P1 and P2 piles; abutment A1 excavation”).
+ *Findings*: time–space conflicts, logic issues, access/egress problems, clearance violations of temporary works, H&S risks; each with ID, date range, location (chainage/structure), severity, owner, status.
+ *Recommendations* and changes proposed to the programme or design.
+ *Appendices*: link table summary, full legend, list of videos and snapshots.

=== What a good 4D frame looks like

#figure(
  box(width: 100%, height: 7.3cm, {
    // frame
    place(rect(width: 100%, height: 7.3cm, fill: rgb("#20262e"), radius: 3pt))
    // 3D view area
    place(dx: 0.3cm, dy: 0.3cm, rect(width: 11.3cm, height: 5.1cm, fill: rgb("#3a4652"), radius: 2pt))
    // road band
    place(dx: 0.3cm, dy: 3.2cm, rect(width: 11.3cm, height: 1.2cm, fill: rgb("#59636e")))
    place(dx: 0.3cm, dy: 3.75cm, line(length: 11.3cm, stroke: (paint: white, thickness: 0.8pt, dash: "dashed")))
    // TM cones
    for i in range(0, 14) { place(dx: 0.8cm + i * 0.75cm, dy: 3.25cm, text(size: 6pt, fill: rgb("#f0a030"))[▲]) }
    // bridge: existing/complete (grey), in progress (green), temporary (yellow), demolish (red)
    place(dx: 2.2cm, dy: 1.5cm, rect(width: 3.4cm, height: 0.35cm, fill: rgb("#8fa0b0")))
    place(dx: 5.6cm, dy: 1.5cm, rect(width: 2.6cm, height: 0.35cm, fill: rgb("#3cbf6b")))
    place(dx: 2.4cm, dy: 1.85cm, rect(width: 0.35cm, height: 1.35cm, fill: rgb("#8fa0b0")))
    place(dx: 5.4cm, dy: 1.85cm, rect(width: 0.35cm, height: 1.35cm, fill: rgb("#8fa0b0")))
    place(dx: 8.0cm, dy: 1.85cm, rect(width: 0.35cm, height: 1.35cm, fill: rgb("#8fa0b0")))
    // falsework yellow
    for i in range(0, 5) { place(dx: 5.8cm + i * 0.48cm, dy: 1.85cm, rect(width: 0.12cm, height: 1.35cm, fill: rgb("#f2c94c"))) }
    // crane
    place(dx: 9.6cm, dy: 0.5cm, line(start: (0cm, 0cm), end: (0cm, 2.7cm), stroke: 2pt + rgb("#f2c94c")))
    place(dx: 8.0cm, dy: 0.5cm, line(start: (0cm, 0cm), end: (2.2cm, 0cm), stroke: 2pt + rgb("#f2c94c")))
    // old structure being demolished
    place(dx: 0.5cm, dy: 2.6cm, rect(width: 1.3cm, height: 0.35cm, fill: rgb("#e05252")))
    // overlay top-left
    place(dx: 0.45cm, dy: 0.42cm, text(font: heading-font, size: 7pt, fill: white)[*Tue 14 Sep 2027 · Week 37* \ Phase 2B — NB contraflow (TM layout TM-2B rev C04)])
    // chainage markers
    for (i, ch) in ((0, "2+300"), (1, "2+400"), (2, "2+500")) { place(dx: 1.5cm + i * 4cm, dy: 4.95cm, text(font: heading-font, size: 6pt, fill: white.transparentize(30%))[Ch #ch]) }
    // north arrow
    place(dx: 10.9cm, dy: 4.3cm, text(size: 10pt, fill: white)[⬆] )
    place(dx: 10.98cm, dy: 4.75cm, text(size: 6pt, fill: white)[N])
    // legend right
    place(dx: 11.9cm, dy: 0.3cm, rect(width: 3.4cm, height: 5.1cm, fill: rgb("#2b333c"), radius: 2pt, inset: 6pt)[
      #set text(font: heading-font, size: 6.5pt, fill: white)
      #set par(justify: false)
      *Legend* \
      #box(width: 6pt, height: 6pt, fill: rgb("#3cbf6b")) In construction \
      #box(width: 6pt, height: 6pt, fill: rgb("#8fa0b0")) Completed \
      #box(width: 6pt, height: 6pt, fill: rgb("#f2c94c")) Temporary works \
      #box(width: 6pt, height: 6pt, fill: rgb("#e05252")) Demolition \
      #box(width: 6pt, height: 6pt, fill: rgb("#f0a030")) Traffic mgmt \
      #v(4pt)
      *Active activities* \
      B01-SUP-1040 Deck pour 2/3 \
      B01-TW-0210 Falsework span 2 \
      DEM-0031 Remove old culvert \
      TM-2B Contraflow NB
    ])
    // gantt strip
    place(dx: 0.3cm, dy: 5.6cm, rect(width: 15cm, height: 1.45cm, fill: rgb("#2b333c"), radius: 2pt))
    let bars = ((0.5, 4, rgb("#8fa0b0")), (3.5, 5.5, rgb("#3cbf6b")), (2.0, 6.5, rgb("#f2c94c")), (6.0, 3, rgb("#3cbf6b")))
    for (i, b) in bars.enumerate() {
      let (x, w, c) = b
      place(dx: 0.5cm + x * 1cm, dy: 5.75cm + i * 0.3cm, rect(width: w * 1cm, height: 0.2cm, fill: c, radius: 1pt))
    }
    place(dx: 6.0cm, dy: 5.65cm, line(start: (0cm, 0cm), end: (0cm, 1.3cm), stroke: 1.2pt + red))
    place(dx: 12.2cm, dy: 6.1cm, text(font: heading-font, size: 6pt, fill: white.transparentize(30%))[Model: rev P07 · Programme: AP-12 \ data date 2027-08-31 · Status S3])
  }),
  caption: [Anatomy of a 4D frame: date and phase, TM layout reference, colour legend, active activity list, Gantt strip with time cursor, chainage markers, north arrow, and the *input versions and status*.],
)

=== Appearance conventions

There is no universal standard, but most tools and projects use a variant of this scheme (Navisworks TimeLiner's default task types are Construct, Demolish and Temporary):

#datatable(
  columns: (1.1fr, 1.4fr, 2.4fr),
  header: ("Task type", "During activity", "After activity"),
  [*Construct*], [Green (often semi-transparent)], [Object's normal (model) appearance.],
  [*Demolish / remove*], [Red], [Hidden.],
  [*Temporary*], [Yellow / orange], [Hidden after removal activity.],
  [*Existing (retained)*], [Grey or model appearance throughout], [–],
  [*Maintain / modify*], [Blue or purple], [Model appearance.],
  [*Planned vs actual*], [Ahead of plan: blue; behind plan: red outline / hatch], [Used in progress monitoring views.],
)

Define the legend in the BEP and keep it the same across all issues. Changing colours between monthly issues confuses stakeholders.

=== Acceptance criteria and metrics

#datatable(
  columns: (1.6fr, 1fr, 2fr),
  header: ("Metric", "Typical target", "Why"),
  [In-scope objects linked to ≥ 1 task], [≥ 95–100 %], [Unlinked objects either appear from day 1 or never; both mislead.],
  [Activities with physical scope linked], [100 %], [Otherwise the model under-represents the work.],
  [Objects with > 1 “construct” link], [0 (unless intended, e.g. multiple pours, documented)], [Indicates duplicate or mis-assigned links.],
  [Input versions match the referenced programme], [Yes], [The 4D model must explain the *accepted* programme, not a draft.],
  [Programme logic checks (open ends, hard constraints)], [Reported], [4D shows what the programme says. If the logic is bad, the 4D is misleading.],
  [Temporary works and TM per phase present], [Yes], [Most conflicts involve temporary works.],
)

#builder[
  - Generate the *coverage & QA report* automatically from the link table: it is the 4D equivalent of an IDS check.
  - Burn *input versions and status code* into every rendered frame and snapshot.
  - Support *BCF export* for time–space conflicts with the date range as a property.
  - Export 4D to IFC (`IfcWorkSchedule`, `IfcTask`, `IfcRelAssignsToProcess`, `IfcRelSequence`) for archive, even if day-to-day work uses native formats.
]

#keypoints[
  - There is no single 4D standard. Requirements come from the EIR (purpose, milestones, acceptance), LOIN, the contract programme and client BIM standards.
  - The deliverable is a *package*: native model, programme, link table, QA report, videos, snapshots, report, issues, and optionally IFC.
  - A good frame always shows *date, phase, legend, active activities and input versions*.
  - Acceptance is measurable: link coverage, version consistency, programme logic quality.
]
