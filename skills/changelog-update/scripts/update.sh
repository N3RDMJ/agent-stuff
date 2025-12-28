#!/usr/bin/env bash
set -euo pipefail

if [[ ! -f CHANGELOG.md ]]; then
  echo "CHANGELOG.md not found."
  exit 0
fi

echo "Edit CHANGELOG.md to reflect the latest changes."
