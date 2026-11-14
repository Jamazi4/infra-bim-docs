// Shared styling + helper components for the Infra BIM book

#let accent = rgb("#1f5f8b")
#let accent-light = rgb("#e8f1f8")
#let warn = rgb("#b5651d")
#let warn-light = rgb("#fbf0e6")
#let good = rgb("#2e7d4f")
#let good-light = rgb("#e9f5ee")
#let tool = rgb("#6a3d9a")
#let tool-light = rgb("#f2ecf8")
#let ink = rgb("#1d232b")
#let muted = rgb("#5b6672")
#let rule = rgb("#c9d3dd")

#let heading-font = ("Avenir Next", "Helvetica Neue", "Helvetica")
#let body-font = ("Charter", "Georgia")

#let box-base(title, body, fg, bg, icon) = block(
  width: 100%,
  fill: bg,
  stroke: (left: 3pt + fg),
  inset: (left: 12pt, right: 10pt, top: 9pt, bottom: 9pt),
  radius: (right: 3pt),
  breakable: false,
  above: 1.1em, below: 1.1em,
)[
  #text(font: heading-font, weight: "bold", size: 9pt, fill: fg)[#icon #upper(title)]
  #v(-2pt)
  #set text(size: 9.6pt)
  #body
]

#let note(title: "Note", body) = box-base(title, body, accent, accent-light, "●")
#let tip(title: "In practice", body) = box-base(title, body, good, good-light, "▲")
#let warning(title: "Watch out", body) = box-base(title, body, warn, warn-light, "!")
#let builder(title: "For your software suite", body) = box-base(title, body, tool, tool-light, "◆")

#let keypoints(body) = block(
  width: 100%, inset: 11pt, radius: 3pt,
  stroke: 0.8pt + accent, above: 1.2em, below: 1.2em,
)[
  #text(font: heading-font, weight: "bold", size: 9pt, fill: accent)[KEY TAKEAWAYS]
  #set text(size: 9.6pt)
  #body
]

