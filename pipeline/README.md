# pipeline/

Programme flow diagrams showing how TAHA's community-to-clinic cancer prevention model works.

## Files

| File | Description | Status |
|---|---|---|
| `cancer-prevention-pipeline-v1.html` | Interactive tabbed view — full pipeline, stepped-wedge, quick bullets | Published |
| `cancer-prevention-pipeline-v2.html` | Figure diagram matching proposal format, with AI node & figure caption | **Current** |

## Adding new versions

Copy the current file and increment the version number:
```bash
cp cancer-prevention-pipeline-v2.html cancer-prevention-pipeline-v3.html
```
Then update `../index.html` to add the new card and mark it as current.

## Figure caption (v2)

> **Figure 1.** Community-to-clinic cancer prevention pipeline (OCSI → HealthPod → AI-enabled decision support). Community Health Promoters (CHPs) enroll eligible community members continuously within Community Health Units (CHUs) using a browser-based digital prescreening tool (QR/web link) with automatic case assignment by CHU. A role-based console provides bounded AI decision support for prioritization, session booking into a monthly four-day HealthPod "Cancer Week," counseling scripts, follow-up tasking, and escalation triggers. During HealthPod sessions, nurses perform VIA/VILI and clinical breast examination (CBE), while a lab technician supports rapid FIT and targeted PSA testing; abnormal findings and red-flag profiles are routed to a clinician review queue for decisions and referral planning. Nazareth Hospital serves as the definitive care and treatment partner, receiving appropriate referrals and providing a feedback loop; follow-up and annual recall (e.g., annual FIT) are supported through closed-loop navigation, with equity mechanisms such as vouchers and future SHA integration.
