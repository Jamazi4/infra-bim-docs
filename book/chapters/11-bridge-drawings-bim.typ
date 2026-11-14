#import "../template.typ": *

== Bridge Drawings, Deliverables and BIM Requirements

=== The bridge drawing set

Even on BIM projects, *drawings remain the contractual and statutory deliverable* in most countries (the US “model as legal document” movement is the exception, and still emerging). A detailed design package for a typical three-span overbridge has 25–60 drawings. The main types:

#datatable(
  columns: (1.3fr, 3fr),
  header: ("Drawing", "What it must show"),
  [*General Arrangement (GA)*], [Plan, elevation and typical cross-section(s); span arrangement; overall dimensions; chainages and skew of supports; road/rail and clearance envelopes below; levels (deck, bearing shelves, foundations, ground, water levels); materials; key notes (design codes, loads, design life, exposure classes, cover). The “index” drawing that everybody reads first.],
  [*Setting-out drawing*], [Coordinates (project grid) and chainage/offset of key points: support centreline intersections, bearing centres, deck corners, pile positions; levels at bearings and deck ends; reference to the alignment and survey control.],
  [*Foundation / piling layout*], [Pile positions, numbers, diameters, toe levels, cut-off levels, rake; pile cap outlines and levels; ground model reference.],
  [*Substructure general arrangement*], [Abutments, wing walls, piers and crossheads: concrete outlines, construction joints, bearing plinths, drainage, waterproofing.],
  [*Superstructure general arrangement*], [Deck plan, girders/beams layout, diaphragms, cross-sections at key positions, construction joints, pour sequence, deck drainage, ducts and services, parapet details.],
  [*Reinforcement drawings*], [Bar marks, sizes, spacing, cover, laps and couplers; shown in plans and sections; each bar with a *mark* linked to the *bar bending schedule (BBS)*, using the shape codes of BS 8666, ISO 4066 or the national standard.],
  [*Prestressing drawings*], [Tendon layout and profile (coordinates along the span), anchorages, ducts, stressing sequence and forces, elongations, couplers, grouting vents.],
  [*Steelwork drawings*], [Girder elevations, flange/web plate thicknesses along the length, splices, stiffeners, bracing, shear studs, *precamber diagram*, corrosion protection, weld and bolt specifications (shop drawings then come from the fabricator).],
  [*Bearing schedule & layout*], [Each bearing: ID, location, type (fixed/guided/free, guiding direction), design loads (max/min vertical, horizontal), movements, rotations, preset values at installation temperature, dimensions, replacement jacking points.],
  [*Expansion joint schedule*], [Type, movement range, gap at installation temperatures, drainage, layout through parapets and footways.],
  [*Waterproofing, drainage & surfacing*], [Deck waterproofing system, falls, gullies, downpipes, drainage behind abutments, surfacing build-up.],
  [*Parapets / barriers*], [Containment level, anchorage to deck, transitions to road safety barriers, lighting columns.],
  [*Construction sequence / erection*], [Stages of construction assumed in design, temporary supports, lifting points, pour sequence; temporary works interfaces.],
  [*Camber / precamber*], [Required camber of beams, girders or segments (diagrams or tables).],
  [*Miscellaneous*], [Inspection access, utilities, earthing & bonding (rail), lighting, signs, monitoring instrumentation, scour protection, finishes and architectural details.],
)

==== Other bridge deliverables

- *Design calculations* (Chapter 9) and *check certificate*.
- *Specification* (project specification appendices: concrete, steel, prestressing, bearings, joints, waterproofing).
- *Bill of quantities* / quantity take-off (concrete volumes per class, reinforcement tonnage per diameter, structural steel tonnage, prestressing steel, bearings, joints, waterproofing area).
- *Designer's risk assessment* / design risk register (CDM in the UK) feeding the H&S file.
- *Inspection and maintenance manual* and *as-built records*, which become part of the *Asset Information Model*.
- *Structure inventory data* for the asset management system (bridge ID, type, spans, materials, year, load capacity, clearances, bearings, joints, waterproofing). See the AIR in Chapter 3.

=== How drawings are produced from the model

In current practice:

+ *GA, setting-out, outline drawings*: extracted from the 3D model as views and sections, then annotated in 2D. Chainage and level annotation should be *live* (linked to the alignment).
+ *Reinforcement*: 3D rebar modelling (Allplan, Tekla, Revit) is increasingly standard for complex pier heads and abutments. For decks, 2D rebar detailing with schedules is still common. The *BBS* is generated from the model or detailed objects.
+ *Steelwork*: design drawings from the model, with fabrication models (Tekla and others) produced by the fabricator.
+ *Schedules* (bearings, joints, piles) generated from model data and analysis results.

#warning(title: "The classic drawing–model inconsistency")[
  Most bridge-model QA failures come from drawings edited in 2D after extraction (a dimension overridden, a level typed by hand) while the model stays unchanged, or the other way round. Requirements should state *which is the master* for each information type and how consistency is checked. Text overrides of dimension values should be detectable.
]

=== Model-based delivery (“digital delivery”)

Several owners are moving from drawings to the *model as the contract document*:

