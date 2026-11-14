#import "../template.typ": *

== The Common Data Environment in Depth

Chapter 4 introduced the CDE states, status codes and naming. This chapter covers the CDE in full: what the ISO 19650 series actually requires, how CDEs are set up and run on real infrastructure projects, which technologies are used, how several CDEs work together, and how to specify, audit and hand over a CDE.

=== CDE solution vs CDE workflow

The UK BIM Framework *Guidance Part C* makes a distinction that clears up most confusion:

- the *CDE workflow* is the agreed *process*: states, transitions, checks, approvals, metadata and access rules, defined in the project's information standard and production methods;
- the *CDE solution* is the *technology* that facilitates the workflow: one or more software platforms.

The workflow is designed first, and solutions are selected to support it. A project CDE is often made of *several* solutions (the client's platform, the contractor's platform, designers' internal systems, authoring tools' own collaboration services) that together implement *one* workflow. Vendors call their products “a CDE”, but under ISO 19650 a product is at most a *CDE solution*.

=== What the standards require

#datatable(
  columns: (1.2fr, 3fr),
  header: ("Source", "CDE-related content (paraphrased)"),
  [*ISO 19650-1 §12*], [Concepts: the CDE as the agreed source of information; the *information container* as the unit managed; the four states (work in progress, shared, published, archived); the meaning of each transition (check/review/approve before sharing; review/authorise before publishing); metadata (status, revision, classification); and the requirement that the archive keeps a journal of all transactions.],
  [*ISO 19650-2 §5.1.7*], [The *appointing party* establishes the project's CDE *before* the invitation to tender. The CDE solution and workflow must enable: a *unique ID* for each container based on an agreed convention of fields and delimiters; *codified values* for each field; the attributes *status* (suitability), *revision* (and version) and *classification* on every container; *transitions* between states; *recording of the user name and date* of each revision's state transition; and *controlled access* at container level.],
  [*ISO 19650-2, other clauses*], [§5.1.5 production methods and procedures (how the CDE is used); §5.5.2–5.5.3 mobilise and *test* the CDE and IT before production; §5.6.3–5.6.5 check, review and approve before sharing; §5.7 authorisation and acceptance (to *published*); §5.8 archiving the PIM at close-out.],
  [*ISO 19650-3*], [CDE use in the operational phase: the AIM is maintained in a CDE, with information exchanged on trigger events (maintenance, inspection, incidents, alterations).],
  [*ISO 19650-4*], [Each exchange (including CDE state transitions) has defined *decision criteria*: conformance with the information standard, continuity (consistency with other containers), communication (fit for the receiving party) and consistency with the information requirements.],
  [*ISO 19650-5*], [Security-minded approach: sensitivity assessment, need-to-know access, logging, secure disposal. Shapes permissions, hosting location and supplier vetting of the CDE.],
  [*ISO 19650-6*], [H&S information shared and kept in the CDE and linked to the model.],
  [*UK National Annex (BS EN ISO 19650-2)*], [The naming fields, status codes and revision scheme (Chapter 4). Guidance Part C adds advice on metadata, multiple solutions and transfer of metadata between them.],
  [*DIN SPEC 91391-1 / -2* (Germany, 2019)], [Part 1: functional requirements and *function sets* of a CDE (workflow and data management, data sovereignty and neutrality, security). Part 2: an *open interface* for exchanging information containers between CDEs of different vendors. Free to download from DIN Media.],
  [*buildingSMART openCDE APIs*], [*Foundation API* (authentication, discovery), *Documents API* (exchange of documents with metadata between CDEs and applications; final standard since December 2023), *BCF API* (issues). The open route to multi-vendor CDE ecosystems.],
)

#note(title: "Exact clause wording")[
  The lists above paraphrase the standards. ISO texts are paywalled; the UK BIM Framework guidance (free) quotes and explains most of them. When a CDE requirement becomes contractual, quote the clause from your licensed copy.
]

=== Who owns the CDE? Common set-ups

ISO 19650-2 makes the *appointing party* responsible for establishing the project CDE, but it may be hosted by others. Three set-ups dominate in infrastructure:

