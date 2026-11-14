#import "../template.typ": *

== 4D Fundamentals: Purposes, Inputs and Planning Basics

=== What 4D is and what it is not

A *4D model* is a 3D information model in which model objects are *linked to the activities of a construction programme*, so that the state of the works at any date can be shown, queried and analysed. The 4D model is *not* the video. The video is one *output* of the 4D model. The value is in the *linked data*: which objects are built, removed or temporarily present at each moment, and which activities are inconsistent with the space they need.

#figure(
  {
    set text(font: heading-font, size: 8pt)
    let bx(t, c) = rect(width: 100%, height: 1.7cm, inset: 5pt, radius: 3pt, fill: c.lighten(85%), stroke: 0.8pt + c, align(center + horizon, t))
    grid(columns: (1fr, 0.2fr, 1fr, 0.2fr, 1fr, 0.2fr, 1.2fr),
      bx([*3D model* \ permanent + temporary objects, segmented for construction], accent),
      align(center + horizon)[+],
      bx([*Programme* \ activities, dates, logic, WBS (P6, MSP, Asta)], warn),
      align(center + horizon)[+],
      bx([*Links* \ activity ID ↔ objects; task type (build / remove / temporary)], tool),
      align(center + horizon)[=],
      bx([*4D model* \ → simulations, snapshots, reports, conflict analysis, progress], good),
    )
  },
  caption: [4D = model + programme + links (+ appearance rules).],
)

The broader “nD” family: *5D* adds cost (quantities × rates, cash flow over time), *6D* is variously used for sustainability/carbon or for facility management (there is no agreed standard meaning, so always define it), and *7D* for FM. Only 4D and 5D are used consistently.

=== Why projects ask for 4D: use cases

#datatable(
  columns: (1.2fr, 1fr, 2.6fr),
  header: ("Use case", "Stage", "Output and value"),
  [*Construction sequence / phasing study*], [Options, preliminary design], [Show that a scheme can be built in phases while traffic keeps running; compare construction options (e.g. on-line widening vs off-line). Supports option selection and consents.],
  [*Constructability review*], [Design], [Find design elements that cannot be built in the planned sequence (e.g. a pier inside a traffic lane needed until phase 3).],
  [*Tender / bid planning*], [Tender], [Demonstrate the contractor's method and programme to the client; often a scored tender deliverable.],
  [*Construction planning & logistics*], [Pre-construction], [Site layout over time: compounds, haul roads, crane positions, laydown, access, temporary works.],
  [*Traffic management phasing*], [Design & construction], [Each TM phase (lane closures, contraflows, diversions) shown with the works it enables.],
  [*Possession / closure planning*], [Rail & road], [Hour-by-hour rehearsal of critical possessions (bridge slide-in, track renewal).],
  [*Health & safety planning*], [Construction], [Time–space conflicts: overlapping work zones, crane swing over live traffic, working at height; supports ISO 19650-6 / CDM.],
  [*Stakeholder communication*], [All], [Public consultation, local authorities, utilities, emergency services.],
  [*Progress monitoring*], [Construction], [Planned vs actual: actual dates or survey/reality capture linked back; colour coding ahead/behind.],
  [*Delay analysis & claims*], [Construction / post], [Visualise as-planned vs as-built; supports forensic analysis (e.g. time-impact analysis).],
  [*5D cash flow*], [Pre-construction & construction], [Cost loading of activities from model quantities; earned value.],
)

The German BIM4INFRA / Masterplan BIM Bundesfernstraßen list of *Anwendungsfälle* includes construction scheduling / 4D construction sequencing as a standard use case. The US Penn State *BIM Project Execution Planning Guide* calls it “Phase Planning (4D Modeling)”. UK and other ISO 19650 EIRs list it among the *BIM uses* with their own definitions.

=== Programme (schedule) basics you need

Planners and BIM people often misunderstand each other. The essentials:

