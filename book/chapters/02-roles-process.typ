#import "../template.typ": *

== Parties, Roles and the Delivery Process

ISO 19650 deliberately avoids job titles like “BIM Manager” or “BIM Coordinator”. It talks about *parties* (organisations in a contractual relationship) and *functions* (activities someone must perform). Your project may still have a “BIM Manager”. The standard only cares that each information management function has been assigned to someone and written down.

=== The three party types

#figure(
  {
    set text(font: heading-font, size: 8pt)
    let bx(t, c) = rect(width: 100%, inset: 6pt, radius: 3pt, fill: c.lighten(85%), stroke: 0.8pt + c, align(center, t))
    grid(columns: (1fr, 1fr, 1fr, 1fr), column-gutter: 6pt, row-gutter: 8pt,
      grid.cell(colspan: 4, bx([*Appointing party* — the client / asset owner \ (e.g. road authority, rail infrastructure manager)], accent)),
      grid.cell(colspan: 2, bx([*Lead appointed party* A \ e.g. design-and-build contractor], warn)),
      grid.cell(colspan: 2, bx([*Lead appointed party* B \ e.g. client's technical advisor / supervision], warn)),
      bx([Appointed party \ bridge designer], good), bx([Appointed party \ highway designer], good), bx([Appointed party \ survey], good), bx([Appointed party \ geotech], good),
      grid.cell(colspan: 2, align(center, text(fill: muted)[└── *Delivery team A* (lead + its task teams) ──┘])),
      grid.cell(colspan: 2, align(center, text(fill: muted)[└── *Delivery team B* ──┘])),
    )
  },
  caption: [Parties and teams. All delivery teams appointed by the same appointing party together form the *project team*.],
)

#datatable(
  columns: (1.1fr, 3fr),
  header: ("Party / team", "Meaning"),
  [*Appointing party*], [Receives information from the lead appointed party. Usually the client or owner, but in a supply chain a contractor can be the appointing party of its designer. It sets the requirements (OIR, AIR, PIR, EIR) and accepts or rejects deliverables.],
  [*Lead appointed party*], [Directly appointed by the appointing party. Coordinates information management for its delivery team, writes the BEP, compiles the MIDP and is accountable for delivery. On a D&B highway scheme this is usually the contractor (or the JV).],
  [*Appointed party*], [Appointed by the lead appointed party (subconsultants, specialist subcontractors). Writes its TIDP and produces information within its task teams.],
  [*Task team*], [People performing a specific task, e.g. “bridge structures team”, “drainage team”. One appointed party can have several task teams.],
  [*Delivery team*], [The lead appointed party together with all its appointed parties.],
  [*Project team*], [The appointing party plus all delivery teams.],
)

#note(title: "Same organisation, different role")[
  Party roles are *per appointment*. A design consultant is an *appointed party* toward the contractor and, at the same time, the *appointing party* for its own sub-consultant (for example a specialist bearing designer). Everything in this chapter applies recursively down the supply chain.
]

=== Information management functions

ISO 19650-2 lists the activities but leaves it to the parties to assign them. The UK BIM Framework's *Guidance Part A* proposes grouping them into *information management functions* that can be assigned to the appointing party, to a third party on its behalf (e.g. an information management consultant), or to the lead appointed party. In practice, the roles below are what you will see on an organisation chart:

#datatable(
  columns: (1.1fr, 2.4fr, 1.2fr),
  header: ("Typical role title", "Typical responsibilities", "Usually sits with"),
  [Client Information Manager / Asset Information Manager], [Writes EIR, information standard, production methods; sets up or specifies the CDE; checks BEPs at tender; accepts deliverables; maintains the AIM.], [Appointing party (or its advisor)],
  [Project Information Manager / Digital Delivery Lead], [Writes and maintains the BEP; runs the mobilisation; owns the MIDP; chairs information management meetings; reports compliance.], [Lead appointed party],
  [Task Information Manager / BIM Coordinator], [Writes the TIDP for a discipline; ensures models follow the standard; performs the *check* before sharing; coordinates clashes.], [Each appointed party],
  [Information Author / Modeller], [Produces information containers in WIP.], [Each task team],
  [Interface / Federation Manager], [Federates discipline models, runs clash detection and model quality checks, tracks issues (often BCF).], [Lead appointed party],
  [Information Security Manager / Built Asset Security Manager], [Applies ISO 19650-5: sensitivity assessment, security management plan, access control in the CDE.], [Appointing party, mirrored in delivery teams],
  [Principal Designer / H&S lead], [Drives H&S information (ISO 19650-6, CDM 2015 in the UK) and the H&S file.], [Per local legislation],
)

