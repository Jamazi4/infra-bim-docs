#import "../template.typ": *

== Worked Example: The A99 Riverside Junction Overbridge

This chapter follows one *fictional* structure through the whole ISO 19650 process, so that the pieces from Parts I–IV appear together in context. Names, codes and numbers are invented but realistic.

#note(title: "The project")[
  *A99 Riverside Junction Improvement*: widening 4 km of a dual two-lane highway to dual three-lane and replacing an at-grade roundabout with a grade-separated junction. *Structure B01* is a new two-span overbridge carrying the local road (Mill Lane) over the widened A99 at chainage 2+460. The procurement is a two-stage design-and-build contract. *Client:* the regional road authority (appointing party). *Contractor:* “Northbridge JV” (lead appointed party). *Designers:* “ABC Consulting” (highways and structures), “GeoSite” (ground investigation and geotechnics), plus a specialist 4D consultancy.
]

=== Step 1: The client's requirements (§5.1)

*OIR (excerpt).* “Report the condition and load capacity of all structures to the national bridge inventory annually.” “Reduce whole-life maintenance cost of structures; avoid expansion joints where practicable.” “Reduce embodied carbon by 30 % against the 2020 baseline.”

*AIR (excerpt).* For every structure, the asset system needs: structure ID, type, span lengths, skew, materials, design codes, design loads, headroom, bearing/joint details (type, manufacturer, replacement method), waterproofing system, as-built drawings, inspection access arrangements, and principal inspection baseline data.

*PIR as plain-language questions.*
- Stage 3 (preliminary design): “Which junction layout and structure form give the best value and least disruption?”
- Stage 4 (statutory processes): “What land is needed, and what will the public see during construction?”
- Stage 5 (detailed design): “Is the design complete, coordinated and safe to build, operate and maintain?”
- Stage 6 (construction): “Are we on programme, and is the asset being built as designed?”

*Project information standard:* UK NA naming; Uniclass 2015; CRS = national grid + height datum; IFC 4.3 for all models; project property set `RJI_Common` with `AssetID`, `StructureID`, `ChainageFrom`, `ChainageTo`, `ActivityID`.

=== Step 2: The EIR in the tender pack (§5.2)

#datatable(
  columns: (0.5fr, 1.3fr, 3fr),
  header: ("Ref", "Topic", "Requirement (excerpt)"),
  [E-3.1], [Use cases], [U-01 existing conditions model; U-02 design authoring; U-03 coordination & clash; U-04 design review; U-05 quantity take-off; U-06 drawing generation; *U-07 4D sequencing & TM phasing*; U-08 asset information handover.],
  [E-4.2], [LOIN], [Per object and milestone in Appendix C (LOIN matrix) + IDS files `RJI_LOIN_M4.ids`, `RJI_LOIN_M6.ids`.],
  [E-5.1], [Milestones], [M3 preliminary design; M4 detailed design (AIP-compliant); M5 issued for construction; M6 as-built/handover.],
  [E-6.3], [Acceptance], [Containers accepted when: name and metadata valid; IFC passes the IDS for the milestone; zero hard clashes > 25 mm between disciplines (except agreed); drawings consistent with models (sampled).],
  [E-7.4], [4D], [As in Chapter 19 example clause; closure rehearsals for each full A99 closure.],
  [E-9.1], [Security], [Sensitivity assessment: structural details of B01 are not sensitive; utilities data under the junction are “restricted”.],
)

=== Step 3: The tender response (§5.3)

The Northbridge JV bid team writes a *pre-appointment BEP* (28 pages). Highlights:

- *Federation strategy:* volumes = `S01–S04` (1 km chainage sections, 20 m overlaps), `B01` (structure), `J01` (junction), `DR` (drainage network), `UT` (utilities); one model per discipline per volume.
- *High-level responsibility matrix:* as in Chapter 3; B01 approach slabs assigned to *structures*, the earthworks behind wing walls to *highways*.
- *Software:* Civil 3D (alignment, corridor, drainage), Allplan Bridge (B01 geometry + analysis), LUSAS (independent check), Navisworks (federation), Synchro 4D (4D), P6 (programme), CDE provided by the client.
- *Risk register (excerpt):*