// A simple striped table helper
#let datatable(columns: auto, header: (), ..rows) = {
  set text(size: 8.6pt)
  set par(justify: false)
  table(
    columns: columns,
    stroke: (x, y) => (
      bottom: if y == 0 { 1pt + accent } else { 0.4pt + rule },
    ),
    fill: (x, y) => if y == 0 { accent-light } else if calc.even(y) { rgb("#f7f9fb") } else { none },
    inset: (x: 5pt, y: 4.5pt),
    align: left + top,
    table.header(..header.map(h => text(font: heading-font, weight: "bold", size: 8.2pt, fill: accent)[#h])),
    ..rows,
  )
}

#let part(num, title, blurb) = {
  pagebreak(weak: true)
  set page(header: none, footer: none, fill: accent)
  v(1fr)
  text(font: heading-font, size: 14pt, fill: white.transparentize(30%), weight: "medium")[PART #num]
  v(4pt)
  text(font: heading-font, size: 34pt, fill: white, weight: "bold")[#title]
  v(10pt)
  line(length: 40%, stroke: 1.5pt + white)
  v(8pt)
  block(width: 80%, text(size: 11.5pt, fill: white)[#blurb])
  v(2fr)
  // invisible marker for TOC
  place(hide[#heading(level: 1, numbering: none, outlined: true, bookmarked: true, supplement: [Part])[Part #num — #title]])
}

#let book(title: "", subtitle: "", author: "", date: "", body) = {
  set document(title: title, author: author)
  set text(font: body-font, size: 10.4pt, fill: ink, lang: "en")
  set par(justify: true, leading: 0.68em, spacing: 1.05em)
  set page(
    paper: "a4",
    margin: (inside: 2.5cm, outside: 2.1cm, top: 2.3cm, bottom: 2.3cm),
    header: context {
      let p = here().page()
      let opening = query(heading.where(level: 2)).any(h => h.location().page() == p)
      if p > 2 and not opening {
        let hs = query(selector(heading.where(level: 2)).before(here()))
        let cur = if hs.len() > 0 { hs.last().body } else { [] }
        set text(font: heading-font, size: 8pt, fill: muted)
        if calc.even(p) [#title #h(1fr) #cur] else [#cur #h(1fr) #title]
        v(-6pt)
        line(length: 100%, stroke: 0.4pt + rule)
      }
    },
    footer: context {
      let p = here().page()
      if p > 2 {
        set text(font: heading-font, size: 8.5pt, fill: muted)
        if calc.even(p) [#counter(page).display()] else [#h(1fr) #counter(page).display()]
      }
    },
  )

  set heading(numbering: (..n) => {
    let n = n.pos()
    if n.len() == 1 { none }
    else if n.len() == 2 { numbering("1", n.at(1)) }
    else { numbering("1.1", ..n.slice(1)) }
  })

  show heading.where(level: 2): it => {
    pagebreak(weak: true)
    v(1.2cm)
    if it.numbering != none {
      text(font: heading-font, size: 11pt, fill: accent, weight: "bold")[CHAPTER #counter(heading).display((..n) => str(n.pos().at(1)))]
      v(-2pt)
    }
    text(font: heading-font, size: 24pt, fill: ink, weight: "bold")[#it.body]
    v(4pt)
    line(length: 100%, stroke: 1pt + accent)
    v(10pt)
  }
  show heading.where(level: 3): it => {
    v(0.6em)
    block(sticky: true, text(font: heading-font, size: 13.5pt, fill: accent, weight: "bold")[#if it.numbering != none [#counter(heading).display() #h(5pt)]#it.body])
    v(0.25em)
  }
  show heading.where(level: 4): it => {
    v(0.3em)
    block(sticky: true, text(font: heading-font, size: 10.8pt, fill: ink, weight: "bold")[#it.body])
  }
  show heading.where(level: 5): it => block(sticky: true, text(font: heading-font, size: 9.8pt, fill: muted, weight: "bold")[#it.body])

  show raw: set text(font: ("Menlo", "Courier New"), size: 8.6pt)
  show raw.where(block: true): it => block(fill: rgb("#f4f6f8"), inset: 8pt, radius: 3pt, width: 100%, it)
  show link: it => text(fill: accent)[#it]
  set list(indent: 0.6em, body-indent: 0.5em, spacing: 0.75em)
  set enum(indent: 0.6em, body-indent: 0.5em, spacing: 0.75em)
  show figure.caption: set text(size: 8.6pt, fill: muted, font: heading-font)
  set figure(gap: 8pt)
  show figure: set block(breakable: true)
  show figure.where(kind: table): set figure.caption(position: top)

  // ---------- Cover ----------
  page(margin: 0pt, header: none, footer: none, fill: accent)[
    #place(top + left, dx: 0pt, dy: 0pt, rect(width: 100%, height: 100%, fill: gradient.linear(accent, rgb("#0d2f47"), angle: 70deg)))
    // decorative "bridge" line art
    #place(bottom + left, dy: -6.2cm, box(width: 100%, height: 5cm)[
      #let w = 21cm
      #place(line(start: (0cm, 3.2cm), end: (w, 3.2cm), stroke: 2.5pt + white.transparentize(40%)))
      #for i in range(0, 7) {
        let x = 1.5cm + i * 3cm
        place(line(start: (x, 3.2cm), end: (x, 5cm), stroke: 2pt + white.transparentize(55%)))
      }
      #place(curve(stroke: 1.5pt + white.transparentize(50%),
        curve.move((0cm, 3.2cm)), curve.quad((5.25cm, 0cm), (10.5cm, 3.2cm)), curve.quad((15.75cm, 0cm), (21cm, 3.2cm))))
      #for i in range(1, 20) {
        let x = i * 21cm / 20
        let local = calc.rem(x / 1cm, 10.5) / 10.5
        let y = 3.2cm - 3.2cm * 4 * local * (1 - local) * 0.5
        place(line(start: (x, y), end: (x, 3.2cm), stroke: 0.6pt + white.transparentize(60%)))
      }
    ])
    #pad(x: 2.2cm, top: 3.5cm)[
      #text(font: heading-font, size: 11pt, fill: white.transparentize(25%), weight: "medium", tracking: 2pt)[A SELF-STUDY BOOK FOR INFRASTRUCTURE BIM PROFESSIONALS]
      #v(14pt)
      #text(font: heading-font, size: 40pt, fill: white, weight: "bold")[#title]
      #v(6pt)
      #block(width: 85%, text(font: heading-font, size: 17pt, fill: white.transparentize(10%), hyphenate: false)[#subtitle])
      #v(18pt)
      #line(length: 30%, stroke: 2pt + white)
    ]
    #place(bottom + left, dx: 2.2cm, dy: -2cm, text(font: heading-font, size: 10pt, fill: white.transparentize(20%))[#author #h(1em) · #h(1em) #date])
  ]

  counter(page).update(1)
  body
}
