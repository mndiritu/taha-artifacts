#!/bin/bash
# =============================================================
# setup-github.sh
# Idempotent — safe to re-run if a previous attempt partially
# succeeded. Checks for existing repo and existing git remote.
#
# Prerequisites:
#   gh CLI installed and authenticated  (gh auth login)
#   git installed and SSH key added to GitHub
#
# Usage:
#   cd taha-artifacts
#   chmod +x setup-github.sh
#   ./setup-github.sh
# =============================================================

set -e

REPO_NAME="taha-artifacts"
GITHUB_USER="mndiritu"    # ← change if pushing under an org
REMOTE_URL="git@github.com:$GITHUB_USER/$REPO_NAME.git"

echo ""
echo "╔══════════════════════════════════════════╗"
echo "║  TAHA Artifacts — GitHub Setup           ║"
echo "╚══════════════════════════════════════════╝"
echo ""

# 1. Initialise git if not already initialised
if [ ! -d ".git" ]; then
  echo "→ Initialising git..."
  git init
  git add .
  git commit -m "Initial commit: TAHA artifacts repository

- index.html landing page with filterable artifact grid
- pipeline/cancer-prevention-pipeline-v1.html (interactive tabs)
- pipeline/cancer-prevention-pipeline-v2.html (figure diagram)
- assets/taha-brand.css shared brand variables
- Folder READMEs for all five categories
- .gitignore"
else
  echo "→ Git already initialised — skipping init."
  git add .
  git diff --cached --quiet || git commit -m "Update artifacts"
fi

# 2. Create GitHub repo only if it doesn't already exist
echo ""
if gh repo view "$GITHUB_USER/$REPO_NAME" > /dev/null 2>&1; then
  echo "→ Repository $GITHUB_USER/$REPO_NAME already exists — skipping creation."
else
  echo "→ Creating GitHub repository..."
  gh repo create "$GITHUB_USER/$REPO_NAME" \
    --public \
    --description "TAHA visual artifacts, interactive diagrams and stakeholder materials"
  echo "   Created."
fi

# 3. Set remote (replace if already pointing elsewhere)
echo ""
echo "→ Configuring remote origin..."
if git remote get-url origin > /dev/null 2>&1; then
  CURRENT=$(git remote get-url origin)
  if [ "$CURRENT" != "$REMOTE_URL" ]; then
    echo "   Updating remote from $CURRENT"
    git remote set-url origin "$REMOTE_URL"
  else
    echo "   Remote already set correctly."
  fi
else
  git remote add origin "$REMOTE_URL"
  echo "   Remote added."
fi

# 4. Push
echo ""
echo "→ Pushing to GitHub..."
git branch -M main
git push -u origin main

# 5. Enable GitHub Pages via REST API
echo ""
echo "→ Enabling GitHub Pages..."
gh api \
  --method POST \
  -H "Accept: application/vnd.github+json" \
  "/repos/$GITHUB_USER/$REPO_NAME/pages" \
  -f "source[branch]=main" \
  -f "source[path]=/" \
  && echo "   Pages enabled." \
  || echo "   Pages may already be enabled, or activate manually (see below)."

echo ""
echo "╔══════════════════════════════════════════════════════════╗"
echo "║  Done!                                                   ║"
echo "║                                                          ║"
echo "║  Repository:                                             ║"
echo "║  https://github.com/$GITHUB_USER/$REPO_NAME             ║"
echo "║                                                          ║"
echo "║  GitHub Pages (live in ~60 seconds):                     ║"
echo "║  https://$GITHUB_USER.github.io/$REPO_NAME/             ║"
echo "║                                                          ║"
echo "║  If Pages didn't auto-enable:                            ║"
echo "║  GitHub repo → Settings → Pages                         ║"
echo "║  Source: Deploy from branch                              ║"
echo "║  Branch: main   Folder: / (root)   → Save               ║"
echo "╚══════════════════════════════════════════════════════════╝"
echo ""
