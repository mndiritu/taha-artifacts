# taha-artifacts

**Tujali Afya Health Alliance — Visual Artifacts & Interactive Documents**

This repository holds shareable HTML artifacts produced for TAHA's programme communications, partnership development, governance, and stakeholder engagement. Artifacts are published via **GitHub Pages** and can be shared as direct links — no login or technical setup required for viewers.

🔗 **Live index:** https://mndiritu.github.io/taha-artifacts/

---

## Quick links

| Artifact | Category | Version | Link |
|---|---|---|---|
| Cancer Prevention Pipeline (interactive tabs) | Pipeline | v1 | [view](https://mndiritu.github.io/taha-artifacts/pipeline/cancer-prevention-pipeline-v1.html) |
| Cancer Prevention Pipeline (figure diagram) | Pipeline | v2 | [view](https://mndiritu.github.io/taha-artifacts/pipeline/cancer-prevention-pipeline-v2.html) |

---

## Repository structure

```
taha-artifacts/
│
├── index.html                      ← Public-facing directory (GitHub Pages root)
│
├── pipeline/                       ← Programme flow diagrams
├── governance/                     ← Board packs, governance documents
├── partnerships/                   ← MoU summaries, partner briefs
├── screening-programs/             ← HealthPod, Cancer Week, service delivery
├── communications/                 ← Donor updates, stakeholder comms
│
└── assets/
    ├── taha-brand.css              ← Shared brand variables & utility classes
    └── logo.svg                    ← TAHA logo (add when available)
```

---

## Adding a new artifact

1. Place the `.html` file in the appropriate category folder.
2. Use descriptive kebab-case filenames with a version suffix: `cancer-week-overview-v1.html`
3. Link the shared brand stylesheet near the top of `<head>`:
   ```html
   <link rel="stylesheet" href="../assets/taha-brand.css">
   ```
4. Update the **Quick links** table above and the `index.html` card grid.
5. Commit and push — GitHub Pages publishes automatically within ~60 seconds.

### Versioning convention

- Never overwrite an existing artifact file — old links must keep working.
- Increment the version suffix: `-v1`, `-v2`, `-v3`.
- The `README.md` in each folder notes which version is current.

---

## GitHub Pages setup

Pages is served from the `main` branch root (`/`). To enable (one-time):

```bash
gh repo create mndiritu/taha-artifacts --public
gh repo edit mndiritu/taha-artifacts --enable-pages --pages-branch main
```

Or via GitHub UI: **Settings → Pages → Source: Deploy from branch → main / (root)**.

---

## Local preview

No build step required — open any `.html` file directly in a browser, or serve the root:

```bash
cd taha-artifacts
python3 -m http.server 8000
# visit http://localhost:8000
```

---

## Sensitive documents

This is a **public** repository. Do not commit:
- Patient data or identifiable health information
- Full MoU or contract text
- Financial statements or audit reports
- Internal staff or donor personal details

Use visual summaries and redacted versions only.

---

## License

Content © Tujali Afya Health Alliance. All rights reserved.  
NGO Registration: NGO-BWUJDK4 · Kenya
