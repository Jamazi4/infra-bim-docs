#import "../template.typ": *

== 4D Workflow, Quality Checks and Infrastructure Specifics

=== Step-by-step workflow

+ *Agree purpose and granularity.* Which use cases, which programme level, which areas, which time window. Write it in the BEP (Chapter 19).
+ *Collect inputs.* Design models at a known revision (Shared, S1+), existing-condition model (survey, point cloud, existing structures to be demolished), temporary works and TM designs, the programme with data date.
+ *Prepare the programme for 4D.* Check that activity IDs are stable, the WBS mirrors the physical breakdown, activities have locations (chainage/structure codes in activity codes or names), and activities with physical scope are separated from non-physical ones (design, procurement, approvals).
+ *Prepare the model for 4D.* Segment objects to match the programme (pours, lifts, layers, chainage blocks), add temporary objects (cranes, falsework, piling rigs, barriers, compounds), add the `ActivityID` property or classification codes that allow rule-based linking.
+ *Link.* Rule-based where possible (property = activity ID; location code + element type → activity), manual only for the rest.
+ *Assign task types and appearance* (construct, demolish, temporary…).
+ *Run QA checks* (§20.3) and fix.
+ *Review the simulation with the planner and construction team.* This is where the value is: walk through each phase and record conflicts as issues.
+ *Produce outputs* (videos, snapshots, report, link table) and submit through the CDE.
+ *Maintain.* Update with each programme revision and model revision. Re-linking must be cheap, so rule-based links and stable IDs are essential.

=== Linking techniques compared

#datatable(
  columns: (1.2fr, 2fr, 2fr),
  header: ("Technique", "How", "Pros / cons"),
  [*Manual selection*], [Select objects in 3D, attach to task.], [+ quick for small models. − Lost when models are replaced; not auditable; does not scale.],
  [*Search / selection sets*], [Saved queries (e.g. “Structure = B01 AND Element = Pier AND Name = P1”) attached to tasks.], [+ Survive model updates if properties are stable. − Must be maintained as the breakdown changes.],
  [*Activity ID property on objects*], [Authors (or a script) write `ActivityID` into each object; the 4D tool auto-matches it to the programme field.], [+ Robust, auditable, works for many tools. − Authors must maintain it; one object can serve only one activity unless a list is allowed.],
  [*Link table*], [External mapping GUID ↔ activity ID, managed in a database or spreadsheet.], [+ Independent of authoring tools; easy to QA. − GUID stability across exports is critical.],
  [*Rule-based by location + type*], [Objects classified by type (Uniclass/IFC) and location (chainage range, structure ID) are matched to activities that carry the same codes.], [+ Scales to whole highways/railways; best for linear works. − Needs disciplined coding in both model and programme.],
)

#tip(title: "Make the programme carry location codes")[
  On linear schemes, ask planners to add *activity codes* for structure ID, section, chainage from/to, side (NB/SB, up/down line) and work type. Ask modellers to carry the same codes on objects. Linking then becomes a database join instead of thousands of clicks, and the time–chainage view comes for free.
]

=== QA checks before issuing a 4D model

#datatable(
  columns: (0.25fr, 2.4fr, 1.8fr),
  header: ("", "Check", "Typical finding"),
  [1], [*Input versions*: model revisions and programme data date match the ones stated in the report.], [4D built on last month's programme.],
  [2], [*Unlinked objects* in scope (by model, discipline, type).], [Drainage model never linked, so pipes appear on day 1.],
  [3], [*Unlinked activities* with physical scope.], [“Install bearings P1” has no objects: bearings missing from model.],
  [4], [*Duplicate links* (an object under two construct tasks).], [Deck slab linked to both “deck pour” and “parapet install”.],
  [5], [*Sequence sanity*: objects appear supported (no pier crosshead before its column; no deck before bearings; no pavement before drainage crossing).], [Logic error in programme or wrong link.],
  [6], [*Temporary works lifecycle*: each temporary object has both an install and a removal task.], [Falsework never removed in the simulation.],
  [7], [*Demolition*: existing objects to be removed are present at start and removed by a demolish task.], [Old bridge stays visible after the new one opens.],
  [8], [*TM phases* match the TM drawings and the works in each phase.], [Works in a lane that is open to traffic in that phase.],
  [9], [*Clearance in time*: temporary works and plant vs live traffic/rail envelopes and OLE.], [Crane swing over live carriageway outside closure.],
  [10], [*Programme quality* (DCMA-style): open ends, negative float, hard constraints, excessive lags.], [4D shows activities that are not logically connected.],
  [11], [*Appearance & legend* consistent with BEP; overlays present (date, phase, versions).], [Missing date or version on video frames.],
)