=== The eight activities of ISO 19650-2

The delivery-phase process has eight activities. The first three happen *for each appointment*, so they repeat whenever a new lead appointed party is procured. Activities 5.5–5.7 repeat *for each information delivery milestone*.

#figure(
  {
    set text(font: heading-font, size: 7.6pt)
    let stage(n, t, c) = rect(width: 100%, height: 1.55cm, inset: 4pt, radius: 3pt, fill: c.lighten(82%), stroke: 0.8pt + c,
      align(center + horizon)[#text(weight: "bold", fill: c)[#n] \ #t])
    grid(columns: 8, column-gutter: 3pt,
      stage("5.1", [Assessment & need], accent),
      stage("5.2", [Invitation to tender], accent),
      stage("5.3", [Tender response], warn),
      stage("5.4", [Appointment], warn),
      stage("5.5", [Mobilisation], good),
      stage("5.6", [Collaborative production], good),
      stage("5.7", [Information model delivery], good),
      stage("5.8", [Project close-out], tool),
    )
    v(3pt)
    grid(columns: (2fr, 2fr, 3fr, 1fr), column-gutter: 3pt,
      align(center, text(fill: accent)[once per project / per appointment (client)]),
      align(center, text(fill: warn)[per appointment (tenderer)]),
      align(center, text(fill: good)[per information delivery milestone (loop)]),
      align(center, text(fill: tool)[once]),
    )
  },
  caption: [The ISO 19650-2 information management process for the delivery phase (clause numbers of the 2018 edition).],
)

#datatable(
  columns: (0.45fr, 1.2fr, 0.9fr, 3fr),
  header: ("§", "Activity", "Led by", "Main tasks and outputs"),
  [5.1], [Assessment and need], [Appointing party], [Appoint individuals to perform the information management function; establish project information requirements (PIR); set information delivery milestones; establish the *project information standard* and *project information production methods and procedures*; establish *reference information and shared resources* (survey, existing asset data, templates, object libraries); establish the project's *CDE*; establish the *project information protocol* (licensing, liability, IP).],
  [5.2], [Invitation to tender], [Appointing party], [Write the *EIR* for this appointment; assemble the information to be included in the tender (reference info, standard, methods, protocol); define *tender response requirements and evaluation criteria*; compile the invitation-to-tender information.],
  [5.3], [Tender response], [Prospective lead appointed party], [Nominate its information management function; write the *pre-appointment BEP*; assess each prospective task team's *capability and capacity*; compile the delivery team's capability summary; draft the *mobilisation plan*; build the *information delivery risk register*; submit.],
  [5.4], [Appointment], [Lead appointed party (+ appointing party)], [Confirm the BEP (*post-appointment BEP*); establish the *detailed responsibility matrix*; define the lead appointed party's EIRs for its own appointed parties; write the *TIDPs*; compile the *MIDP*; complete the appointment documents for the lead and each appointed party (the BEP, MIDP, information protocol and EIR become *contract* documents).],
  [5.5], [Mobilisation], [Lead appointed party], [Mobilise resources (people, training); mobilise IT (CDE access, software, hardware); *test* the production methods and procedures (e.g. a test federation, a test IFC exchange, a naming check); fix problems *before* production starts.],
  [5.6], [Collaborative production of information], [Each task team], [Check availability of reference information; generate information in WIP; perform the *quality assurance check*; *review* and approve for sharing; perform the *information model review* (coordination, clash, compliance).],
  [5.7], [Information model delivery], [Lead appointed party → appointing party], [Submit the information model for lead appointed party authorisation; then for appointing party *review and acceptance* against the EIR, LOIN and acceptance criteria. Rejected information goes back to WIP.],
  [5.8], [Project close-out], [Appointing party], [Archive the project information model; capture *lessons learned* for future projects.],
)

==== Check, review, approve, authorise, accept

These five verbs are not synonyms in ISO 19650. Mixing them up is the most common source of confusion in CDE workflow design.

#datatable(
  columns: (0.9fr, 1.2fr, 2.7fr),
  header: ("Step", "Who", "What it means"),
  [*Check*], [Task team (author's own team)], [Does the container comply with the information standard and methods (naming, metadata, format, classification, coordinates)? This is a *compliance* check, not an engineering one.],
  [*Review*], [Task team], [Is the *content* correct for its purpose (technical review, coordination with others)? Then *approve* it for sharing.],
  [*Approve* (share)], [Task team leader], [Move from WIP to *Shared*, with a suitability code.],
  [*Authorise*], [Lead appointed party], [The delivery team's internal sign-off that the federated model is ready to go to the client.],
  [*Accept*], [Appointing party], [The client's formal acceptance against EIR and acceptance criteria. The container moves to *Published*.],
)

=== Who writes which document?

#figure(
  datatable(
    columns: (1.9fr, 0.9fr, 0.9fr, 0.9fr, 1.6fr),
    header: ("Document", "Appointing party", "Lead appointed", "Appointed party", "When"),
    [OIR / AIR], [*Author*], [–], [–], [Before / independent of project],
    [PIR], [*Author*], [–], [–], [5.1],
    [Project information standard & methods], [*Author*], [proposes changes], [–], [5.1],
    [Project information protocol], [*Author*], [accepts], [accepts], [5.1 / 5.4],
    [EIR (appointing → lead)], [*Author*], [responds], [–], [5.2],
    [Pre-appointment BEP], [reviews / evaluates], [*Author*], [contributes], [5.3],
    [Capability & capacity assessment], [evaluates], [*Compiles*], [*Each provides*], [5.3],
    [Mobilisation plan, risk register], [reviews], [*Author*], [contributes], [5.3],
    [Post-appointment BEP], [agrees], [*Author*], [contributes], [5.4],
    [Detailed responsibility matrix], [agrees], [*Author*], [contributes], [5.4],
    [EIR (lead → appointed)], [–], [*Author*], [responds], [5.4],
    [TIDP], [–], [reviews / aggregates], [*Author*], [5.4],
    [MIDP], [agrees], [*Author*], [–], [5.4],
    [Information model (deliverables)], [*Accepts*], [*Authorises*], [*Produces*], [5.6–5.7],
    [Lessons learned], [*Author*], [contributes], [contributes], [5.8],
  ),
  kind: table,
  caption: [Authorship and approval of the core documents.],
)

#tip(title: "How it feels on a real highway project")[
  On a typical motorway widening D&B contract the client's EIR arrives in the tender pack together with a *BIM/Digital Delivery Standard*, a *naming convention*, a *LOIN (or MDS, Model Delivery Specification) matrix*, a *CDE*, and an asset data dictionary. The contractor's bid team writes a 20–40-page *pre-appointment BEP* that is scored (often 5–15 % of the quality mark). After award, the BEP is expanded to 60–150 pages plus appendices within 4–12 weeks. Each designer (highways, structures, drainage, geotechnics, utilities, ITS, environmental) writes a *TIDP*, usually as a spreadsheet with hundreds to thousands of deliverable lines, and the contractor rolls them into the *MIDP*. From then on, the MIDP is the main progress-tracking instrument, and the BEP becomes a reference that should be revised at each stage gate. In practice it often is not.
]

#builder[
  - Model *parties, appointments and task teams* as first-class entities with a tree (appointing → lead → appointed), because responsibility and approval rights derive from them.
  - Implement *check / review / approve / authorise / accept* as distinct, auditable workflow steps with separate permissions.
  - Every deliverable (MIDP line) should trace to: its *EIR requirement*, its *task team*, its *milestone*, and its *LOIN* entry.
]

#keypoints[
  - Three party types: *appointing*, *lead appointed*, *appointed*. Roles are per appointment and recurse down the supply chain.
  - Eight activities (§5.1–5.8). Tender and appointment activities repeat per appointment; production and delivery repeat per milestone.
  - *Check ≠ review ≠ accept.* A compliant container can still be technically wrong, and an approved container is not yet accepted by the client.
]
