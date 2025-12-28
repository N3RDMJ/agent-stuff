#!/usr/bin/env bash
set -euo pipefail

root="$(pwd)"
if [[ ! -f "${root}/docker-compose.yml" ]]; then
  echo "docker-compose.yml not found in ${root}" >&2
  exit 1
fi

docker compose down

docker compose build --no-cache server

docker compose up -d server

# Allow server to boot.
sleep 3

base_url="http://localhost:18080"

if command -v curl >/dev/null 2>&1; then
  curl -fsS "${base_url}/fhir/metadata" >/dev/null
  curl -fsS "${base_url}/ui" >/dev/null
else
  # Windows PowerShell environments should use curl.exe; skip if unavailable.
  if command -v curl.exe >/dev/null 2>&1; then
    curl.exe -fsS "${base_url}/fhir/metadata" >/dev/null
    curl.exe -fsS "${base_url}/ui" >/dev/null
  else
    echo "curl or curl.exe is required for smoke checks" >&2
    exit 1
  fi
fi

echo "Installation smoke test passed."
