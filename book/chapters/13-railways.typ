#import "../template.typ": *

== Railways

A railway is a *system of systems*. The civil and track model you know well is only one layer. Electrification, signalling, telecoms, power and stations all depend on it, and many of the hardest coordination problems sit at those interfaces.

=== Railway types and the system breakdown

Heavy rail (mixed traffic), high-speed rail (≥ 250 km/h new lines), freight lines, metro (segregated, high frequency), light rail and tram (often street-running). Each is broken down into subsystems, which in the EU match the *TSI* (Technical Specifications for Interoperability) subsystems:

#datatable(
  columns: (1.2fr, 3fr),
  header: ("Subsystem", "Content"),
  [*Infrastructure (INF)*], [Alignment, track, earthworks, structures, tunnels, drainage, stations/platforms, level crossings, fencing.],
  [*Energy (ENE)*], [Traction power supply: substations, *overhead line equipment (OLE / catenary)* or third/fourth rail, return current, earthing and bonding.],
  [*Control-command and signalling (CCS)*], [Interlockings, signals, train detection (track circuits, axle counters), train protection and control (ETCS/ERTMS levels, national systems, CBTC on metros), point machines, level crossing control, telecoms (GSM-R → FRMCS).],
  [*Rolling stock*, *Operations*], [Not designed by the infrastructure team, but they define gauges, axle loads, platform interface, speeds and performance.],
)

#figure(
  box(width: 100%, height: 5.4cm, {
    let c = ink
    let lab(x, y, t) = place(dx: x, dy: y, text(font: heading-font, size: 7pt, fill: accent)[#t])
    // formation
    place(curve(stroke: 0.8pt + rgb("#8a6d3b"), fill: rgb("#efe6d6"),
      curve.move((0.5cm, 5.2cm)), curve.line((3cm, 3.8cm)), curve.line((12cm, 3.8cm)), curve.line((14.5cm, 5.2cm)), curve.close()))
    // sub-ballast
    place(curve(stroke: 0.6pt + c, fill: rgb("#d9cdb3"),
      curve.move((3cm, 3.8cm)), curve.line((3.6cm, 3.45cm)), curve.line((11.4cm, 3.45cm)), curve.line((12cm, 3.8cm)), curve.close()))
    // ballast
    place(curve(stroke: 0.6pt + c, fill: rgb("#a9a9a9"),
      curve.move((3.6cm, 3.45cm)), curve.line((4.6cm, 2.75cm)), curve.line((10.4cm, 2.75cm)), curve.line((11.4cm, 3.45cm)), curve.close()))
    // sleeper
    place(dx: 4.8cm, dy: 2.55cm, rect(width: 5.4cm, height: 0.25cm, fill: rgb("#7d8790"), stroke: 0.6pt + c))
    // rails
    for x in (5.8cm, 9.0cm) { place(dx: x, dy: 2.25cm, rect(width: 0.2cm, height: 0.3cm, fill: c)) }
    // cess drain
    place(dx: 12.4cm, dy: 3.9cm, circle(radius: 0.18cm, fill: white, stroke: 0.8pt + accent))
    // OLE mast
    place(dx: 1.8cm, dy: 0.2cm, rect(width: 0.18cm, height: 4.3cm, fill: rgb("#8fa0b0"), stroke: 0.5pt + c))
    place(dx: 1.9cm, dy: 0.45cm, line(start: (0cm, 0cm), end: (5.8cm, 0cm), stroke: 1pt + c))
    place(dx: 1.9cm, dy: 0.95cm, line(start: (0cm, 0cm), end: (5.6cm, 0.15cm), stroke: 0.8pt + c))
    place(dx: 7.4cm, dy: 0.3cm, line(start: (0cm, 0cm), end: (0cm, 0.9cm), stroke: 0.5pt + c))
    place(dx: 7.3cm, dy: 1.15cm, circle(radius: 0.06cm, fill: warn))
    // kinematic envelope dashed
    place(dx: 5.1cm, dy: 0.9cm, rect(width: 4.8cm, height: 1.35cm, stroke: (paint: tool, thickness: 0.8pt, dash: "dashed")))
    // labels
    lab(10.8cm, 2.05cm, [Rail (e.g. 60E1)])
    lab(10.5cm, 2.6cm, [Sleeper + fastenings])
    lab(11.4cm, 3.05cm, [Ballast])
    lab(12.3cm, 3.45cm, [Sub-ballast])
    lab(12.75cm, 4.2cm, [Cess drain])
    lab(6.2cm, 4.3cm, [Formation / subgrade (earthworks)])
    lab(2.2cm, 0.0cm, [OLE mast + cantilever])
    lab(7.6cm, 0.45cm, [Catenary / dropper])
    lab(7.5cm, 1.1cm, text(fill: warn)[Contact wire])
    lab(5.2cm, 1.45cm, text(fill: tool)[Structure gauge / kinematic envelope])
    lab(0.1cm, 4.6cm, [Mast foundation])
  }),
  caption: [Simplified cross-section of a ballasted, electrified railway (single track).],
)

=== Track alignment design

Railway alignment is far less forgiving than road alignment: a train cannot steer, passengers feel lateral acceleration, and track geometry deteriorates under traffic.

#datatable(
  columns: (1.2fr, 3fr),
  header: ("Parameter", "Meaning and typical design logic"),
  [*Cant (superelevation)*], [Height difference between the rails on a curve, typically limited to about 150–180 mm (lower at platforms and on S&C).],
  [*Equilibrium cant*], [Cant at which centrifugal force is balanced for a given speed: E = 11.8 · V² / R (mm, km/h, m) for standard gauge.],
  [*Cant deficiency*], [Difference between equilibrium cant at the line speed and actual cant, i.e. uncompensated lateral acceleration. Limits depend on vehicle type (higher for approved tilting trains), track type and speed.],
  [*Cant excess*], [Relevant for slow (freight) trains on curves canted for fast passenger trains: wear on the low rail.],
  [*Transitions*], [Clothoid (or other curve types in some national standards: Bloss, cosine, cubic parabola), with lengths governed by the *rate of change of cant* and *rate of change of cant deficiency*.],
  [*Vertical alignment*], [Gradients (main lines typically ≤ 1–1.25 % with freight; high-speed passenger-only lines up to 3.5 %), vertical curves with large radii (circular in many rail standards).],
  [*Switches & crossings (S&C)*], [Turnouts, crossovers, diamonds; standard geometries per railway (e.g. by radius/angle). Alignment through S&C has its own limits and is no place for transitions or vertical curves.],
  [*Track centres & clearances*], [Track spacing, *structure gauge*, *kinematic envelope*, platform offsets and heights, electrical clearances to OLE.],
  [*Standards*], [EN 13803:2017 (track alignment design parameters, ≥ 1435 mm gauge, up to 360 km/h); TSI INF; national standards (Network Rail track design standards in the UK, DB Ril 800.0110 in Germany); AREMA Manual (North America).],
)

