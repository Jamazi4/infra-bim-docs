#import "../template.typ": *

== Bridge Anatomy and Bridge Types

=== The parts of a bridge

Every bridge, from a 10 m culvert to a 1 km viaduct, has the same functional parts. Learn the vocabulary first; everything else in Part II builds on it.

#figure(
  box(width: 100%, height: 6.3cm, {
    let c = ink
    let lab(x, y, t) = place(dx: x, dy: y, text(font: heading-font, size: 7pt, fill: accent)[#t])
    // ground
    place(dx: 0cm, dy: 4.3cm, line(length: 15.5cm, stroke: (paint: rgb("#8a6d3b"), thickness: 0.8pt, dash: "dashed")))
    // river
    place(dx: 5.7cm, dy: 4.6cm, rect(width: 4cm, height: 0.45cm, fill: rgb("#cfe3f3"), stroke: none))
    // embankments
    place(curve(stroke: 0.8pt + rgb("#8a6d3b"), fill: rgb("#efe6d6"),
      curve.move((0cm, 1.55cm)), curve.line((1.6cm, 1.55cm)), curve.line((2.6cm, 4.3cm)), curve.line((0cm, 4.3cm)), curve.close()))
    place(curve(stroke: 0.8pt + rgb("#8a6d3b"), fill: rgb("#efe6d6"),
      curve.move((15.5cm, 1.55cm)), curve.line((13.9cm, 1.55cm)), curve.line((12.9cm, 4.3cm)), curve.line((15.5cm, 4.3cm)), curve.close()))
    // deck
    place(dx: 1.7cm, dy: 1.25cm, rect(width: 12.1cm, height: 0.55cm, fill: rgb("#d5dbe1"), stroke: 0.8pt + c))
    // parapet
    place(dx: 1.7cm, dy: 0.95cm, line(length: 12.1cm, stroke: 0.6pt + c))
    for i in range(0, 13) { place(dx: 1.7cm + i * 1cm, dy: 0.95cm, line(length: 0.3cm, angle: 90deg, stroke: 0.5pt + c)) }
    // abutments
    place(dx: 1.45cm, dy: 1.9cm, rect(width: 0.55cm, height: 1.6cm, fill: rgb("#bfc8d1"), stroke: 0.8pt + c))
    place(dx: 13.5cm, dy: 1.9cm, rect(width: 0.55cm, height: 1.6cm, fill: rgb("#bfc8d1"), stroke: 0.8pt + c))
    // piers
    for x in (5.6cm, 9.6cm) {
      place(dx: x - 0.45cm, dy: 1.9cm, rect(width: 0.9cm, height: 0.3cm, fill: rgb("#bfc8d1"), stroke: 0.8pt + c))
      place(dx: x - 0.2cm, dy: 2.2cm, rect(width: 0.4cm, height: 2.2cm, fill: rgb("#bfc8d1"), stroke: 0.8pt + c))
      place(dx: x - 0.7cm, dy: 4.4cm, rect(width: 1.4cm, height: 0.35cm, fill: rgb("#a9b4bf"), stroke: 0.8pt + c))
      for k in (-0.5cm, 0cm, 0.5cm) { place(dx: x + k - 0.06cm, dy: 4.75cm, rect(width: 0.12cm, height: 1.2cm, fill: rgb("#a9b4bf"), stroke: 0.5pt + c)) }
    }
    // bearings
    for x in (1.75cm, 5.35cm, 5.85cm, 9.35cm, 9.85cm, 13.55cm) { place(dx: x - 0.1cm, dy: 1.8cm, rect(width: 0.3cm, height: 0.1cm, fill: warn, stroke: none)) }
    // footing abutment
    place(dx: 1.1cm, dy: 3.5cm, rect(width: 1.2cm, height: 0.3cm, fill: rgb("#a9b4bf"), stroke: 0.8pt + c))
    place(dx: 13.15cm, dy: 3.5cm, rect(width: 1.2cm, height: 0.3cm, fill: rgb("#a9b4bf"), stroke: 0.8pt + c))
    // expansion joint markers
    place(dx: 1.95cm, dy: 1.1cm, text(size: 9pt, fill: tool)[▼])
    place(dx: 13.4cm, dy: 1.1cm, text(size: 9pt, fill: tool)[▼])
    // approach slab
    place(dx: 0.2cm, dy: 1.55cm, rect(width: 1.3cm, height: 0.12cm, fill: rgb("#d5dbe1"), stroke: 0.5pt + c))
    // labels
    lab(6.6cm, 0.35cm, [Parapet / safety barrier])
    lab(6.9cm, 1.33cm, [Deck (superstructure)])
    lab(1.0cm, 0.55cm, [Expansion joint ▼])
    lab(0.0cm, 1.0cm, [Approach slab])
    lab(2.1cm, 2.35cm, [Abutment])
    lab(10.2cm, 2.6cm, [Pier (column + crosshead)])
    lab(6.3cm, 1.95cm, text(fill: warn)[◂ Bearings])
    lab(10.45cm, 4.45cm, [Pile cap])
    lab(10.3cm, 5.3cm, [Piles (foundation)])
    lab(6.6cm, 4.75cm, [River / obstacle])
    lab(2.4cm, 3.5cm, [Abutment footing])
    lab(13.0cm, 4.4cm, [Embankment])
    // span dims
    place(dx: 1.75cm, dy: 6.05cm, line(length: 3.85cm, stroke: 0.5pt + muted))
    place(dx: 5.6cm, dy: 6.05cm, line(length: 4cm, stroke: 0.5pt + muted))
    place(dx: 9.6cm, dy: 6.05cm, line(length: 3.95cm, stroke: 0.5pt + muted))
    lab(3.2cm, 5.65cm, text(fill: muted)[Span 1])
    lab(7.2cm, 5.65cm, text(fill: muted)[Span 2 (main)])
    lab(11.2cm, 5.65cm, text(fill: muted)[Span 3])
  }),
  caption: [Elevation of a three-span continuous girder bridge with the main components.],
)

#datatable(
  columns: (1.2fr, 3fr),
  header: ("Component", "Function and variants"),
  [*Superstructure / deck*], [Carries traffic and spans between supports: deck slab, main girders/beams/box, cross-girders/diaphragms, cantilevers, surfacing, waterproofing, footways, parapets/barriers, drainage, utilities ducts, lighting.],
  [*Bearings*], [Transfer loads from deck to substructure while allowing controlled movements (thermal, creep, shrinkage) and rotations. Types: *laminated elastomeric*, *pot* (fixed / guided / free sliding), *spherical*, *disc*, older *roller* and *rocker*. Each is *fixed*, *guided* (moves in one direction) or *free* (moves in both). The bearing layout is a key design decision.],
  [*Expansion joints*], [Close the gap at deck ends: buried joint, asphaltic plug, elastomeric/compression seal, nosing joint, finger plate, modular joint (large movements, e.g. > 150 mm). A notorious maintenance item, which is why integral bridges exist.],
  [*Substructure: piers*], [Intermediate supports: single column, multi-column/portal frame, wall pier, hammerhead, V- or Y-shaped. Crossheads (pier caps) carry bearings.],
  [*Substructure: abutments*], [End supports that also retain the embankment: full-height, bank seat, spill-through, reinforced-earth, *integral* (deck built into abutment, no bearings/joints), *semi-integral*. Wing walls retain the embankment sideways.],
  [*Foundations*], [Spread footings on good ground, or *piles* (driven precast/steel, bored cast in situ, CFA) with pile caps; caissons or cofferdams in water.],
  [*Approach slab / transition*], [Smooths the transition between embankment (which settles) and the rigid bridge.],
  [*Ancillaries*], [Drainage (gullies, downpipes), inspection access (walkways, gantries), lighting, signage gantries, utilities, scour protection, ship impact protection, noise barriers, cathodic protection, monitoring sensors.],
)

