---
name: installation-test
description: Run the installation smoke test for this repo after major changes by building and starting docker compose, then verifying /fhir/metadata and /ui.
metadata:
  short-description: Installation smoke test via docker compose
---

# Installation Test

Use this skill after major changes to confirm the server still builds and runs.

## Workflow

1) From the repo root, run the script:

```
/home/marti/.codex/skills/installation-test/scripts/run.sh
```

2) If it fails, capture the command output and report the first error plus the last 50 lines of `docker compose logs -f server`.

## Notes

- Assumes `docker compose` is installed and the repo has `docker-compose.yml`.
- Uses `curl` for smoke checks; on Windows PowerShell, `curl.exe` is required.