#warning(title: "Railway linear referencing")[
  Railways have their own location systems: in the UK, *Engineer's Line Reference (ELR) + miles and chains/yards*; in Germany, *Strecke + km*; elsewhere, line + kilometre post. Asset registers, possession plans and signalling data use these, not project coordinates or design chainage. A railway BIM model must map between *design chainage* and the *operational linear reference*. In IFC 4.3 this can be expressed with `IfcReferent` objects carrying the operational reference.
]

=== Track structure

- *Rails* (e.g. 60E1 / UIC 60, 56E1, 54E1; continuous welded rail with stress-free temperature management).
- *Sleepers/ties* (concrete monoblock or twin-block, timber, steel), *fastenings*, rail pads.
- *Ballasted track* (ballast depth typically 250–350 mm under sleeper) on *sub-ballast* and formation. Or *slab track* (concrete slab or embedded rail), common on high-speed lines, in tunnels and on viaducts: higher initial cost, less maintenance, stricter geometry and settlement limits.
- *Transition zones* between ballast and slab, or between embankment and bridge (stiffness transitions).
- *Track drainage* (cess drains, track drains, catchpits). Poor drainage is the main cause of track geometry failure.

=== Electrification (OLE)

Key concepts you will see in OLE models and drawings: *masts/structures* and their foundations (piles, often hundreds per km), *portals* and *headspans* for multiple tracks, *cantilevers*, *catenary* and *contact wire*, *droppers*, *registration* and *stagger* (zig-zag of the contact wire to spread pantograph wear), *contact wire height*, *tension lengths* with balance weights, *neutral sections*, *section insulators*, *earthing and bonding*. Systems: 25 kV 50 Hz AC (most new lines), 15 kV 16.7 Hz AC (Germany, Austria, Switzerland, Sweden, Norway), 1.5/3 kV DC, 750 V DC third rail.

OLE design is *rule-based*: span lengths depend on curve radius and wind, stagger depends on curve and span, wire heights must clear the structure gauge and bridges. Modern tools automate it: Bentley/Siemens *OpenRail Overhead Line Designer* (with Sicat Master functionality), Furrer+Frey *ELFF* with its BIM module, *Lineardraft*.

=== Signalling and train control

Signalling design produces *scheme plans* (track layout with signals, points, train detection sections, routes), *control tables* (interlocking logic), *signal sighting* analysis (can the driver see the signal for the required time? This is a 3D visibility problem), cable routes and equipment locations. Data standards: *railML 3* (infrastructure and interlocking), EULYNX (standardised signalling interfaces). Tools: RailCOMPLETE (AutoCAD-based, rule-based objects for signalling and other rail equipment), supplier-specific design tools, and the signalling modules of the rail design suites.

#tip(title: "Where rail BIM coordination really hurts")[
  OLE foundations vs drainage, cable troughs and signals; signal sighting obstructed by OLE structures or bridges; the kinematic envelope vs platform edges, bridges and tunnel linings; cable route capacity at under-track crossings; and earthing and bonding of every metallic structure near the OLE. These are 3D and data problems, ideal for BIM, and they are often still handled in 2D.
]