#datatable(
  columns: (1.15fr, 1.9fr, 1.9fr),
  header: ("Set-up", "How it works", "Pros / cons"),
  [*Single client-hosted CDE*], [The client procures one platform; all delivery teams work in it (often with their own WIP areas).], [+ One source of truth, one audit trail, easy handover. − Designers' internal WIP still happens elsewhere; licence and performance issues; teams resist working in a client system.],
  [*Federated CDEs*], [Each lead appointed party runs its own CDE for WIP and shared information; *published* deliverables are transmitted to the client's CDE.], [+ Teams use their tools. − Metadata must be mapped between systems; duplicated containers; risk of inconsistency (a UCL review highlights accountability and reliability issues with multiple simultaneous CDEs).],
  [*Contractor-hosted project CDE*], [On D&B contracts the contractor provides the CDE for the project, granting the client access, and hands over at completion.], [+ Common on large D&B and alliance schemes. − Data ownership, licence continuity after completion and export of the full journal must be in the contract.],
)

#figure(
  {
    set text(font: heading-font, size: 7.6pt)
    set par(justify: false)
    let bx(t, c) = rect(width: 100%, inset: 6pt, radius: 3pt, fill: c.lighten(85%), stroke: 0.8pt + c, align(center + horizon, t))
    grid(columns: (1fr, 0.22fr, 1.2fr, 0.22fr, 1fr), row-gutter: 6pt,
      bx([*Authoring environments* \ Civil 3D / OpenRoads / Revit / bridge tools, cloud work-sharing, data shortcuts], muted), align(center + horizon)[→],
      bx([*Delivery team CDE solution* \ WIP areas per task team · Shared (S1–S4) · check / review / approve · BCF issues · federation], warn), align(center + horizon)[⇄],
      bx([*Client CDE solution* \ submissions (S4) · review & acceptance · Published (A/B/CR) · archive & journal], accent),
      [], [], align(center, text(fill: muted)[metadata mapping · openCDE Documents API · transmittals with metadata (CSV/XML) · ICDD packages]), [], align(center, text(size: 11pt, fill: muted)[↓]),
      [], [], [], [], bx([*Asset systems (AIM)* \ asset register / EAM / CAFM / GIS / bridge inventory], good),
    )
  },
  caption: [A typical federated CDE arrangement on an infrastructure project: one workflow, several solutions.],
)

=== Anatomy of a CDE solution

#datatable(
  columns: (1.2fr, 3fr),
  header: ("Function group", "What it must do"),
  [*Container management*], [Store files *and* structured data as containers; versions and revisions; unique IDs; supersession; locking/check-out; large-file handling (point clouds, federated models).],
  [*Metadata*], [Mandatory and optional attributes with controlled code lists; validation on upload; bulk edit; metadata travels with the container through transitions.],
  [*Workflow engine*], [Configurable states and transitions; check/review/approve/authorise/accept steps with assignees, due dates and outcomes; review comments and comment codes; rejections back to WIP.],
  [*Transmittals / submissions*], [Formal record of what was issued, to whom, when, for which purpose; acknowledgements.],
  [*Access control*], [Roles, groups and permissions per area, state and container; need-to-know and sensitivity classes (ISO 19650-5); external party access; time-limited access.],
  [*Audit trail / journal*], [Immutable log of every action (upload, view, download, transition, permission change) with user and timestamp.],
  [*Viewing and review*], [2D/3D viewers (including IFC and large infra models), markup, comparison of revisions, federation.],
  [*Issue management*], [Issues/clashes/RFIs linked to containers and model objects; BCF import/export or BCF API.],
  [*Planning integration*], [Link containers to MIDP/TIDP lines and milestones; planned vs actual; dashboards.],
  [*Search and reporting*], [Search by metadata and content; register exports; KPI reports.],
  [*Integration / APIs*], [Authoring tool connectors, open APIs (openCDE, BCF API), webhooks, SSO, export of the complete archive with metadata and journal.],
  [*Archive and retention*], [Archive state, retention rules, legal hold, long-term formats, complete export at close-out.],
)

=== Metadata: the heart of the CDE

Folders are a *view*, metadata is the *truth*. Projects that encode meaning in deep folder trees (`/Design/Structures/B01/Drawings/For Approval/`) lose it the moment a file is moved or exported. The ISO approach is a reasonably flat store of containers with rich, validated metadata. Folders are kept only for permissions and convenience.

