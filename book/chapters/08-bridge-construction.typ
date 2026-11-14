#import "../template.typ": *

== How Bridges Are Built

For a modeller or a 4D specialist, the construction method matters more than the bridge type. It decides how the model must be *segmented*, which *temporary works* must be modelled, what the *4D sequence* looks like, and which *construction stages* the designer must analyse. In concrete bridges the method even changes the final internal forces, because creep redistributes stresses differently depending on how the structure was assembled.

=== Substructure construction (common to all methods)

+ *Site preparation and enabling works:* clearance, utilities diversions, access roads, working platforms, traffic management, and in rivers *cofferdams* or temporary islands.
+ *Piling:* driven piles (steel H/tube, precast concrete) or bored/CFA piles; pile testing (static or dynamic load tests, integrity tests).
+ *Pile caps / footings:* excavation, blinding, reinforcement, formwork, pour. Often several pours for large caps (thermal control).
+ *Piers and abutments:* climbing or slip-form formwork for tall piers; lifts of typically 3–5 m (each lift is a separate 4D/model element); crossheads, bearing plinths.
+ *Bearings:* installed on plinths, often with temporary locking and *presetting* for the expected movement at installation temperature.
+ *Backfill and wing walls:* abutment backfill with selected granular fill, drainage behind the abutment, approach slabs at the end.

=== Superstructure construction methods

#datatable(
  columns: (1.15fr, 0.7fr, 1.6fr, 1.75fr),
  header: ("Method", "Typical spans", "How it works", "Implications for model / 4D / analysis"),
  [*Cast in situ on falsework (scaffolding)*], [up to ~50 m per span (falsework spans may be up to 80 m with heavy systems)], [Formwork supported from the ground by falsework towers or beams; concrete poured in situ, then prestressed.], [Falsework is temporary works: model it as an envelope for clash and clearance checks (it occupies the road below!). 4D: falsework erect → reinforce → pour → stress → strike. Analysis is relatively simple (structure loaded only when complete).],
  [*Precast beams lifted by crane*], [15–45 m (crane capacity governs)], [Prestressed beams cast in a factory, delivered and lifted onto bearings, then in-situ deck slab and diaphragms.], [Each beam is an element with delivery and lift dates; crane positions and lift radii are logistics objects; road closures for lifts. Analysis: beam alone carries wet concrete; composite section carries later loads (two-stage).],
  [*Steel girders erected by crane*], [25–120 m], [Girders delivered in segments, bolted/welded at splices, lifted by crane(s), often in pairs; then deck slab poured (in sequence) on permanent formwork.], [Splices define segment elements; *pour sequence* of the deck slab matters for stresses and cracking; precamber of girders.],
  [*Incremental launching (ILM)*], [30–60 m per span (with temporary piers more)], [Deck cast in 15–30 m segments in a casting yard behind an abutment, then pushed forward by hydraulic jacks over sliding bearings; a steel *launching nose* reduces cantilever moments.], [Requires constant curvature in plan and elevation (straight or constant-radius). Each segment / launch cycle is a 4D step (typical 1 segment/week). Analysis must check *every launch position* (each section passes over support and midspan).],
  [*Balanced cantilever, cast in situ*], [70–250 m+], [Segments (3–5 m) cast with *form travellers* symmetrically either side of a pier; post-tensioned as they go; closure pours at midspan.], [Segments with cast dates; form travellers as temporary objects; *camber* (pre-set geometry) for each segment; heavy *construction stage analysis* with creep & shrinkage; closure sequence matters.],
  [*Balanced cantilever, precast segmental*], [45–135 m], [Match-cast segments erected by crane or *lifting frames / launching gantry*, glued and stressed.], [Segment ID and match-cast pairs; casting yard schedule; geometry control. Analysis as above.],
  [*Span-by-span / launching gantry*], [25–50 m], [Overhead or underslung gantry places all segments of one span, then stressed; or *full-span* precast boxes (900+ t) carried by a beam carrier and placed by gantry: high-speed rail standard in China and elsewhere.], [Very repetitive: 4D by span cycle (e.g. 1 span/day for full-span). Gantry loads on the completed structure must be checked.],
  [*Movable scaffolding system (MSS)*], [30–70 m], [Self-launching steel formwork moves span by span; deck cast in situ one span at a time (typically 1–2 weeks per span).], [Construction joints at ~1/5 span; staged continuity; MSS as a temporary object.],
  [*Arch: cantilever with stays / centring*], [50–600 m], [Arch built as cantilevers held by temporary stays, or on centring (falsework); then spandrel columns and deck.], [Temporary stays and their forces are a key analysis stage.],
  [*Cable-stayed: balanced cantilever from pylon*], [150–1,100 m], [Pylon built first; deck segments erected with cables installed and stressed per segment.], [Cable stressing sequence; geometry control; extensive construction stage analysis.],
)