=== How bridges are classified

#datatable(
  columns: (1fr, 3fr),
  header: ("Criterion", "Categories"),
  [Use], [Road (highway) bridge, rail bridge (heavy rail, high-speed, metro/LRT), footbridge/cycle bridge, combined, aqueduct/canal bridge, utility/pipe bridge, wildlife (green) bridge.],
  [Relation to the network], [*Overbridge* (carries a road over the scheme), *underbridge* (carries the scheme over something), *viaduct* (long, multi-span, usually over a valley or urban area), *flyover*, *culvert* (closed small structure below fill).],
  [Structural system], [Slab, beam/girder, box girder, frame/portal, arch, truss, cable-stayed, extradosed, suspension, movable.],
  [Material], [Reinforced concrete (RC), prestressed concrete (PSC: pre-tensioned or post-tensioned), steel, steel–concrete composite, timber, masonry (historic), FRP (fibre-reinforced polymer, footbridges).],
  [Continuity], [Simply supported spans; continuous; continuous for live load (precast beams made continuous by in-situ diaphragms); integral; semi-integral.],
  [Deck position], [*Deck* type (traffic on top), *through* (traffic between main girders/trusses, common for rail to minimise construction depth), *half-through* (U-frame).],
  [Plan geometry], [Straight square, *skewed* (supports not perpendicular), *curved* in plan, varying width (slip roads joining).],
)