- *FHWA / US State DOTs:* the BIM for Infrastructure programme, pooled-fund studies on bridges (TPF-5(480), TPF-5(523) with roughly 25 participating DOTs) and the *AASHTO Information Delivery Manual for bridge design-to-construction* define the minimum information for bridge project letting, with IFC 4.3 as the target format. Utah DOT and others have piloted digitally signed 3D bridge deliverables.
- *Europe:* Scandinavian road and rail authorities (e.g. Trafikverket, Statens vegvesen, Nye Veier) have delivered “model-based” projects for years, with drawings reduced to a minimum. Germany's federal roads programme requires defined BIM use cases on major projects.
- *UK:* National Highways and Network Rail require ISO 19650 delivery with asset data; drawings remain contractual.

=== BIM requirements for a bridge: what to specify

#figure(
  {
    set text(size: 7.8pt)
    datatable(
      columns: (1.2fr, 1.2fr, 1.4fr, 1.4fr),
      header: ("Element", "Preliminary design", "Detailed design", "As-built / handover"),
      [Bridge (whole)], [Type, spans, width, structure ID], [+ design codes, design life, loads, check category], [+ construction dates, contractor, load capacity, inventory data],
      [Deck / girders], [Envelope solids], [True solids, segments per pour/lift, concrete class, prestress yes/no], [+ as-built geometry, supplier, cast dates, test refs],
      [Piers / abutments], [Envelope solids at support lines], [True solids, construction joints, bearing plinths], [+ as-built survey, concrete records],
      [Foundations / piles], [Indicative cap & pile group], [Each pile: diameter, toe level, design load], [+ actual toe level, pile test results, records],
      [Bearings], [Position + function], [Type, loads, movements, ID], [+ manufacturer, product, serial, preset, installation record],
      [Expansion joints], [Position], [Type, movement range], [+ manufacturer, installation gap & temperature],
      [Reinforcement], [–], [Optional 3D (complex zones) / BBS reference], [As-built changes recorded],
      [Tendons], [–], [Profile, force, type], [+ stressing records (elongations), grouting records],
      [Parapets], [Containment level], [Type, anchorage], [+ product, test certificate],
      [Drainage, ducts, utilities], [–], [Routes and sizes], [+ as-built routes],
    )
  },
  kind: table,
  caption: [Example LOIN progression for a bridge (alphanumeric highlights only).],
)

=== Checklist: reviewing a bridge model and drawing set

#datatable(
  columns: (0.25fr, 3fr, 0.4fr),
  header: ("", "Check", "✓"),
  [1], [Model uses the *current alignment revision*; chainages and skews of supports match GA drawing and setting-out.], [☐],
  [2], [Deck levels follow the road/rail profile and crossfall/cant minus surfacing; bearing shelf levels consistent.], [☐],
  [3], [Clearance envelopes (road headroom, rail kinematic gauge + OLE, navigation, flood freeboard) are modelled and clear.], [☐],
  [4], [Spans in model = spans in calculations = spans on drawings.], [☐],
  [5], [Bearing layout: each bearing has ID, type and function; fixity pattern makes structural sense; schedule = model = analysis.], [☐],
  [6], [Expansion joint locations and movement ranges consistent with bearing layout.], [☐],
  [7], [Pile layout matches foundation design; no clashes with existing utilities and other foundations.], [☐],
  [8], [Interfaces with the highway model: approach slabs, wing walls vs earthworks, barriers transitions, drainage connections, ducts.], [☐],
  [9], [Construction joints and pour/segment breakdown consistent with the construction sequence drawing and the 4D model.], [☐],
  [10], [IFC export: correct spatial structure (IfcBridge/IfcBridgePart), entity types (no proxies), classification, required property sets, georeferencing.], [☐],
  [11], [Quantities from model reconcile with BoQ (concrete per class, rebar tonnage, steel tonnage).], [☐],
  [12], [Drawing annotations not overridden; title blocks, revisions and status codes consistent with the CDE metadata.], [☐],
  [13], [Camber/precamber information present where needed and clearly separated from final geometry.], [☐],
  [14], [Inspection access, maintenance and bearing replacement considered (jacking points, access gantries).], [☐],
)

#builder[
  - Auto-generate *setting-out tables* (coordinates + chainage/offset + level) for bearings, support intersections and piles directly from the model, so they cannot drift from the model.
  - Generate bearing, joint and pile *schedules* as data tables (with IDs persistent across revisions) and compare them across revisions.
  - Implement the checklist above as rule-based checks where possible: span consistency, alignment revision, clearance-envelope clash, bearing fixity logic, IFC structure and property completeness.
  - Detect 2D *overrides* on dimension and level annotations.
]

#keypoints[
  - The drawing set is still the contract on most projects. GA, setting-out, substructure, superstructure, rebar, prestress, steel, bearings, joints and sequence each have defined contents.
  - Schedules and setting-out should be *generated from model data*. Manual tables drift.
  - LOIN for bridges evolves from envelopes and functions (preliminary) to typed, loaded components (design) to manufacturer and installation data (as-built).
  - Model-based delivery is coming (AASHTO bridge IDM, Nordic practice), and IFC 4.3 is its target format.
]