#datatable(
  columns: (1.2fr, 1.4fr, 2fr),
  header: ("Attribute", "Example", "Notes"),
  [Container ID (name)], [`A99R-ABC-B01-ZZ-DR-S-0100`], [Fields per naming convention; validated against code lists.],
  [Title / description], [B01 General arrangement], [Human-readable; often printed in the title block.],
  [Status (suitability)], [S3], [Changes with each transition; not in the file name.],
  [Revision / version], [P02 / P02.03], [Revision for shared/published; version for WIP iterations.],
  [Classification], [Uniclass `EF_25_10` / `Pr_…`], [ISO 12006-2 based; required by ISO 19650-2.],
  [Originator, task team], [ABC / Structures], [Drives responsibility and permissions.],
  [Milestone / MIDP ref], [M4 / MIDP line 0412], [Links the container to the delivery plan.],
  [Sensitivity], [Official / Restricted], [ISO 19650-5 classification; drives access.],
  [Workflow fields], [Checked by, reviewed by, approved by, dates], [Captured automatically by the workflow.],
  [Infrastructure-specific], [Structure ID, chainage from/to, section, line/ELR], [Not in the standard, but essential for linear projects; enables location search.],
  [Format / authoring software], [IFC4X3_ADD2, Civil 3D 2026], [Supports exchange checks and long-term preservation.],
)

=== Workflows in practice

#figure(
  {
    set text(font: heading-font, size: 7.2pt)
    set par(justify: false)
    let st(t, c) = rect(width: 100%, inset: 4pt, radius: 3pt, fill: c.lighten(82%), stroke: 0.8pt + c, align(center + horizon, t))
    let ar = align(center + horizon, text(size: 10pt, fill: muted)[→])
    grid(columns: (1fr, 0.2fr, 1fr, 0.2fr, 1fr, 0.2fr, 1fr, 0.2fr, 1fr), row-gutter: 6pt,
      st([*Author* \ WIP (S0) \ P01.01…], accent), ar,
      st([*Task team check* \ naming, metadata, IDS, format], accent), ar,
      st([*Task team review & approve* \ technical content], accent), ar,
      st([*Shared* S1/S2/S3 \ coordination, federation, comments], warn), ar,
      st([*Lead authorises* \ submit S4 to client], warn),
      grid.cell(colspan: 9, align(right, text(size: 10pt, fill: muted)[↓ #h(1.1cm)])),
      st([*Rejected* (from any review) → back to WIP with comments], red), [],
      st([*Archive* \ superseded revisions, journal], muted), align(center + horizon, text(size: 10pt, fill: muted)[←]),
      st([*Published* \ A1… / B1… / CR \ C01, C02…], good), align(center + horizon, text(size: 10pt, fill: muted)[←]),
      st([*Client accepts* \ (or accepts with comments)], good), align(center + horizon, text(size: 10pt, fill: muted)[←]),
      st([*Client review* \ comment codes, due date], good),
    )
  },
  caption: [A typical end-to-end CDE workflow for a deliverable (UK NA codes). Real projects add variants for models (frequent S1 sharing), RFIs, technical queries and contractor submittals.],
)

Practical conventions you will meet:

- *Review comment codes* on client reviews, e.g. *Code 1/A*: accepted; *Code 2/B*: accepted with comments, proceed and incorporate; *Code 3/C*: rejected, revise and resubmit; *Code 4/D*: for information only / not reviewed. These usually map to A/B status codes or a return to WIP.
- *Model sharing cadence*: discipline models are shared at S1 on a fixed rhythm (often weekly) for federation and clash detection, separately from formal drawing submissions.
- *Review periods* are contractual (e.g. 10 or 14 days under many contracts; NEC4 uses the period for reply). The CDE should track them.
- *Technical queries, RFIs, submittals, NCRs* are run as CDE workflows with their own registers.
- *WIP collaboration* often happens in the authoring tools' own environments (cloud work-sharing, data shortcuts, ProjectWise work areas). Snapshots are published to the CDE's Shared state. Make sure the BEP says where WIP lives.

=== The technology landscape

Examples of platforms used as CDE solutions on infrastructure projects (not a recommendation; capabilities and names change):

#datatable(
  columns: (1.4fr, 3fr),
  header: ("Platform", "Typical positioning"),
  [Autodesk Construction Cloud (Autodesk Docs, Build, BIM Collaborate)], [Strong integration with Civil 3D/Revit; ISO 19650-style naming and approval workflows; BSI Kitemark for ISO 19650 (BIM software).],
  [Bentley ProjectWise + iTwin], [Long-standing in infrastructure (road and rail authorities, large consultants); work-sharing for MicroStation/OpenRoads/OpenRail; iTwin for digital twins.],
  [Oracle Aconex], [Contract-centric document control, transmittals and correspondence; widely used by owners and EPC contractors on megaprojects (Middle East, Australia).],
  [Asite], [Cloud CDE with configurable ISO 19650 workflows; among the first with the BSI Kitemark for BIM software.],
  [Trimble Connect, Viewpoint (4Projects), Trimble Quadri], [Model-centric collaboration; 4Projects for document control in the UK; Quadri as a shared model for road/rail design (Novapoint).],
  [Thinkproject, Dalux, Procore, Catenda Hub, Bimsync], [Document and model management, field tools, openBIM-centred (Catenda is active in buildingSMART openCDE).],
  [SharePoint / custom], [Common in designer organisations as internal WIP; rarely meets ISO 19650 requirements without customisation (metadata validation, state workflows, journal).],
  [Issue/coordination tools], [BIMcollab, Revizto, Solibri, Navisworks + ACC: BCF-based issue management alongside the CDE.],
)

#tip(title: "Certification")[
  BSI runs a *Kitemark for BIM software* (since 2021) that assesses a platform's functionality against the software-enabled requirements of ISO 19650 (parts 1, 2, 5 and 6), plus security, development practices, support and resilience. Certified products include, for example, Asite and Autodesk Construction Cloud (Docs/Build/Model Coordination). Certification shows that the *software can support* the workflow. It does not prove that a *project* is configured or operated correctly.
]