=== The main structural types

==== Slab bridges

Solid or *voided* reinforced/prestressed concrete slabs. Simple, low construction depth, quick to build on falsework or with precast inverted-T beams filled in situ. Very common for overbridges and underbridges with spans up to about 20–25 m. Skew is handled easily.

==== Beam (girder) bridges

The workhorse of highway and rail networks.

- *Precast prestressed concrete beams* (I-beams, Y-beams, bulb-tees, U-beams, box beams) with an in-situ deck slab. Lifted in by crane, so there is little disruption to the road or railway below. Typical spans 15–45 m (up to ~50 m+ for large bulb-tees).
- *Steel–concrete composite plate girders*: steel I-girders with shear studs and a concrete deck slab. Light to erect, good for continuous spans 30–100 m, very common for motorway overbridges and rail underbridges.
- *Ladder decks*: two main girders + cross-girders, efficient for wide composite decks.

==== Box girder bridges

Closed cross-section (concrete or steel) with high *torsional stiffness*, therefore good for curved alignments and long spans. Concrete boxes are built in situ on falsework, by *balanced cantilever*, by *incremental launching* or as *precast segments*. Typical spans 40–250 m. Variable depth (haunched) is used for long spans.

==== Frames and portals

The deck is monolithic with the supports. *Box culverts* and *portal frames* for underpasses (5–20 m), *integral* overbridges, and the elegant *V-pier* and *strut frame* bridges for longer spans.

==== Arch bridges

Load is carried mainly in compression to the abutments, which must resist large horizontal thrust (good rock, or a *tied arch* in which the deck acts as a tie). Masonry arches make up a large share of old rail networks. Modern arches in concrete, steel or concrete-filled steel tube range from 40 m to more than 500 m.

==== Truss bridges

Triangulated steel frameworks: through-truss rail bridges and long-span cantilever trusses. Efficient in material but labour-intensive to fabricate and maintain (many joints to inspect and paint).

==== Cable-stayed bridges

Deck supported by straight cables from one or more *pylons*. Harp, fan or semi-fan arrangements. Built by balanced cantilever from the pylons. Typical main spans 150–1,100 m. Design involves cable force optimisation, construction-stage analysis, aerodynamics and cable vibration.

==== Extradosed bridges

A hybrid between a box girder and a cable-stayed bridge: short pylons, shallow-angle cables acting like external prestress. Spans 100–275 m. Popular for high-speed rail, where stiffness requirements are strict.

==== Suspension bridges