=== Methods to minimise disruption over live roads and railways

On highway and rail schemes, the *method of installation* is usually dictated by *possession* (rail) or *closure* (road) windows.

- *Lift-in during possession or weekend closure:* precast beams or steel girders lifted with large mobile cranes.
- *Slide-in / roll-in:* the complete bridge (or deck) is built alongside the line and moved into place by *SPMTs* (self-propelled modular transporters) or skid-shoes during a 24–100 h closure. Common for rail overbridge replacements.
- *Jacked box:* a box structure pushed horizontally through an embankment under the railway (with ground stabilisation), so trains keep running.
- *Bridge rotation:* bridge built parallel to the obstacle and rotated into place (common in China over railways).
- *Precast culverts and portal units* installed in short closures.

#tip(title: "Why this matters for 4D")[
  A railway underbridge replacement can have a *single 54-hour possession* in which demolition, removal, slide-in, waterproofing, ballast, track and testing must all fit. The 4D model for that possession is planned *hour by hour* (Level 4–5 detail), while the rest of the project is planned in weeks. Your 4D tool must handle mixed time granularity.
]

=== Temporary works

Temporary works are often larger and riskier than the permanent works, and they are often missing from models.

#datatable(
  columns: (1.3fr, 3fr),
  header: ("Temporary works", "Notes"),
  [Falsework & formwork], [Designed by the contractor's temporary works designer; must be checked for clearance (road/rail envelopes beneath).],
  [Cofferdams, sheet piles], [For foundations in water or high groundwater.],
  [Crane platforms & outriggers], [Ground bearing capacity; proximity to existing structures and services.],
  [Temporary piers & launching noses], [ILM and some steel erection.],
  [Propping & bracing of steel girders], [Lateral–torsional buckling during the deck pour is a classic failure mode.],
  [Traffic management (TM)], [Lane closures, contraflows, temporary barriers. These are “temporary works” for the road and are essential in 4D.],
  [Access scaffolds, haul roads, compounds], [Logistics model objects.],
)

In the UK, temporary works are governed by BS 5975 (falsework) with a *Temporary Works Coordinator* role. Other countries have similar regimes.

=== Construction-stage analysis: why the designer cares

For a steel–concrete composite or concrete bridge, the *final* stresses depend on the sequence:

- A precast beam carries its own weight and the wet slab *alone* (non-composite section). Later loads (surfacing, parapets, traffic) are carried by the *composite* section.
- In a continuous concrete bridge built span by span or by cantilever, *creep* redistributes moments over the years toward the moments of a bridge cast in one go. Design checks are made at many times (e.g. at opening and at “t = ∞”, typically 10,000 days or more).
- Prestress losses (elastic shortening, friction, anchorage slip, creep, shrinkage, relaxation) depend on stressing dates.

Therefore *the designer's construction sequence and the contractor's 4D programme must agree.* If the contractor changes the sequence (for example pouring the deck slab in a different order), the designer must re-check. In BIM terms, the *analysis model's construction stages* and the *4D schedule* should be linked or at least cross-referenced.

=== Geometry control and camber

Bridges are not built to their final shape: they are built to the final shape *plus the deflections that will happen*. The deck is cast or fabricated with a *pre-camber* (precamber) so that after dead load, creep and shrinkage it reaches the design profile. Precast beams have a hog from prestress; steel girders are fabricated with a precamber; cantilever segments are cast at set levels from a *camber table* updated after each segment is surveyed.

#warning(title: "Which geometry is in the model?")[
  The 3D model usually shows the *final design geometry* (the road profile). Fabrication and setting-out need the *cambered* geometry. A good bridge information model either carries both, or carries the camber as data (camber diagram or table per segment/girder). As-built surveys will differ from both. Do not let an automated “as-built vs design” check flag camber as a defect.
]

#builder[
  - Allow bridge elements to be *segmented* by construction logic (pour, segment, lift, launch) independently of the design breakdown, keeping parent–child links.
  - Support *temporary objects* with lifecycle dates (erect / remove), and *clearance envelopes* (road, rail kinematic gauge) for clash checks in time.
  - Store *construction stage IDs* on elements so that the analysis stages and the 4D tasks can be reconciled.
  - Support *camber data* per element (tables or offset curves) separate from the design geometry.
]

#keypoints[
  - The construction method drives model segmentation, temporary works, 4D logic and the designer's stage analysis.
  - Short spans over live networks: lift-in, slide-in with SPMTs, jacked boxes, all planned around possessions or closures.
  - Long spans: ILM, balanced cantilever, MSS, span-by-span gantries, each with a repetitive cycle that suits 4D.
  - Camber means the built geometry differs from the final design geometry by design.
]
