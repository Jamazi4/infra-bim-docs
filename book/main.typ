#import "template.typ": *

#show: book.with(
  title: "Infrastructure BIM",
  subtitle: "Information Management, Bridges and 4D Construction Modelling",
  author: "Self-study edition",
  date: "November 2026",
)

// ---------- Front matter ----------
#heading(level: 2, numbering: none, outlined: false)[Contents]
#{
  show outline.entry.where(level: 1): it => {
    v(10pt)
    text(font: heading-font, weight: "bold", fill: accent, size: 10.5pt)[#it.body()]
  }
  show outline.entry.where(level: 2): it => {
    set text(font: heading-font, size: 9.8pt, weight: "medium")
    it
  }
  show outline.entry.where(level: 3): set text(size: 9pt, fill: muted)
  outline(title: none, depth: 3, indent: 1.2em)
}

#include "chapters/00-intro.typ"

#part("I", "Information Management", [ISO 19650 and the documents that run a BIM project: who asks for what, who promises what, and how the information flows from tender to handover. EIR, BEP, TIDP, MIDP, LOIN, naming and approval, and the Common Data Environment in depth.])
#include "chapters/01-landscape.typ"
#include "chapters/02-roles-process.typ"
#include "chapters/03-documents.typ"
#include "chapters/04-cde-loin.typ"
#include "chapters/05-cde.typ"
#include "chapters/06-infra-openbim.typ"

#part("II", "Bridges", [How bridges are classified, designed, analysed, built, drawn and modelled. Enough engineering to judge a bridge model and the software that produces it, without becoming a bridge designer.])
#include "chapters/07-bridge-anatomy-types.typ"
#include "chapters/08-bridge-construction.typ"
#include "chapters/09-bridge-design-analysis.typ"
#include "chapters/10-bridge-software.typ"
#include "chapters/11-bridge-drawings-bim.typ"

#part("III", "Roads, Railways and the Ground", [The other disciplines on every linear project: roads, railways, geotechnics and earthworks, drainage, utilities and tunnels. For each one: the engineering logic, standards, software, deliverables, IFC 4.3 mapping, and a review checklist.])
#include "chapters/12-roads.typ"
#include "chapters/13-railways.typ"
#include "chapters/14-geotechnics.typ"
#include "chapters/15-drainage.typ"
#include "chapters/16-utilities.typ"
#include "chapters/17-tunnels.typ"

#part("IV", "4D Construction Modelling", [What a 4D model is for, which inputs it needs, which requirements govern it, what the finished deliverable looks like, and how to check one. Includes linear-infrastructure specifics: chainage–time planning, traffic management phasing and rail possessions.])
#include "chapters/18-4d-concepts.typ"
#include "chapters/19-4d-requirements-deliverables.typ"
#include "chapters/20-4d-workflow-qa.typ"

#part("V", "Putting It Together", [A worked example that follows one fictional highway overbridge from the client's first requirements to the as-built model, then checklists for your software and a glossary.])
#include "chapters/21-worked-example.typ"
#include "chapters/22-software-checklists.typ"
#include "chapters/23-glossary-sources.typ"