Deck hung from vertical hangers on main cables anchored in massive anchorages. Used for the longest spans (500–2,000+ m; the 1915 Çanakkale Bridge has a 2,023 m main span). A highly specialist field.

==== Movable bridges

Bascule, swing, vertical lift and other types, used where navigation clearance is needed and fixed approaches would be too long. Mechanical and electrical (M&E) systems dominate their design and BIM.

=== Span ranges at a glance

#figure(
  {
    set text(font: heading-font, size: 7.4pt)
    let types = (
      ("RC / PSC slab", 5, 25, accent),
      ("Precast PSC beams", 15, 50, accent),
      ("Composite plate girder", 25, 120, warn),
      ("Concrete box girder", 40, 250, accent),
      ("Steel box girder", 50, 300, warn),
      ("Arch", 40, 600, good),
      ("Truss", 40, 550, warn),
      ("Extradosed", 100, 280, tool),
      ("Cable-stayed", 150, 1100, tool),
      ("Suspension", 500, 2100, tool),
    )
    let w = 11cm
    let scale(v) = calc.log(v) / calc.log(2500) * w
    grid(columns: (3.2cm, w), row-gutter: 3.5pt,
      ..types.map(((n, a, b, c)) => (
        align(right + horizon, n + h(4pt)),
        box(width: w, height: 0.33cm, {
          place(dx: scale(a), rect(width: scale(b) - scale(a), height: 0.33cm, fill: c.lighten(40%), radius: 2pt))
          place(dx: scale(a) + 2pt, dy: 1pt, text(size: 6.5pt, fill: white, weight: "bold")[#a–#b m])
        }),
      )).flatten(),
      [], box(width: w, height: 0.5cm, {
        for v in (5, 10, 20, 50, 100, 200, 500, 1000, 2000) {
          place(dx: scale(v), line(length: 0.12cm, angle: 90deg, stroke: 0.5pt + muted))
          place(dx: scale(v) - 0.2cm, dy: 0.15cm, text(size: 6.5pt, fill: muted)[#v])
        }
      }),
    )
  },
  caption: [Typical economic main-span ranges (logarithmic scale, metres). Rough guidance only: the record spans of each type lie beyond these bars.],
)

=== How a bridge type is chosen

The *options study* (feasibility stage) compares types against:

- *Span and clearance*: obstacle width, navigation/road/rail clearance envelopes, flood levels and freeboard.
- *Construction depth*: available depth between the road profile and the clearance below. This is often the decisive constraint in rail and urban schemes.
- *Ground conditions*: arches need good ground; poor ground favours light superstructures and statically determinate systems.
- *Construction method and traffic disruption*: over live motorways and railways, precast beams or steel lifted in during short *possessions* or night closures, or bridges built alongside and *slid or rolled in* with SPMTs.
- *Alignment geometry*: tight curves favour box girders or curved steel; skew affects slabs and abutments.
- *Durability and maintenance*: integral bridges remove bearings and joints, the two most maintenance-intensive components.
- *Cost, programme, carbon, aesthetics, and the client's standard designs* (many road agencies have standard beam and culvert ranges).

#builder[
  - The bridge object model should be *component-based* (deck, girders, piers, abutments, bearings, joints, foundations, parapets) with a *type* attribute at bridge level that maps to `IfcBridgeTypeEnum` and per part to `IfcBridgePartTypeEnum`.
  - Bearing *function* (fixed / guided / free + guiding direction) is safety-critical data. Store it explicitly, check that at least one bearing per expansion length is fixed longitudinally, and show it on the plan view.
  - Store span lengths, skew angles and support chainages as *derived, checkable values* from the alignment.
]

#keypoints[
  - Superstructure (deck) + bearings + substructure (piers, abutments) + foundations + joints + ancillaries.
  - The type is chosen by span, construction depth, ground, construction method, disruption, durability and cost.
  - Short/medium spans (most of the bridges on highway and rail projects): slabs, precast beams, composite girders, culverts and portals. Long spans: box girders, arches, trusses, cable-stayed, suspension.
]