=== Interoperability between CDEs

When several CDE solutions form the project CDE, information and *metadata* must move between them without loss:

- *Transmittals with metadata exports* (CSV/XML registers alongside the files): the most common approach, fragile but universal.
- *buildingSMART openCDE Documents API*: vendor-neutral upload/download of documents with metadata between CDEs and applications; growing vendor support.
- *DIN SPEC 91391-2*: the earlier German open interface specification that informed openCDE.
- *ICDD (ISO 21597)*: packages documents, models and the *links* between them into one container, used for structured deliveries (e.g. German and Dutch infrastructure).
- *BCF API*: keeps issues synchronised between coordination tools and CDEs.

Whatever the mechanism, define in the BEP: the *master* system for each state, the *metadata mapping* table, how IDs and revisions are preserved, and who reconciles differences.

=== Setting up a project CDE (mobilisation)

+ *Write the CDE requirements*: from the information standard, production methods, EIR and ISO 19650-5 sensitivity assessment (see checklist §5.13).
+ *Select or confirm the solution(s)*; agree hosting location, data ownership, licences and exit (export) terms.
+ *Configure*: code lists, metadata schema, mandatory fields, naming validation, states and transitions, workflows, review periods, comment codes, notifications.
+ *Structure*: areas/workspaces per appointment and task team, WIP/Shared/Published/Archive areas, permission matrix by role and state.
+ *Integrate*: authoring tool connectors, federation/issue tools, MIDP/TIDP link, SSO, APIs.
+ *Template content*: title blocks with metadata fields, registers, transmittal templates, IDS files.
+ *Test* (ISO 19650-2 §5.5.3): upload, naming validation, full workflow cycle with each party, metadata transfer between solutions, model federation, permissions (including negative tests: can a subcontractor see restricted utility data?).
+ *Train* users by role, publish a CDE user guide (often a BEP appendix).
+ *Go live* and *audit* within the first weeks.

=== Operating and auditing the CDE

#datatable(
  columns: (1.4fr, 2.6fr),
  header: ("KPI / audit item", "Why"),
  [Naming and metadata compliance rate (at upload and by sample)], [Measures discipline; trends show where training is needed.],
  [First-time pass rate at check and at client review], [Quality of information; rework cost.],
  [Average and overdue review times], [Contractual risk (deemed acceptance, delay claims).],
  [MIDP delivery: planned vs actual per milestone], [Programme performance of information delivery.],
  [Containers in WIP past due date; containers shared but never published], [Hidden backlog.],
  [Permission audits and access logs], [ISO 19650-5 compliance; leavers removed.],
  [Superseded information still in use (downloads of superseded revisions)], [Safety and quality risk on site.],
)