#datatable(
  columns: (1.1fr, 3fr),
  header: ("Term", "Meaning"),
  [*WBS*], [Work Breakdown Structure: hierarchy of the work (e.g. Project → Section → Structure B01 → Substructure → Pier P1 → Pile cap). ISO 21511 covers WBS for project management. A WBS that mirrors the model breakdown makes 4D linking far easier.],
  [*Activity*], [A unit of work with an ID, name, duration, calendar, resources. Has early/late dates.],
  [*Milestone*], [Zero-duration event (e.g. “Possession start”, “Bridge open to traffic”).],
  [*Logic / dependencies*], [Finish-to-Start (FS), Start-to-Start (SS), Finish-to-Finish (FF), Start-to-Finish (SF), with lags (e.g. concrete curing 7 days).],
  [*Critical path*], [Longest chain of dependent activities; zero total float. Delays on it delay completion.],
  [*Float*], [Total float (delay possible without delaying completion), free float (without delaying successors).],
  [*Baseline vs update*], [The *baseline* is the accepted programme; *updates* record progress and re-forecast. Under NEC4 it is the “Accepted Programme” (clause 31/32), under FIDIC the clause 8.3 programme.],
  [*Calendars*], [Working time, night shifts, weekend possessions, seasonal restrictions (e.g. no earthworks in winter, bird nesting, fish spawning windows for river works).],
  [*Programme levels*], [Level 1 (executive summary, milestones) → Level 2 (summary by area/phase) → Level 3 (detailed project programme; the usual contract programme) → Level 4 (detailed working schedules, weeks) → Level 5 (short-term, daily/hourly; possession plans). 4D is typically linked at *Level 3–4*, and at Level 5 for critical possessions.],
)

#note(title: "Good practice references for planning")[
  - CIOB, *Guide to Good Practice in the Management of Time in Major Projects* (2nd ed., 2018).
  - AACE International *Recommended Practices* (e.g. on schedule classification and forensic schedule analysis).
  - Planning Planet / PMI scheduling practice standards.
  - DCMA 14-point schedule assessment (a widely used quality check of a programme: missing logic, leads, lags, hard constraints, high float, negative float, etc.).
]

=== Linear infrastructure: time–location planning

Highway and rail works are long and repetitive: earthworks, drainage, pavement layers, track laying. They move along the chainage. Gantt charts show them poorly. Planners use *time–location* (time–chainage, “linear scheduling”, “line-of-balance”) diagrams, with chainage on one axis and time on the other. Each activity is a line or block whose slope is its production rate. Clashes between crews show as crossing lines. Tools include Trimble TILOS, Asta Powerproject (linear views), and plugins for P6.