#datatable(
  columns: (0.4fr, 2.4fr, 0.6fr, 2fr),
  header: ("ID", "Risk", "Rating", "Mitigation"),
  [R-04], [IFC 4.3 export from bridge tool loses linear placement and bearing types.], [High], [Mobilisation test on B01 pilot; fallback: station/offset as properties; IDS self-check.],
  [R-07], [Alignment changes after B01 GA is fixed.], [High], [Alignment freeze at M3+4 weeks; change control with impact list of dependent structures.],
  [R-11], [Programme activity IDs change between revisions, breaking 4D links.], [Med], [ID rules agreed with planning; link table QA every update.],
  [R-12], [Ground investigation results late for pier foundation design.], [Med], [Early GI package; design pile options in parallel.],
)

=== Step 4: Appointment (§5.4)

After award, the post-appointment BEP (96 pages + appendices) is agreed within six weeks. ABC's structures task team writes its *TIDP*. Extract for B01:

#figure(
  {
    set text(size: 7.2pt)
    datatable(
      columns: (2.5fr, 2.1fr, 0.8fr, 0.6fr, 0.9fr),
      header: ("Container", "Title", "Milestone", "LOIN", "Due"),
      [`RJI-ABC-B01-ZZ-RP-S-0001`], [B01 Approval in Principle], [M3], [–], [2027-02-01],
      [`RJI-ABC-B01-ZZ-M3-S-0001`], [B01 structural model], [M4], [D2], [2027-05-14],
      [`RJI-ABC-B01-ZZ-DR-S-0100`], [B01 general arrangement], [M4], [D2], [2027-05-21],
      [`RJI-ABC-B01-ZZ-DR-S-0110`], [B01 setting-out], [M5], [D3], [2027-07-02],
      [`RJI-ABC-B01-ZZ-SH-S-0001`], [B01 bearing schedule], [M5], [D3], [2027-07-02],
      [`RJI-ABC-B01-ZZ-CA-S-0001`], [B01 design calculations], [M5], [–], [2027-06-25],
      [`RJI-ABC-B01-ZZ-DR-S-0300`…`0340`], [B01 reinforcement (pier, abutments, diaphragms)], [M5], [D3], [2027-07-16],
    )
  },
  kind: table,
  caption: [TIDP extract for structure B01.],
)

=== Step 5: Mobilisation (§5.5)

The information management team runs a *pilot exchange* of B01 through the full chain:

#datatable(
  columns: (1.6fr, 2.6fr, 0.6fr),
  header: ("Test", "Result", "OK?"),
  [Civil 3D alignment → Allplan Bridge (LandXML)], [Chainages and levels identical at 10 m intervals (< 1 mm).], [✓],
  [Allplan Bridge → IFC 4.3 → Navisworks], [Geometry OK; bearings exported as `IfcBearing`; `RJI_Common` populated; linear placement exported but not read by federation tool.], [◐],
  [IFC → IDS check (M4)], [3 failures: `StructureID` missing on parapets, so the template was fixed.], [✓],
  [P6 → Synchro, link by `ActivityID`], [97 % auto-linked; 3 % temporary objects need manual links.], [✓],
  [CDE naming validation], [Code list missing volume `UT`; added to information standard via change request.], [✓],
)

=== Step 6: Design and production (§5.6)

*The bridge.* Options at M3 compared (a) a single-span portal frame (no central pier; 42 m span; deep, costly), (b) a two-span integral bridge with a central pier in the A99 central reserve, and (c) a conventional two-span bridge on bearings with expansion joints at both abutments. Option (b) was chosen: *two spans of 21 m*, *precast prestressed concrete beams* made continuous with an in-situ deck, *integral abutments on bored piles* (no joints, no bearings at the abutments, consistent with the OIR on maintenance), and a *central pier wall* on a piled cap carrying the beams on *elastomeric bearings*, with the deck made continuous over the pier by an in-situ diaphragm. Skew 12°. Headroom 5.30 m + allowance for resurfacing.

