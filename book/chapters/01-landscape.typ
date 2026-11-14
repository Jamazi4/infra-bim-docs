#import "../template.typ": *

== The BIM Standards Landscape

Before going into processes, it helps to know which documents exist and how they relate. People mix up the *process* standards (how information is managed), the *data* standards (how information is structured and exchanged) and the *national or client* standards (how a particular owner applies both). A good BEP references all three layers.

=== Three layers of standards

#datatable(
  columns: (1fr, 2.2fr, 2fr),
  header: ("Layer", "Answers the question", "Key documents"),
  [*Process*], [Who does what, when, and how information is requested, produced, checked and accepted.], [ISO 19650-1…6; ISO 29481 (IDM); ISO 7817-1 / EN 17412-1 (LOIN); BS 8536 (design for operation)],
  [*Data / semantics*], [How objects, properties and exchanges are encoded so different software can read them.], [ISO 16739-1 (IFC 4.3); ISO 12006-2/-3 (classification frameworks); ISO 23386/23387 (data templates); ISO 21597 (ICDD containers); bSDD; IDS (Information Delivery Specification)],
  [*National / client*], [How a country or an owner applies the above: codes, templates, naming, classification, required use cases.], [UK BIM Framework and NA to ISO 19650-2; National Highways and Network Rail requirements; German Masterplan BIM Bundesfernstraßen, BIM4INFRA, BIM Deutschland templates; TII (Ireland) GE-BIM; FHWA/AASHTO digital delivery; Singapore BCA; Middle-East client standards],
)

=== The ISO 19650 series

ISO 19650 is the international successor of the British BS 1192:2007 and PAS 1192-2/-3/-5. If you have worked on UK projects before 2019, many concepts will be familiar under older names (for example, the “EIR” was “Employer's Information Requirements” and is now *Exchange* Information Requirements).

#datatable(
  columns: (0.9fr, 1.1fr, 3fr),
  header: ("Part", "Edition", "Scope (paraphrased)"),
  [*19650-1*], [2018], [Concepts and principles: information requirements and models, the information delivery cycle, parties, the CDE, the level of information need, and the maturity stages.],
  [*19650-2*], [2018], [Delivery phase of assets: the eight activities from assessing need to project close-out. *The part most projects contract against.*],
  [*19650-3*], [2020], [Operational phase: managing the Asset Information Model and the triggers for information exchange during operation (maintenance, inspections, incidents, alterations).],
  [*19650-4*], [2022], [Information exchange: the decision criteria and process for each exchange, including review and acceptance of information containers (both CDE transitions and appointment deliverables).],
  [*19650-5*], [2020], [Security-minded approach: sensitivity assessment, security strategy and management plan. Very relevant for bridges, rail and other critical national infrastructure.],
  [*19650-6*], [2025], [Health and safety information: a structured way to identify, record and share H&S risk information across design, construction and operation, linked to the model.],
)

#note(title: "Revision in progress")[
  CEN and ISO started a revision of Parts 1 and 2 in 2024. Draft (DIS) texts were circulating in 2026. Proposals include merging delivery and operational-phase processes into one cycle in Part 2 (with Part 3 becoming implementation guidance) and refining CDE states. *Until the revised editions are published, the 2018 texts remain the contractual reference.* Expect terminology to stay recognisable.
]

==== The UK BIM Framework guidance

The standards are short and abstract. Most practitioners learn ISO 19650 from the free *UK BIM Framework* guidance (`ukbimframework.org`), now maintained under the Construction Innovation Hub and nima. It includes:

- Guidance Part 1 (Concepts), Part 2 (Processes for project delivery), Part 3 (Operational phase), Part A (The party, team and appointment), Part C (Facilitating the CDE), Part D (Developing information requirements), Part E (Tendering and appointments), Part F (Information delivery planning), plus guidance on ISO 19650-5 and Part 6;
- templates (EIR, BEP, responsibility matrix, TIDP/MIDP, information protocol);
- the *UK National Annex* to BS EN ISO 19650-2, which defines the UK container naming convention and status codes used worldwide (including many Middle East and Asian projects).

=== Level of Information Need: EN 17412-1 → ISO 7817-1

The concept of *Level of Information Need* (LOIN) replaced the older and loosely defined “LOD” scales (LOD 100–500 from the US BIMForum, LOD 1–7 of PAS 1192). LOIN was standardised as *EN 17412-1:2020* and then adopted internationally as *ISO 7817-1:2024* (published in Europe as EN ISO 7817-1). It splits the need into:

- *Geometrical information:* detail, dimensionality (0D–3D), location, appearance, parametric behaviour;
- *Alphanumerical information:* identification (name, type, classification) and information content (property sets);
- *Documentation:* the documents that must accompany the object (certificates, test reports, data sheets, drawings).

Each requirement is tied to a *purpose*, a *milestone*, an *actor* and an *object*. Chapter 4 covers it in depth.

=== Data standards you will touch as a software builder

#datatable(
  columns: (1.2fr, 3fr),
  header: ("Standard", "Why it matters for infrastructure"),
  [*ISO 16739-1:2024 (IFC 4.3)*], [The first IFC with native road, rail, bridge, port and waterway entities, plus alignment (IfcAlignment) and linear placement. See Chapter 6.],
  [*IDS 1.0 (buildingSMART)*], [A machine-readable XML file that states which entities must carry which properties and values. It turns LOIN tables into automated checks. Approved as a buildingSMART standard in 2024.],
  [*bSDD*], [buildingSMART Data Dictionary: an online service that hosts classifications and property definitions (Uniclass, national dictionaries, IFC) with URIs that a model can reference.],
  [*ISO 12006-2 / Uniclass 2015, CoClass, OmniClass, CCI*], [Classification frameworks. Uniclass is common in UK and international infra projects (tables Co, En, SL, EF, Ss, Pr, TE, PM, Ac, Ro, FI, Zz).],
  [*ISO 23386 / 23387*], [Methodology for describing properties in interconnected dictionaries, and data templates for construction objects (product data templates).],
  [*ISO 29481-1/-3 (IDM)*], [Information Delivery Manual: describes *business processes* and the information exchanged in them. AASHTO's bridge IDM (US) is an example.],
  [*ISO 21597 (ICDD)*], [Information Container for linked Document Delivery: packages documents and models together with the links between them. Used in German and Dutch infra.],
  [*LandXML, RailML, InfraGML/OGC*], [Older or adjacent exchange formats for alignments, surfaces, rail networks and land-administration data. Still everywhere in practice.],
)

=== National and client frameworks for infrastructure

You will meet many client frameworks. They all adapt the same ISO concepts, under different names.

#datatable(
  columns: (1.1fr, 1.2fr, 2.6fr),
  header: ("Region / client", "Name for “EIR” / “BEP”", "Notes"),
  [UK: National Highways, Network Rail, HS2], [EIR / BEP], [ISO 19650 + UK NA. National Highways requires asset data to its Asset Data Management Manual (ADMM). Network Rail and HS2 publish their own BIM/information management standards and BEP templates.],
  [Germany: Autobahn GmbH, DB InfraGO], [AIA (Auftraggeber-Informationsanforderungen) / BAP (BIM-Abwicklungsplan)], [Masterplan BIM Bundesfernstraßen (2021) and BIM Deutschland templates; standardised *Anwendungsfälle* (use cases, “AwF”) such as variant studies, coordination, quantity take-off and 4D construction planning.],
  [Ireland: TII], [EIR / BEP], [TII GE-BIM-01xxx publications align with ISO 19650 and IFC.],
  [USA: FHWA, State DOTs, AASHTO], [Varies: “BIM requirements”, “digital delivery”, “VDC requirements”], [Federal BIM for Infrastructure programme, pooled-fund studies TPF-5(480) and TPF-5(523) for bridges, AASHTO Information Delivery Manual for bridge design-to-construction, and moves toward the “model as legal document”.],
  [Middle East (KSA, UAE, Qatar)], [EIR / BEP, often following UK NA], [Client standards (e.g. Abu Dhabi ADM BIM documentation guidelines for infrastructure) borrow UK templates almost directly.],
  [Australia / NZ], [EIR / BEP], [State road agencies (e.g. Queensland TMR) publish EIRs based on ISO 19650.],
)

#builder[
  - Treat *naming conventions, status codes, classification tables and use-case lists* as configurable data, not hard-coded logic. Every client changes them.
  - Store each requirement with its *source* (ISO clause, client document, BEP section). Auditors and information managers always ask “where does this rule come from?”
  - Support *IDS* import for checking. It is becoming the standard way to express LOIN alphanumeric requirements.
]

#keypoints[
  - *ISO 19650* manages information; *IFC/IDS/bSDD* structure it; *client standards* configure both.
  - *Part 2* (delivery) is what most projects contract against. Parts 3, 4, 5 and 6 add the operational phase, exchange acceptance, security and H&S.
  - *LOIN* (ISO 7817-1) replaces LOD scales: geometry + alphanumeric + documentation, always tied to a purpose and milestone.
  - The same ideas travel under different names: EIR = AIA, BEP = BAP, “use case” = Anwendungsfall.
]