=== Design process, assurance and deliverables

Rail projects run inside the infrastructure manager's governance (UK Network Rail: GRIP, replaced by PACE; DB: Leistungsphasen per HOAI; elsewhere, owner-specific stage gates) and *safety assurance*: the Common Safety Method for risk evaluation (CSM-RA), independent assessment, and for interoperable lines *Notified Body (NoBo)* and *Designated Body (DeBo)* verification against the TSIs. Interdisciplinary design checks and reviews (IDC/IDR) are formal steps before design acceptance.

#datatable(
  columns: (1.2fr, 3fr),
  header: ("Discipline", "Typical deliverables"),
  [Track], [Track layout and alignment drawings (plan, longitudinal section, cant diagram), S&C layouts, track design data (setting-out and versine/geometry data for tamping machines), track construction details, transition zones.],
  [Civils], [Earthworks, drainage, structures, platforms, retaining walls, access points, fencing.],
  [OLE], [OLE layout plans, allocation/structure schedules, foundation schedules, wiring and cross-section drawings, electrical clearance assessments.],
  [Signalling], [Scheme plans, signal sighting forms, control tables, location area plans, cable routes, equipment schedules.],
  [Systems integration], [Gauging reports, interface registers, EMC, RAMS, hazard log.],
  [Construction], [Possession plans and staging, temporary works, access points, engineering trains.],
)

=== BIM and IFC 4.3 for railways

#datatable(
  columns: (1.2fr, 3fr),
  header: ("Object", "IFC 4.3 representation (typical)"),
  [Railway and parts], [`IfcRailway`; `IfcRailwayPart` with types such as TRACKSTRUCTURE, TRACKSTRUCTUREPART, LINESIDESTRUCTURE, LINESIDESTRUCTUREPART, DILATATIONSUPERSTRUCTURE, PLAINTRACKSUPERSTRUCTURE, TURNOUTSUPERSTRUCTURE…],
  [Alignment and cant], [`IfcAlignment` with `IfcAlignmentCant`; operational referencing via `IfcReferent`.],
  [Track], [`IfcRail`, `IfcTrackElement` (SLEEPER, …), `IfcCourse` (BALLASTBED), fastenings as `IfcMechanicalFastener` / `IfcDiscreteAccessory`.],
  [OLE], [Masts as `IfcColumn`/`IfcMember`, cantilevers and wires as `IfcMember`/`IfcCableSegment`, insulators and fittings as `IfcDiscreteAccessory`. Mappings still vary between tools.],
  [Signalling and telecoms], [`IfcSignal`, `IfcSensor` (axle counters), `IfcActuator` (point machines), `IfcCableSegment`, `IfcCableCarrierSegment`, `IfcCommunicationsAppliance`.],
)

=== Checklist: reviewing a railway model

#datatable(
  columns: (0.25fr, 3fr, 0.4fr),
  header: ("", "Check", "✓"),
  [1], [Cant, cant deficiency/excess and transition lengths within limits for the line speed(s) and vehicle types.], [☐],
  [2], [No vertical curves or transitions inside S&C; S&C geometry is the railway's approved standard design.], [☐],
  [3], [Structure gauge / kinematic envelope clear of bridges, platforms, OLE structures, signals and tunnel linings, including on curves (throw) and cant.], [☐],
  [4], [Platform heights and offsets per standard; stepping distances.], [☐],
  [5], [OLE: contact wire height and stagger within limits; clearances to bridges and structures; foundations clash-free with drainage, cables and utilities.], [☐],
  [6], [Signal positions and sighting distances; no obstructions in 3D.], [☐],
  [7], [Track drainage continuous with outfalls; formation falls.], [☐],
  [8], [Design chainage ↔ operational linear referencing (ELR/km) mapping present and correct.], [☐],
  [9], [Interfaces registered and owned (track–civils, OLE–structures, signalling–OLE, systems–stations).], [☐],
)

#builder[
  - Rail alignment rule engine: cant, cant deficiency/excess, rate of change, S&C exclusion zones, per national standard.
  - *Kinematic envelope sweeping* along the alignment with cant, and clash detection against all objects.
  - *Signal sighting* (driver's eye along the track) as a 3D visibility check.
  - Dual referencing: design chainage and operational line reference (ELR + mileage / Strecke + km).
  - Import/export railML for infrastructure and signalling data alongside IFC.
]

#keypoints[
  - Railways are systems of systems: infrastructure, energy, signalling and telecoms, all tied to the track alignment.
  - Track geometry is governed by cant, cant deficiency, transitions and S&C rules (EN 13803, TSI, national standards).
  - OLE and signalling are rule-driven 3D designs, increasingly done in dedicated BIM tools.
  - Gauging, clearances and linear referencing are where rail BIM delivers (or fails).
]