The *AIP* records: design to Eurocodes + National Annex and DMRB CD 350; loads LM1, LM3 special vehicles per NA, footway loads, accidental pier impact loads (central reserve); integral abutment soil–structure interaction; design life 120 years; Category 2 check.

*Analysis:* grillage in Allplan Bridge for the deck with construction stages (beams simply supported for self-weight and wet slab, then continuous composite deck); soil springs for integral abutments; independent Category 2 check in LUSAS.

*Coordination:* weekly federation; key clashes found: (1) drainage carrier pipe through the pier footing, re-routed; (2) A99 widening's *temporary barrier* in phase 2 clashes with pier pile cap excavation, so a *4D finding* changed the TM layout.

=== Step 7: The 4D model in action

The 4D consultancy links the B01 model (segmented into piles, pile caps, pier wall lifts, abutment lifts, beams 1–14, deck pours 1–3, parapets, surfacing) with the Level 4 programme. The *beam lift* requires a full overnight closure of the A99. A Level 5 rehearsal is produced:

#datatable(
  columns: (0.9fr, 3fr),
  header: ("Time (Sat → Sun)", "Activity"),
  [20:00–22:00], [Install TM for full closure; diversion via junction slip roads.],
  [22:00–23:30], [Set up 500 t mobile crane on prepared platform in the central reserve (outriggers on mats).],
  [23:30–04:30], [Lift 14 beams (span 1 then span 2), ~20 min per beam; lateral bracing installed.],
  [04:30–05:30], [Crane de-rig; inspection of beam seating.],
  [05:30–06:00], [Remove TM; reopen A99 (handback deadline 06:00).],
)

The rehearsal shows that beams 13–14 cannot be lifted from the planned crane position (radius exceeded with the counterweight configuration). The crane is repositioned in the plan *before* the closure is booked. This is the kind of finding that justifies 4D.

=== Step 8: Delivery and acceptance (§5.7): one container's life

#figure(
  {
    set text(font: heading-font, size: 7.2pt)
    let st(t, d, c) = rect(width: 100%, inset: 4pt, radius: 3pt, fill: c.lighten(82%), stroke: 0.8pt + c, align(center)[*#t* \ #d])
    grid(columns: 7, column-gutter: 3pt,
      st("P01.03 · S0", [WIP; authoring], accent),
      st("P01 · S1", [shared for coordination], warn),
      st("P02 · S3", [for review & comment (client)], warn),
      st("P03 · S4", [for stage approval at M4], warn),
      st("C01 · A4", [accepted (M4)], good),
      st("C02 · A5", [issued for construction (M5)], good),
      st("C03 · CR", [as-constructed record (M6)], tool),
    )
  },
  caption: [The life of `RJI-ABC-B01-ZZ-DR-S-0100` (B01 GA). Here the client mapped the A-codes to stage numbers (A4 = Stage 4 etc.).],
)

At each transition, the CDE logs who checked, reviewed, authorised and accepted. At P02 · S3 the client commented that the headroom annotation did not include the resurfacing allowance. The drawing went back to WIP and returned as P03.

=== Step 9: Construction, as-built and handover (§5.8 and ISO 19650-3)

During construction, the contractor updates B01 with as-built survey data, pile records (actual toe levels), concrete pour records, beam supplier data, waterproofing and parapet product data. At M6:

- the B01 IFC model passes `RJI_LOIN_M6.ids` (as-built properties present);
- drawings are reissued as *CR*;
- the asset data (AIR) is imported into the client's asset management system and the bridge inventory;
- the H&S file and the inspection & maintenance manual are delivered and linked to the model objects;
- lessons learned are recorded: “alignment freeze 4 weeks after M3 was too early; freeze at AIP instead”, “define construction segmentation in LOIN from the start”.

#keypoints[
  - Every document in Part I appears in a real sequence: OIR/AIR/PIR → EIR → pre-BEP & risks → post-BEP, TIDP/MIDP → mobilisation tests → production → acceptance → handover.
  - Engineering decisions (integral abutments, precast beams) trace back to *organisational* requirements (low maintenance).
  - 4D pays for itself by finding real problems (crane radius, TM clash) before they happen on site.
]
