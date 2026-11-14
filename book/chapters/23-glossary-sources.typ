#import "../template.typ": *

== Glossary, Sources and Further Study

=== Glossary of abbreviations

#{
  set text(size: 8.6pt)
  let rows = (
    ("AIA", "Auftraggeber-Informationsanforderungen: German equivalent of EIR"),
    ("AIM", "Asset Information Model: information model for the operational phase"),
    ("AIP", "Approval in Principle: agreed design basis of a highway structure (UK, CG 300)"),
    ("AIR", "Asset Information Requirements"),
    ("AwF", "Anwendungsfall: BIM use case (German frameworks)"),
    ("BAP", "BIM-Abwicklungsplan: German equivalent of BEP"),
    ("BBS", "Bar Bending Schedule"),
    ("BCF", "BIM Collaboration Format: open issue-exchange format"),
    ("BEP", "BIM Execution Plan (pre- and post-appointment)"),
    ("bSDD", "buildingSMART Data Dictionary"),
    ("CDE", "Common Data Environment"),
    ("ICDD", "Information Container for linked Document Delivery (ISO 21597)"),
    ("openCDE", "buildingSMART family of CDE APIs (Foundation, Documents, BCF)"),
    ("CR", "As-constructed record (status code, UK NA)"),
    ("CRS", "Coordinate Reference System"),
    ("CWR", "Continuous Welded Rail"),
    ("D&B", "Design and Build (contract form)"),
    ("DMRB", "Design Manual for Roads and Bridges (UK)"),
    ("EIR", "Exchange Information Requirements (formerly Employer's IR)"),
    ("FE / FEA", "Finite Element / Finite Element Analysis"),
    ("GA", "General Arrangement (drawing)"),
    ("HSLM", "High Speed Load Model (EN 1991-2)"),
    ("IDM", "Information Delivery Manual (ISO 29481)"),
    ("IDS", "Information Delivery Specification (buildingSMART)"),
    ("IFC", "Industry Foundation Classes (ISO 16739-1)"),
    ("ILM", "Incremental Launching Method"),
    ("LM1, LM71", "Eurocode road traffic Load Model 1; rail Load Model 71"),
    ("LOD", "Level of Detail / Development (legacy scales)"),
    ("LOIN", "Level of Information Need (ISO 7817-1, formerly EN 17412-1)"),
    ("LRFD", "Load and Resistance Factor Design (AASHTO)"),
    ("MIDP", "Master Information Delivery Plan"),
    ("MSS", "Movable Scaffolding System"),
    ("NA", "National Annex"),
    ("OIR", "Organisational Information Requirements"),
    ("OLE", "Overhead Line Equipment (rail electrification)"),
    ("PIM", "Project Information Model"),
    ("PIR", "Project Information Requirements"),
    ("PS&E", "Plans, Specifications and Estimate (US)"),
    ("PSC", "Prestressed Concrete"),
    ("SLS / ULS", "Serviceability / Ultimate Limit State"),
    ("SPMT", "Self-Propelled Modular Transporter"),
    ("TAA", "Technical Approval Authority (UK)"),
    ("TIDP", "Task Information Delivery Plan"),
    ("TM", "Traffic Management"),
    ("TS&L", "Type, Size and Location (US bridge design basis report)"),
    ("AGS / AGSi", "Association of Geotechnical & Geoenvironmental Specialists data formats (factual / interpreted)"),
    ("CBR", "California Bearing Ratio (subgrade strength)"),
    ("CPT", "Cone Penetration Test"),
    ("ELR", "Engineer's Line Reference (UK railway linear referencing)"),
    ("EPB", "Earth Pressure Balance (TBM type)"),
    ("ETCS / ERTMS", "European Train Control System / European Rail Traffic Management System"),
    ("GBR / GDR / GIR", "Geotechnical Baseline / Design / Ground Investigation Report"),
    ("msa / ESAL", "Million standard axles / Equivalent single axle loads (pavement design traffic)"),
    ("NRSWA", "New Roads and Street Works Act 1991 (UK)"),
    ("NUAR", "National Underground Asset Register (UK)"),
    ("PAS 128", "UK specification for underground utility detection, verification and location"),
    ("RRS", "Road Restraint System (safety barriers)"),
    ("S&C", "Switches and Crossings (railway turnouts)"),
    ("SCL / NATM", "Sprayed Concrete Lining / New Austrian Tunnelling Method"),
    ("SSD", "Stopping Sight Distance"),
    ("SUE", "Subsurface Utility Engineering (ASCE 38-22)"),
    ("SuDS", "Sustainable Drainage Systems"),
    ("TBM", "Tunnel Boring Machine"),
    ("TSI", "Technical Specifications for Interoperability (EU rail)"),
    ("WBS", "Work Breakdown Structure"),
    ("WIP", "Work in Progress (CDE state)"),
  )
  datatable(columns: (0.7fr, 3fr), header: ("Term", "Meaning"), ..rows.sorted(key: r => lower(r.at(0))).map(((a, b)) => ([*#a*], [#b])).flatten())
}

=== Sources consulted and recommended reading

The items below were used to write this book and are good next steps. Free documents are marked ★.

==== Information management

- ★ UK BIM Framework, *ISO 19650 Guidance Part 2: Processes for project delivery* (3rd ed.) and Guidance Parts 1, 3, A, C, D, E, F. #link("https://ukbimframework.org")[ukbimframework.org]. Part 2 PDF: #link("https://ukbimframework.org/wp-content/uploads/2020/02/ISO_19650_Guidance_Part_2_Processes_for_Project_Delivery_ThirdEdition.pdf")[direct link].
- ★ UK BIM Framework, *Guidance Part C: Facilitating the common data environment*, incl. Table NA.1 status codes. #link("https://www.ukbimframework.org/wp-content/uploads/2021/02/Guidance-Part-C_Facilitating-the-common-data-environment-workflow-and-technical-solutions_Edition-1.pdf")[PDF].
- ★ CDBB *BIM Toolkit*, *EIR guidance* and *BEP guidance* (Centre for Digital Built Britain): #link("https://www.cdbb.cam.ac.uk/files/eir_guidance.pdf")[EIR guidance], #link("https://www.cdbb.cam.ac.uk/files/bep_guidance.pdf")[BEP guidance].
- ISO 19650-1:2018, -2:2018, -3:2020, -4:2022, -5:2020, -6:2025 (ISO / BSI / national bodies). Overview: #link("https://en.wikipedia.org/wiki/ISO_19650")[Wikipedia: ISO 19650]; RICS on Part 6: #link("https://ww3.rics.org/uk/en/journals/construction-journal/iso-19650-part-6-health-safety.html")[article].
- On the ongoing revision: nima/BSI webinar summary #link("https://wearenima.im/proposed-changes-to-iso-19650-outlined-in-bsi-nima-webinar/")[wearenima.im], and the CEN presentation #link("https://www.en.une.org/normalizacion_documentos/Revision-of-EN-ISO-19650---David-Churcher.pdf")[Revision of EN ISO 19650 (D. Churcher)].
- ★ CDE specifics: DIN SPEC 91391-1/-2 (free from DIN Media): #link("https://www.dinmedia.de/en/technical-rule/din-spec-91391-1/302483139")[part 1], #link("https://dinmedia.de/en/technical-rule/din-spec-91391-2/302483177")[part 2]; buildingSMART openCDE APIs: #link("https://github.com/buildingSMART/foundation-API")[Foundation API], #link("https://github.com/buildingSMART/documents-API")[Documents API] (#link("https://www.buildingsmart.org/documents-api-receives-final-standard-approval/")[final standard announcement]), #link("https://github.com/buildingSMART/BCF-API")[BCF API]; NBS on #link("https://www.thenbs.com/knowledge/common-data-environments")[Common Data Environments]; Extranet Evolution on #link("https://extranetevolution.com/2020/01/common-approach-common-data-environments-cdes/")[CDE solutions vs workflows]; UCL review of #link("https://discovery.ucl.ac.uk/id/eprint/10186260/1/240129_SLR_con_in_published.pdf")[multiple CDEs] and CDE tool comparison #link("https://discovery-pp.ucl.ac.uk/id/eprint/10175122")[(Jaskula et al.)]; BSI Kitemark for BIM software: #link("https://constructionmanagement.co.uk/bsi-launches-kitemark-bim-software/")[launch article], #link("https://www.autodesk.com/blogs/construction/driving-digital-standards-autodesk-construction-cloud-achieves-bsi-kitemark-certification-for-iso-19650/")[Autodesk ACC certification].
- EN 17412-1:2020 and ISO 7817-1:2024, *Level of information need*. ISO 7817-2 (guidance, in development).
- ★ German examples: BIM Deutschland / Masterplan BIM Bundesfernstraßen; sample AIA and BAP templates, e.g. #link("https://fib-bund.de/Inhalt/Themen/BIM_fuer_Bundesbauten/BIM_AH_Muster-AIA.pdf")[Muster-AIA] and #link("https://fib-bund.de/Inhalt/Themen/BIM_fuer_Bundesbauten/BIM_AH_Muster-BAP.pdf")[Muster-BAP] (Bundesbau), use case profiles #link("https://fib-bund.de/Inhalt/Themen/BIM_fuer_Bundesbauten/2024-07_BIM_AH_AwF-Steckbriefe_2.0.pdf")[AwF-Steckbriefe 2.0].
- ★ Client EIR examples: Queensland TMR #link("https://www.tmr.qld.gov.au/_/media/busind/techstdpubs/road-planning-and-design/building-information-modelling/tmr-eir.pdf")[EIR]; TII Ireland #link("https://cdn.tii.ie/publications/GE-BIM-00101-01.pdf")[GE-BIM-00101]; Abu Dhabi #link("https://dmt.gov.ae/adm/-/media/Project/DMT/ADM/E-Library/0001-Jan-2022-Doc/ADM-BIM-002Documentation-Guidelines-for-Infrastructure-projects.pdf")[ADM BIM documentation guidelines for infrastructure].

==== OpenBIM for infrastructure

- ★ IFC 4.3 documentation (buildingSMART): #link("https://ifc43-docs.standards.buildingsmart.org")[ifc43-docs.standards.buildingsmart.org].
- ★ OSArch wiki on IFC alignment: #link("https://wiki.osarch.org/index.php/IFC_-_Industry_Foundation_Classes/IFC_alignment")[wiki.osarch.org].
- ★ AEC Magazine, *IFC for infrastructure*: #link("https://aecmag.com/collaboration/ifc-for-infrastructure/")[article]; Autodesk blog on IFC 4.3 for Civil 3D: #link("https://www.autodesk.com/blogs/aec/2023/05/12/whats-new-in-openbim-and-infrastructure-ifc-4-3-for-civil-3d/")[article].
- ★ buildingSMART IDS 1.0 and bSDD documentation (`technical.buildingsmart.org`).

==== Bridges

- ★ FHWA, *Bridge Information Modeling Standardization* (FHWA-HIF-16-011, 4 volumes): #link("https://www.fhwa.dot.gov/bridge/pubs/hif16011/hif16011d.pdf")[vol. 4]; and the digital delivery demonstration report FHWA-HIF-21-031: #link("https://www.fhwa.dot.gov/bridge/pubs/hif21031.pdf")[PDF].
- ★ ASPIRE magazine (concrete bridges, free): BIM for bridge project delivery, Spring 2026: #link("https://www.aspirebridge.com/magazine/2026Spring/PERSPECTIVE-Beyond3DModelsBimForBridgeProjectDelivery.pdf")[article]; AASHTO LRFD changes articles.
- AASHTO, *LRFD Bridge Design Specifications*, 10th edition (2024): #link("https://aashtojournal.transportation.org/?p=35206")[AASHTO Journal announcement]. ★ North Dakota DOT summary of 10th-edition changes: #link("https://www.dot.nd.gov/sites/www/files/documents/Bridge/AASHTO-10th-Edition-Updates-Olds.pdf")[PDF].
- EN 1991-2:2023 (second-generation Eurocode, traffic loads on bridges): #link("https://knowledge.bsigroup.com/products/eurocode-1-actions-on-structures-traffic-loads-on-bridges")[BSI page], with EN 1990, EN 1992-2, EN 1993-2, EN 1994-2, EN 1998-2.
- ★ National Highways *Standards for Highways* (DMRB, incl. CG 300 Technical approval and CD 350): #link("https://www.standardsforhighways.co.uk")[standardsforhighways.co.uk]. Council guidance on technical approval (e.g. Essex Highways, Herefordshire) explains AIP submissions in plain language.
- ★ Freyssinet, *Construction methods portfolio*: #link("https://www.freyssinet.com/solution/build/bridge-deck-construction/")[bridge deck construction]; BBR Network, construction methods: #link("https://www.bbrnetwork.com/technologies/construction-methods/")[page].
- ★ M. Rosignoli, *Bridge erection machines* (WSDOT presentation): #link("https://wsdot.wa.gov/eesc/bridge/WBES/2007/assets/tuesday/8B/Marco_Rosignoli_8B.pdf")[PDF].
- Books (not free, highly recommended): Hambly, *Bridge Deck Behaviour*; O'Brien, Keogh & O'Connor, *Bridge Deck Analysis*; Chen & Duan (eds.), *Bridge Engineering Handbook*; Ryall, Parke & Harding, *Manual of Bridge Engineering* (ICE); Hewson, *Prestressed Concrete Bridges: Design and Construction*; Rosignoli, *Bridge Construction Equipment*; Iles, *Design guide for composite highway bridges* (SCI P356); Steel Bridge Group guidance notes (SCI).

==== Roads, railways, geotechnics, drainage, utilities and tunnels

- ★ AASHTO Journal, 7th edition of the Green Book: #link("https://aashtojournal.transportation.org/aashto-releases-7th-edition-of-its-highway-street-design-green-book/")[article]; FHWA memo on adoption: #link("https://www.fhwa.dot.gov/design/standards/190510.pdf")[PDF].
- ★ UK DMRB (CD 109, CD 127, CD 225/226 pavement, CG 501 and CD 521 drainage, CD 622 geotechnical risk) at #link("https://www.standardsforhighways.co.uk")[standardsforhighways.co.uk].
- ★ Comparison of AASHTO 1993 and MEPDG pavement design (example study): #link("https://link.springer.com/content/pdf/10.1007%2Fs41062-017-0067-6.pdf")[Springer PDF].
- EN 13803:2017 *Railway applications — Track alignment design parameters*: #link("https://iteh.es/catalog/standards/sist/f2d61b2d-6b37-466d-927a-715f1215b61d/sist-en-13803-2017")[catalogue entry]; TSI INF / ENE / CCS / SRT on EUR-Lex.
- ★ Rail electrification BIM: Bentley #link("https://www.bentley.com/software/openrail-overhead-line-designer/")[OpenRail Overhead Line Designer]; Furrer+Frey #link("https://www.furrerfrey.ch/en/service/elff-bim/")[ELFF & BIM].
- ★ Eurocode 7 second generation: JRC training materials #link("https://eurocodes.jrc.ec.europa.eu/news/new-training-materials-available-second-generation-eurocode-7")[eurocodes.jrc.ec.europa.eu]; ISSMGE paper by C. Moormann #link("https://www.issmge.org/uploads/publications/51/135/54._C_Moormann.pdf")[PDF].
- ★ AGS data format: #link("https://www.bgs.ac.uk/ngdc/?p=518")[BGS page] and the AGS website (agsi and AGS 4 specifications).
- ★ Tunnels & Tunnelling, *Guidance on writing a GBR*: #link("https://www.tunnelsandtunnelling.com/analysis/guidance-on-writing-a-gbr-8101223/")[article].
- ★ CIRIA *The SuDS Manual (C753)* (free download from CIRIA/susdrain); susdrain fact sheet on climate change allowances: #link("https://www.susdrain.org/files/resources/fact_sheets/applying_climate_change_allowances_to_suds_design_draft.pdf")[PDF]; FHWA HEC-22 and HDS-5 (free).
- ★ PAS 128:2022 client guides: CICES #link("https://www.cices.org/hawkfile/386/original/PAS128%20Client%20Specification%20Guide%20Sep%2022%20final.pdf")[client specification guide]; TSA #link("https://www.tsa-uk.org.uk/media/2025/05/TSA-PAS128-Client-Guide_Issue-3_LR-Page01.pdf")[client guide (Issue 3)].
- ★ ASCE 38-22 quality levels explained: #link("https://www.mckissock.com/blog/land-surveyor/utility-mapping-for-surveyors-a-guide-to-sue-and-asce-38-22/")[McKissock guide]; MassDOT SUE policy: #link("https://www.mass.gov/doc/policy-directive-e-26-002-massdot-requirements-for-performing-subsurface-utility-engineering-investigations/download")[directive].
- ★ EU Directive 2004/54/EC on road tunnel safety: #link("https://eur-lex.europa.eu/summary/EN/legissum:l24146")[EUR-Lex summary]; PIARC copy #link("https://tunnels.piarc.org/sites/tunnels/files/public/wysiwyg/import/Other%20documents/European%20Directive%20En.pdf")[PDF].
- ★ Tunnelling methods overview: Dr. Sauer & Partners #link("https://dr-sauer.com/faqs/when-and-why-choose-natm-over-tbm-and-cut-and-cover-tunnelling-techniques")[NATM vs TBM vs cut & cover]; MEED #link("https://www.meed.com/tunnelling-techniques/")[tunnelling techniques].
- ★ Tunnel BIM and settlement research: Ninić et al. 2023, real-time tunnelling damage assessment in BIM: #link("https://research.birmingham.ac.uk/files/212195543/NinicJ2023Real-time.pdf")[PDF]; Huang et al. 2025, TBM tunnel digitalisation platform: #link("https://strathprints.strath.ac.uk/93283/7/Huang-etal-EG-ICE-2025-Digitalisation-platform-for-modelling-TBM-tunnel.pdf")[PDF]; TUM IFC-Tunnel project: #link("https://www.cee.ed.tum.de/ccbe/research/research-fields/building-information-modeling-in-infrastructure/ifc-tunnel/")[page].
- Books: Wright & Dixon, *Highway Engineering*; Profillidis, *Railway Management and Engineering*; Esveld, *Modern Railway Track*; Clayton, Matthews & Simons, *Site Investigation*; Butler & Davies, *Urban Drainage*; Chapman, Metje & Stärk, *Introduction to Tunnel Construction*; Guglielmetti et al., *Mechanized Tunnelling in Urban Areas*.

==== 4D

- ★ FHWA guide on creating and maintaining 4D models (2016): #link("https://www.fhwa.dot.gov/construction/3d/hif17002.pdf")[hif17002.pdf].
- ★ Port Authority of NY & NJ: #link("https://www.panynj.gov/content/dam/port-authority/pdfs/-available-engineering-documents/BIM-Standards.pdf")[BIM Standard] (sections on the 4D simulation model and 4D simulation report), #link("https://www.panynj.gov/content/dam/port-authority/pdfs/-available-engineering-documents/VDC-Requirements-for-Design-Build.pdf")[VDC Requirements for Design-Build], #link("https://www.panynj.gov/content/dam/port-authority/business-opportunities/pdf/CMD-BIM%20Standard%20Manual.pdf")[CMD BIM Standard Manual] (4D model requirements).
- ★ BIM4Water, *Supporting 4D through EIR*: #link("https://wearenima.im/wp-content/uploads/2025/06/bim4water_-_supporting_4d_pr.pdf")[PDF].
- ★ AEC Magazine, *4D: in the driving seat* (A19/A1058 Coast Road case study): #link("https://aecmag.com/civil-engineering/4d-in-the-driving-seat-bim-academy-4dmodelling/")[article].
- ★ National Academies (TRB), *Lifecycle BIM for Infrastructure* (2023): #link("https://www.nationalacademies.org/read/26731/chapter/5")[chapter 5].
- CIOB, *Guide to Good Practice in the Management of Time in Major Projects* (2nd ed., 2018); AACE International Recommended Practices; Penn State *BIM Project Execution Planning Guide*.

=== A suggested study path (12 weeks, ~4–5 h/week)

#datatable(
  columns: (0.7fr, 3fr),
  header: ("Weeks", "Activity"),
  [1–2], [Read Part I (Chapters 1–6). Then read UK BIM Framework Guidance Part 2 alongside ISO 19650-2. Download the UK templates (EIR, BEP, responsibility matrix, TIDP/MIDP).],
  [3], [Take a real EIR (TMR, TII or a past project) and write a mock pre-appointment BEP response for a small highway scheme. Use the checklist in §3.10.],
  [4], [Write a LOIN table for 5 infra object types × 2 milestones and convert it to an IDS file; test it with an IDS checker on a sample IFC 4.3 file.],
  [5], [Read Chapters 7–8. Visit (or virtually explore) 3–4 bridges you know and classify them: type, spans, bearings, construction method.],
  [6–7], [Read Chapters 9–11. Get a real bridge drawing set (many DOTs publish standard drawings; e.g. AISC/NSBA standard plans for steel bridges) and identify every item from the drawing table. Try a free tool such as PGSuper or OpenBrIM to model a simple girder bridge.],
  [8–9], [Read Part III (Chapters 12–17), one chapter per evening; for each, run its checklist against a model from one of your past projects.],
  [10], [Read Part IV. Build a mini 4D: a two-span overbridge model + a 40-activity programme in a trial 4D tool; produce the deliverable package of §19.4.],
  [11–12], [Run your own software through the reference project in Chapter 22; turn the gaps into backlog items.],
)

#v(1cm)
#align(center, text(font: heading-font, size: 9pt, fill: muted)[— End —])
