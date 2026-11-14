#import "../template.typ": *
#set heading(numbering: none)

#heading(level: 2, numbering: none)[How to Use This Book]

This book is for a reader who has already spent years inside infrastructure BIM projects: modelling alignments, corridors, earthworks, drainage and track, federating models, and fighting with exports. You know what a model is. What you need are the parts of the picture that a modeller seldom owns:

- *Information management.* Why the documents around a project (EIR, BEP, TIDP, MIDP, LOIN) exist, what they must contain, who writes them, who signs them, and how they are used week by week rather than filed and forgotten.
- *Bridges.* Enough structural engineering to read a bridge model, drawing set or calculation package with judgement: the types, how they are built, how they are analysed, which software does what, and what the drawings and IFC model must show.
- *The other disciplines on a linear project.* Roads, railways, geotechnics and earthworks, drainage, utilities and tunnels: how each is designed, which standards and software it uses, what it delivers, and what to check in its models.
- *4D.* What a 4D deliverable actually is, what it must contain, which requirements govern it, and how to tell a good 4D model from a pretty video.

There is also a fourth thread: *you are building an infrastructure BIM software suite.* Most chapters therefore end with a purple *“For your software suite”* box that turns the theory into checkable functions, validation rules or data-model hints. Chapter 22 collects these into one checklist.

=== Reading paths

#datatable(
  columns: (1.3fr, 2.5fr),
  header: ("If you want to…", "Read"),
  [Understand ISO 19650 from end to end], [Chapters 1–5 in order, then the worked example (Ch. 21).],
  [Review or write a BEP next week], [Ch. 3 (documents), Ch. 4 (CDE basics, LOIN), Ch. 5 (CDE in depth), checklist §3.10.],
  [Learn bridges from zero], [Ch. 7 → 8 → 9 → 10 → 11. Ch. 9 is the heaviest, so skim it first and come back.],
  [Check a bridge model or drawing set], [Ch. 11 and the bridge checklists in Ch. 22.],
  [Brush up on roads, rail, geotechnics, drainage, utilities or tunnels], [Ch. 12–17. Each chapter stands alone and ends with a review checklist.],
  [Specify or check a 4D model], [Ch. 18–20; the deliverable contents list is in §19.4.],
  [Design software features], [The purple boxes, Ch. 6 (openBIM for infra) and Ch. 22.],
)

=== Conventions

- *Clause references* such as “ISO 19650-2 §5.4” refer to the 2018 edition of Part 2, the edition in force at the time of writing (a revision is in progress; see Chapter 1). Clause numbers are given so you can find the passage in your own copy. This book paraphrases. It does not reproduce the standards.
- *Numbers* (span ranges, load values, deflection limits) are typical values for orientation. Real projects use the governing code, its national annex and the client's own standards.
- *Regional terms.* The book mostly uses UK/European vocabulary (appointing party, Eurocodes, chainage) and gives US equivalents (owner, AASHTO, stationing) where they differ. Where German practice matters for infrastructure (AIA/BAP, BIM4INFRA, Masterplan BIM Bundesfernstraßen), it is mentioned.

#warning(title: "Standards move")[
  The BIM standards landscape changes every year. ISO 19650 Parts 1 and 2 are being revised, ISO 7817-1 replaced EN 17412-1 for Level of Information Need, the Eurocodes are moving to their second generation, and IFC 4.3 became ISO 16739-1:2024. The *concepts* in this book are stable. For *contractual* use, always check the current edition in the ISO, CEN or national catalogue.
]

=== The one-page mental model

If you remember only one diagram, make it this one. Every infrastructure BIM project, whatever the country, runs on the same chain:

#figure(
  {
    set text(font: heading-font, size: 8pt)
    let bx(t, c: accent) = rect(width: 100%, inset: 5pt, radius: 3pt, fill: c.lighten(85%), stroke: 0.8pt + c, align(center, t))
    let arr = align(center, text(size: 12pt, fill: muted)[↓])
    grid(columns: (1fr, 0.15fr, 1fr), row-gutter: 3pt, column-gutter: 0pt,
      bx[*Organisation* needs \ OIR · AIR], [], bx(c: good)[*Asset* operates \ AIM in CAFM / asset register],
      arr, [], align(center, text(size: 12pt, fill: muted)[↑]),
      bx[*Project* needs \ PIR → EIR (what, when, how good)], [], bx(c: good)[*Handover* \ PIM → AIM (as-built, O&M, H&S file)],
      arr, [], align(center, text(size: 12pt, fill: muted)[↑]),
      bx(c: warn)[*Delivery team promises* \ BEP · responsibility matrix · TIDP → MIDP], align(horizon + center, text(size: 12pt, fill: muted)[→]), bx(c: tool)[*Production* in the CDE \ WIP → Shared → Published (checked, reviewed, accepted against LOIN)],
    )
  },
  caption: [The information chain: requirements flow down, the delivery team promises, information is produced in the CDE and flows up into the asset information model.],
)

Requirements flow *down* from the organisation to the project to each appointment. The delivery team answers with *plans* (the BEP and the delivery plans). Information is *produced and approved* in a Common Data Environment. The accepted information becomes the *Asset Information Model* that the operator keeps for decades. 4D, bridge models, drainage models and drawings are all just information containers moving along this chain.

#pagebreak()
