#import "../template.typ": *

== The CDE, Naming and the Level of Information Need

=== The Common Data Environment

ISO 19650-1 defines the CDE as an *agreed source of information* for a project or asset, used to collect, manage and disseminate each information container through a *managed process*. Note: the CDE is a *workflow plus a technology solution*. A SharePoint site with folders is not a CDE unless the states, metadata and approvals are enforced. This chapter covers the CDE states, codes and naming. Chapter 5 covers the CDE in depth: the ISO requirements, set-ups, technology, interoperability, auditing and handover.

#figure(
  {
    set text(font: heading-font, size: 8pt)
    let st(t, s, c) = rect(width: 100%, height: 2.2cm, inset: 6pt, radius: 4pt, fill: c.lighten(82%), stroke: 1pt + c,
      align(center + horizon)[#text(size: 10pt, weight: "bold", fill: c)[#t] \ #v(1pt) #s])
    let ar(t) = align(center + horizon, text(size: 7pt, fill: muted)[#t \ #text(size: 13pt)[→]])
    grid(columns: (1fr, 0.55fr, 1fr, 0.55fr, 1fr, 0.55fr, 1fr), column-gutter: 2pt,
      st("WIP", [Work in progress \ visible to the task team only \ S0], accent),
      ar[check, review, approve],
      st("SHARED", [visible to the delivery / project team \ S1 – S4], warn),
      ar[authorise, then accept],
      st("PUBLISHED", [contractual, for use by others / construction \ A1… , B1…, CR], good),
      ar[superseded or close-out],
      st("ARCHIVE", [journal of all transactions; history & audit trail], muted),
    )
  },
  caption: [The four CDE states (ISO 19650-1 §12). Information can be returned from Shared to WIP when review fails, and Published information is revised by starting a new WIP revision.],
)

==== Status (suitability) codes — UK National Annex

The UK National Annex to ISO 19650-2 (Table NA.1) defines status codes that say *what the information may be used for*. They are used far beyond the UK. Many clients modify them, so always check the project's own list.

#datatable(
  columns: (0.6fr, 0.8fr, 3fr),
  header: ("Code", "State", "Meaning / permitted use"),
  [S0], [WIP], [Initial status, work in progress. Not shared.],
  [S1], [Shared], [Suitable for *coordination* (e.g. models shared for federation and clash detection).],
  [S2], [Shared], [Suitable for *information* (reference only).],
  [S3], [Shared], [Suitable for *review and comment*.],
  [S4], [Shared], [Suitable for *stage approval* (submitted to the appointing party for review/authorisation).],
  [A1, A2, A3 …], [Published], [*Authorised and accepted*: contractual. The number usually maps to the stage or milestone (e.g. A1 for stage 1).],
  [B1, B2, B3 …], [Published], [Partially authorised and accepted *with comments* (accepted, but comments must be addressed in the next revision).],
  [CR], [Published], [*As constructed record*, for the asset information model.],
)

#note(title: "Older code lists")[
  Projects that started under BS 1192 / PAS 1192 also use S5 (withdrawn), S6 (suitable for PIM authorisation), S7 (suitable for AIM authorisation) and D1–D4 (for costing, tender, contractor design, manufacture). If you build software, keep code lists *data-driven*.
]

==== Revision codes

The UK NA revision scheme separates preliminary (P) and contractual (C) revisions:

- *P01, P02 …*: preliminary revisions while in Shared (non-contractual). Minor WIP versions are often *P01.01, P01.02 …* and revert to a whole number when shared.
- *C01, C02 …*: contractual revisions once Published (accepted).

==== Container naming (UK National Annex convention)

`Project – Originator – Volume/System – Level/Location – Type – Role – Number`

#datatable(
  columns: (1fr, 1.2fr, 2.6fr),
  header: ("Field", "Example", "Notes for infrastructure"),
  [Project], [`A99R`], [2–6 characters, fixed per project.],
  [Originator], [`ABC`], [Organisation code of the author (from a list in the BEP).],
  [Volume / System], [`B01`, `S03`, `ZZ`], [Spatial or functional breakdown. On linear projects: *structure ID*, *section by chainage* (e.g. S03 = Ch 2+000–4+000), or system (drainage network). ZZ = multiple, XX = none.],
  [Level / Location], [`ZZ`, `P1`, `XX`], [For buildings, the storey. For infrastructure, often the *location within a section* (pier/span, junction, side of road) or simply ZZ/XX.],
  [Type], [`M3`, `DR`, `CA`, `SH`, `RP`, `SP`, `VS`], [M3 = 3D model, M2 = 2D model, DR = drawing, CA = calculations, SH = schedule, RP = report, SP = specification, VS = visualisation, CM = combined/federated model, CR = clash rendition, etc.],
  [Role], [`S`, `C`, `H`, `D`, `G`], [Discipline. UK NA examples: A architect, C civil engineer, S structural engineer, B building surveyor, D drainage/highways engineer, G geographical & land surveyor, K client, W contractor, X subcontractor, Y specialist, Z general (non-disciplinary). Infra clients often add their own codes (e.g. for rail, track, OLE, signalling); note that H in the NA list is the heating & ventilation designer, not highways.],
  [Number], [`0001`], [Sequential, 4–6 digits.],
)