=== Infrastructure-specific 4D topics

==== Earthworks and mass haul

Earthworks are the largest activity on most new highways and railways. A 4D model for earthworks should:

- split cut and fill volumes into *blocks by chainage and layer* (e.g. 250 m × 0.5 m lifts) so progress can be shown realistically;
- reflect the *mass-haul* plan: where cut material goes, haul road availability, borrow pits and disposal sites, and the dependency on structures (a bridge or culvert may need to be built before haul traffic can cross a river or road);
- respect *seasonal windows* (wet season, frost).

Some tools generate earthworks 4D directly from a mass-haul diagram. Many projects fake it with simple chainage-block solids, which is still far better than one solid for the whole cut.

==== Traffic management phasing

On widening and junction schemes, the *TM phase* is the main structure of the programme: “Phase 1 – works in central reserve behind temporary barrier; Phase 2 – northbound traffic in contraflow on southbound carriageway; …”. Model each phase's TM layout (cones, temporary barriers, temporary lines, diversions) as *temporary objects* linked to the phase start and end. The 4D model then demonstrates the most important safety and stakeholder message: *where the traffic is, where the workers are, and that they are separated.*

==== Rail possessions

For rail, the controlling constraint is the *possession* (line blocked to traffic, typically nights or weekends, booked months or years ahead) and *isolations* of the overhead line. A possession 4D is planned at Level 5: hour-by-hour (or 15-minute) activities, plant movements (road-rail vehicles, cranes, SPMTs), and handback. It is often combined with *crane lift plans* and *temporary works* for slide-ins. Treat each possession as its own 4D sub-model with a fixed time window.

==== Bridges: cycle-based 4D and the link to the designer

Bridge construction is repetitive at segment level: ILM launch cycles (cast–stress–launch weekly), balanced cantilever pairs (cast segment pair every 5–10 days), MSS spans (1–2 weeks per span), full-span precast (per day). Build the 4D around the *cycle*. The model is segmented per pour/segment, and each cycle is a template of activities.

Remember Chapter 8: *the designer's construction-stage analysis assumed a sequence.* The 4D model is the easiest place to compare the contractor's actual planned sequence with the designer's assumed stages. Projects that link analysis stage IDs to 4D tasks catch sequence changes that need a design check.

==== Utilities and enabling works

Utility diversions are frequently on the critical path of highway projects and are often missing from the 4D model because they are designed by third parties. Model at least the *space* they occupy and their *time windows*.

=== Progress monitoring and reality capture

During construction the 4D model becomes a *planned vs actual* tool:

- *Actual dates* from the updated programme drive “ahead/behind” colouring.
- *Reality capture* (drone photogrammetry, laser scanning, 360° photos, machine-control as-built data from dozers/graders/pavers) can be compared with the 4D model at the same date. Earthworks volumes and pavement layers lend themselves to automated progress measurement against design surfaces.
- *Field data* (pour records, pile records, inspection and test plans) can update object status and become part of the AIM.

=== 5D in brief

5D links *cost* to the same structure: model quantities (by object and segment) × unit rates → activity cost → cash-flow S-curve. Infrastructure quantities from models need care: earthworks volumes depend on surfaces and bulking factors, pavement on layer definitions, structures on concrete class and reinforcement ratios. For 5D the model must also be segmented the same way as the *bill of quantities* and the *payment structure* (e.g. NEC activity schedules). Agreeing *one breakdown* for model, programme and cost (WBS = CBS = model breakdown) is the biggest single enabler of 4D and 5D.

#builder[
  - Implement the 11 QA checks as automated rules with a report and issue export.
  - Support *cycle templates* (a set of activities + segmentation rule) for repetitive bridge and linear works.
  - Store *construction stage IDs* from analysis and *activity IDs* from planning on the same objects, and provide a comparison view.
  - Ingest reality-capture surfaces and compute progress (volume or area by chainage block) against design surfaces at the programme data date.
]

#keypoints[
  - A maintainable 4D relies on stable IDs, location codes in both model and programme, and rule-based linking.
  - Run QA before every issue: versions, link coverage, duplicates, sequence sanity, temporary works and TM, clearances, programme quality.
  - Infra-specific 4D: earthworks by chainage and layer, TM phases as the backbone, rail possessions at hour level, bridges by construction cycle.
  - One shared breakdown for model, programme and cost unlocks 4D and 5D.
]
