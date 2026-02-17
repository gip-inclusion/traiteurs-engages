#!/usr/bin/env bash
set -euo pipefail

PROJECT_ROOT="$(cd "$(dirname "$0")/.." && pwd)"

echo "Building Tailwind CSS..."
podman run --rm \
  --userns=keep-id \
  -v "$PROJECT_ROOT":/app:z \
  docker.io/node:22-alpine \
  sh -c "
    cd /tmp && npm install tailwindcss @tailwindcss/cli &&
    NODE_PATH=/tmp/node_modules npx tailwindcss -i /app/src/input.css -o /app/src/tailwind.css --minify
  "

echo "Done → src/tailwind.css"