Status and revision are *metadata* attributes of the container in the CDE. They are *not* part of the file name, because renaming a file on each status change breaks references.

=== Level of Information Need (LOIN)

==== Why LOD was replaced

“LOD” meant different things in different countries: Level of *Detail* (geometry only) or Level of *Development* (geometry + reliability), on scales of 100–500, 1–7 or A–E. It mixed up how detailed the geometry is with how *reliable* it is and which data it carries. It was also usually applied to *whole models* (“the model is LOD 300”), which is meaningless, because a model at a given milestone always contains elements of very different maturity.

LOIN (EN 17412-1:2020, now ISO 7817-1:2024) fixes this with a simple rule: *for every purpose, at every milestone, for every object, say exactly what geometry, data and documents you need, and no more.* The principle is *“the minimum information to answer the purpose”*. Anything beyond that is waste.

==== The LOIN framework

#figure(
  {
    set text(font: heading-font, size: 8pt)
    let bx(t, c) = rect(width: 100%, inset: 6pt, radius: 3pt, fill: c.lighten(85%), stroke: 0.8pt + c, align(center + horizon, t))
    grid(columns: (1fr, 1fr, 1fr, 1fr), column-gutter: 5pt, row-gutter: 6pt,
      bx([*Purpose* \ why (use case)], accent), bx([*Milestone* \ when], accent), bx([*Actors* \ who provides / receives], accent), bx([*Object* \ what (breakdown)], accent),
      grid.cell(colspan: 4, align(center, text(size: 12pt, fill: muted)[↓ defines ↓])),
      bx([*Geometrical information* \ detail · dimensionality · location · appearance · parametric behaviour], good),
      bx([*Alphanumerical information* \ identification (name, type, classification) · information content (properties, units, values)], warn),
      bx([*Documentation* \ documents linked to the object (data sheets, certificates, test reports, drawings)], tool),
      bx([*Expressed as* \ spreadsheet tables (ISO 7817-2 templates) · IDS · data templates (ISO 23387)], muted),
    )
  },
  caption: [LOIN: context (top) determines the requirement (bottom).],
)

==== Geometry facets

#datatable(
  columns: (1fr, 3fr),
  header: ("Facet", "Example for a bridge pier at detailed design"),
  [Detail], [Column, crosshead and pile cap modelled with true section shapes, chamfers, bearing plinths; no reinforcement.],
  [Dimensionality], [3D solid.],
  [Location], [Absolute, in project CRS; placed relative to the alignment (station + offset) and at design levels.],
  [Appearance], [Material colour by concrete class; not photo-realistic.],
  [Parametric behaviour], [Not required for exchange (static IFC geometry is enough); native model may be parametric.],
)

==== Example LOIN table for infrastructure objects