#figure(
  {
    set text(font: heading-font, size: 7pt)
    box(width: 13cm, height: 5.6cm, {
      // axes
      place(dx: 1cm, dy: 0cm, line(start: (0cm, 0cm), end: (0cm, 5cm), stroke: 0.8pt + ink))
      place(dx: 1cm, dy: 5cm, line(start: (0cm, 0cm), end: (11.5cm, 0cm), stroke: 0.8pt + ink))
      place(dx: -0.6cm, dy: 2.2cm, rotate(-90deg, text(fill: muted)[Time (weeks)]))
      place(dx: 6cm, dy: 5.25cm, text(fill: muted)[Chainage (km)])
      for i in range(0, 6) {
        place(dx: 1cm + i * 2.2cm, dy: 5.05cm, text(fill: muted)[#(i * 2)])
      }
      for i in range(0, 5) { place(dx: 0.55cm, dy: 4.85cm - i * 1.2cm, text(fill: muted)[#(i * 10)]) }
      // activities: lines (from chainage, time)
      let pt(km, wk) = (1cm + km * 1.1cm, 5cm - wk * 0.12cm)
      let ln(a, b, c, name) = {
        place(line(start: pt(..a), end: pt(..b), stroke: 2.2pt + c))
        let (x, y) = pt(..b)
        place(dx: x + 2pt, dy: y - 8pt, text(fill: c, weight: "bold")[#name])
      }
      ln((0, 2), (10, 14), accent, "Site clearance")
      ln((0, 6), (10, 22), rgb("#8a6d3b"), "Earthworks")
      ln((0, 10), (10, 28), good, "Drainage")
      ln((0, 18), (10, 34), warn, "Pavement")
      // bridge block
      let (bx, by) = pt(4.2, 26)
      place(dx: bx, dy: by, rect(width: 0.6cm, height: 0.12cm * 18, fill: tool.lighten(50%), stroke: 0.8pt + tool))
      let (lx, ly) = pt(2.6, 30.5)
      place(dx: lx, dy: ly, text(fill: tool, weight: "bold")[Bridge B01 (stationary, wk 8–26)])
      // conflict marker where earthworks meet the bridge site
      let (cx, cy) = pt(4.5, 13.2)
      place(dx: cx - 0.17cm, dy: cy - 0.17cm, circle(radius: 0.17cm, stroke: 1.5pt + red))
      let (tx, ty) = pt(5.6, 3.6)
      place(dx: tx, dy: ty, text(fill: red, weight: "bold")[conflict: earthworks reach the bridge site])
    })
  },
  caption: [A simplified time–chainage diagram. Moving activities appear as sloped lines; structures appear as stationary blocks. The red circle marks a space–time conflict: the earthworks crew reaches the bridge site while the bridge works are still in progress.],
)

The 4D model is the 3D counterpart of this diagram. A good infra 4D toolset can show *both* views, synchronised.

=== Mapping model detail to programme detail

The key design decision of a 4D model is *granularity*: how finely the model is split, and how detailed the programme is. They must match.

#datatable(
  columns: (1.2fr, 2fr, 2fr),
  header: ("Programme level", "Typical activity", "Model segmentation needed"),
  [Level 2], [“Bridge B01 construction”, “Section 3 earthworks”], [Whole structure; earthworks per section.],
  [Level 3], [“B01 Pier P1 construction”, “Earthworks Ch 2+000–2+500”], [Per pier/abutment/deck; earthworks per 500 m block.],
  [Level 4], [“P1 pile cap pour”, “P1 column lift 2”, “Deck pour 3 of 5”; “Fill layer 3, Ch 2+000–2+250”], [Per pour/lift/segment; earthworks per layer and 250 m.],
  [Level 5], [“Possession 23: remove old deck (02:00–05:30)”], [Per lift, per object, including temporary works and plant.],
)

#warning(title: "The most common 4D failure")[
  The model was built by designers per *design* logic (one solid per pier, one deck per bridge, one corridor per 2 km). The programme is built by planners per *construction* logic (pours, lifts, layers, 250 m blocks). Nobody owns the gap, so the 4D team spends weeks cutting objects by hand, and must redo it every time the design model is updated. *Specify construction segmentation in the LOIN/BEP*, or let the 4D tool split objects by rules (by chainage, layer, height) without editing the design model.
]

#builder[
  - Support *rule-based segmentation* of design objects for 4D (split by chainage interval, by layer, by height/lift, by pour polygons) *non-destructively*, keeping the parent GUID.
  - Provide synchronised *Gantt*, *time–chainage* and *3D* views.
  - Import schedules from P6 (XER/XML), MS Project (XML), Asta Powerproject and IFC (`IfcWorkSchedule`/`IfcTask`), preserving activity IDs, WBS, calendars and logic.
]

#keypoints[
  - 4D = model + programme + links; the video is only one output.
  - Use cases range from phasing studies at design to progress monitoring and claims in construction.
  - Know the planning basics: WBS, logic, critical path, baseline vs update, levels 1–5.
  - In linear infra, time–chainage thinking is essential, and the model must be segmented to match the programme.
]
