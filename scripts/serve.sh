#!/usr/bin/env bash
set -euo pipefail

PROJECT_ROOT="$(cd "$(dirname "$0")/.." && pwd)"

echo "Serving site at http://localhost:8080"
echo "Press Ctrl+C to stop."
podman run --rm -p 8080:80 \
  -v "$PROJECT_ROOT/src":/usr/share/nginx/html:ro,z \
  docker.io/nginx:alpine