=== Handover, archive and the AIM

At project close-out (§5.8) and handover:

- the *published* information that forms the AIM (as-built models, record drawings, O&M manuals, H&S file, asset data) is validated against the AIR and transferred to the owner's *asset systems* (EAM/CAFM, GIS, bridge/structure inventory, drainage database);
- the *archive* with its *journal* is retained for the contractual and legal retention period (often 12+ years for contracts executed as deeds in the UK, longer for H&S and structures);
- long-term formats are agreed (PDF/A for documents, IFC for models, CSV/XML for data) together with a *complete export* (files + metadata + journal), so the archive survives the end of a software licence.

=== Common failures

- *Folder-driven CDE*: meaning stored in folder paths; metadata empty; exports useless.
- *Status in the file name*: a rename at each transition breaks references and links.
- *Two truths*: the contractor's and client's CDEs disagree on the current revision.
- *WIP everywhere*: designers share via e-mail and file-transfer links outside the CDE; the audit trail has gaps.
- *Over-permissive access*: whole supply chain can see sensitive utility or security data.
- *No exit plan*: licence ends after handover and the journal cannot be exported.
- *Workflow too heavy*: ten-step approvals for model sharing kill the coordination rhythm, so teams bypass the CDE.

=== Checklist: CDE requirements for specification or evaluation

#datatable(
  columns: (0.25fr, 3fr, 0.4fr),
  header: ("", "Requirement", "✓"),
  [1], [Unique container IDs built from coded fields with delimiters; validation against code lists at upload.], [☐],
  [2], [Status, revision (and version) and classification attributes on every container; configurable code lists (UK NA, client-specific).], [☐],
  [3], [WIP / Shared / Published / Archived states with configurable transitions and role-based approval steps.], [☐],
  [4], [Recording of user and timestamp for every transition; immutable journal of all actions.], [☐],
  [5], [Container-level access control; sensitivity classes; external party access; permission audit reports.], [☐],
  [6], [Custom metadata (structure ID, chainage range, milestone, MIDP line, sensitivity) and search by metadata.], [☐],
  [7], [Review workflows with comment codes, due dates and contractual review periods; transmittals.], [☐],
  [8], [Viewers for IFC 4.3, large infra models, point clouds and drawings; markup; revision comparison.], [☐],
  [9], [BCF issue integration (file or BCF API).], [☐],
  [10], [MIDP/TIDP link and delivery dashboards.], [☐],
  [11], [Open APIs (openCDE Foundation/Documents, BCF API) and authoring-tool connectors.], [☐],
  [12], [Metadata-preserving exchange with other CDE solutions; documented mapping.], [☐],
  [13], [Data residency, encryption, SSO/MFA, backup, availability (ISO 19650-5, ISO 27001 of the provider).], [☐],
  [14], [Complete export (files + metadata + journal) in open formats; retention and legal hold.], [☐],
  [15], [Independent assurance where useful (e.g. BSI Kitemark for BIM software), plus a project-specific test during mobilisation.], [☐],
)

#builder[
  - Treat *metadata and state as the primary model* and files as payload. Validate names and metadata on upload, and never encode state in file names.
  - Implement the ISO 19650-2 §5.1.7 capabilities explicitly (unique ID, coded fields, status/revision/classification, transitions with user and date, container-level access), and make them demonstrable for certification.
  - Support *openCDE Foundation + Documents API* and *BCF API* to work in multi-CDE projects. Provide metadata mapping tools.
  - Add infrastructure metadata (chainage range, structure ID, line reference) and *spatial search* (find all containers touching Ch 2+300–2+600).
  - Provide KPI dashboards (compliance, review times, MIDP progress) and a *complete export* with journal.
]

#keypoints[
  - The CDE is a *workflow* (process) implemented by one or more *solutions* (technology). Design the workflow first.
  - ISO 19650-2 §5.1.7 sets the minimum capabilities: unique coded IDs, status/revision/classification, state transitions with user and date, container-level access.
  - Metadata, not folders, carries meaning. Infra projects need chainage and structure metadata too.
  - Multi-CDE projects need explicit metadata mapping and, increasingly, openCDE APIs.
  - Plan the end on day one: handover to asset systems, retention and a complete export.
]
