---
name: changelog-update
description: Always update CHANGELOG.md after making code or documentation changes when CHANGELOG.md exists in the repo. Add a concise entry under an Unreleased section or create one if missing.
metadata:
  short-description: Require CHANGELOG.md updates
---

# Changelog Update

Use this skill on every non-trivial change when a `CHANGELOG.md` file exists in the repo.

## Workflow

1) Check for `CHANGELOG.md` at repo root.
2) If it exists, update it for the current change set.
3) Prefer an `Unreleased` section. If missing, add it at the top.
4) Keep entries concise and grouped (Added/Changed/Fixed).

## Notes

- If the user provides a version/date, use them. Otherwise keep entries under `Unreleased`.
- If the user explicitly says not to update the changelog, confirm and skip.