#figure(
  {
    set text(size: 7.6pt)
    datatable(
      columns: (1fr, 0.8fr, 1.6fr, 2.1fr, 1.3fr),
      header: ("Object", "Milestone", "Geometry", "Alphanumeric (examples)", "Documentation"),
      [Road pavement], [Prelim. design], [Corridor surface + layer boundaries as 3D surfaces or solids, per carriageway], [Classification; layer type (surface/binder/base/sub-base); nominal thickness], [Pavement design report],
      [Road pavement], [Detailed design], [Solids per layer per section, with crossfall & superelevation], [+ material spec. ref, thickness, design traffic (msa), construction section ID], [Pavement specification, typical cross sections],
      [Road pavement], [As-built], [Solids from as-built survey], [+ actual material, supplier, layer date, test results ref], [Test certificates, as-built cross sections],
      [Bridge bearing], [Prelim. design], [Not required (location point)], [Bearing type (fixed / guided / free)], [–],
      [Bridge bearing], [Detailed design], [Bounding solid at true location & orientation], [Type, vertical/horizontal design loads, movements, rotation capacity, bearing ID], [Bearing schedule],
      [Bridge bearing], [As-built], [Manufacturer solid], [+ manufacturer, product ref, serial no., installation date, preset values, replacement method], [Data sheet, installation record, maintenance manual],
      [Rail track], [Detailed design], [Track centreline (alignment) + rail/sleeper/ballast solids per section], [Rail profile (e.g. 60E1), sleeper type, track gauge, cant, design speed], [Track design report],
      [Drainage manhole], [Detailed design], [Solid (chamber, cover) at true location], [ID, cover level, invert levels, diameter, material, cover class (e.g. D400)], [Drainage schedule],
    )
  },
  kind: table,
  caption: [Illustrative LOIN entries (simplified).],
)

==== From LOIN table to automated check: IDS

The buildingSMART *Information Delivery Specification* turns the alphanumeric part of LOIN into an XML file that checking software can run against an IFC model. A simplified rule for the bearing above:

```xml
<ids:specification name="Bearings at detailed design" ifcVersion="IFC4X3_ADD2">
  <ids:applicability>
    <ids:entity><ids:name><ids:simpleValue>IFCBEARING</ids:simpleValue></ids:name></ids:entity>
  </ids:applicability>
  <ids:requirements>
    <ids:attribute><ids:name><ids:simpleValue>PredefinedType</ids:simpleValue></ids:name></ids:attribute>
    <ids:property dataType="IFCFORCEMEASURE">
      <ids:propertySet><ids:simpleValue>Pset_BearingCommon</ids:simpleValue></ids:propertySet>
      <ids:baseName><ids:simpleValue>VerticalStiffness</ids:simpleValue></ids:baseName>
    </ids:property>
    <ids:property>
      <ids:propertySet><ids:simpleValue>PRJ_Identification</ids:simpleValue></ids:propertySet>
      <ids:baseName><ids:simpleValue>AssetID</ids:simpleValue></ids:baseName>
    </ids:property>
  </ids:requirements>
</ids:specification>
```

#note[
  The example is illustrative: check property names against the IFC 4.3 documentation (`ifc43-docs.standards.buildingsmart.org`) or your client's dictionary. Many projects define their own property sets (prefix such as `PRJ_` or the client's code) where the standard `Pset_` sets do not cover asset-management needs.
]

==== LOD ↔ LOIN: rough translation

You will still meet LOD scales, especially in US and Middle East documents. A rough mapping helps when translating old requirements:

#datatable(
  columns: (0.9fr, 1.7fr, 2.5fr),
  header: ("BIMForum LOD", "Typical stage", "Equivalent LOIN thinking"),
  [100], [Concept / feasibility], [Symbol or massing; key parameters only (span, width).],
  [200], [Preliminary design], [Generic solids with approximate size and location; type information.],
  [300], [Detailed design], [Specific solids with true size, shape, location; design properties.],
  [350], [Coordination / IFC design], [+ interfaces, connections, embedded items (ducts, drainage through structure).],
  [400], [Fabrication / construction], [Fabrication detail: reinforcement, tendons, steel connections.],
  [500], [As-built (field verified)], [In BIMForum, LOD 500 is about *field verification*, not more detail. In LOIN terms: as-built geometry + installed product data + documents.],
)

#builder[
  - Store LOIN as structured data: *(purpose, milestone, actor, object type) → (geometry facets, property requirements, document requirements)*. Then generate the spreadsheet *and* the IDS from the same source.
  - Run IDS checks on upload to Shared; show the result to the author *before* the reviewer sees the container.
  - Track LOIN *per object instance*, not per file: a single bridge model will hold piers at detailed design and a deck still at preliminary design.
  - Validate *container names* against the naming convention and code lists; keep status/revision in metadata, not the file name.
]

#keypoints[
  - CDE = states (WIP → Shared → Published → Archive) + metadata + approvals + audit trail.
  - Status codes say *what you may use it for*; revisions say *which version*; neither belongs in the file name.
  - LOIN = minimum geometry + data + documentation *for a purpose at a milestone*. It replaces LOD and can be automated with IDS.
]
