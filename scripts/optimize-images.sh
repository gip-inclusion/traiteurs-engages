#!/usr/bin/env bash
set -euo pipefail

PROJECT_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
IMG_DIR="src/assets/images"

echo "Optimizing images (PNG → WebP)..."
podman run --rm \
  -v "$PROJECT_ROOT/$IMG_DIR":/imgs \
  docker.io/alpine:3.21 \
  sh -c '
    apk add --no-cache libwebp-tools > /dev/null 2>&1
    for f in /imgs/*.png; do
      name=$(basename "$f")
      if [ "$name" = "favicon.png" ]; then
        echo "  SKIP $name (favicon)"
        continue
      fi
      out="${f%.png}.webp"
      cwebp -q 80 "$f" -o "$out"
      echo "  OK $name"
    done
  '

# Show results
echo ""
echo "Results:"
for f in "$PROJECT_ROOT/$IMG_DIR"/*.png; do
  name=$(basename "$f")
  [ "$name" = "favicon.png" ] && continue
  webp="${f%.png}.webp"
  if [ -f "$webp" ]; then
    old=$(stat -c%s "$f")
    new=$(stat -c%s "$webp")
    ratio=$(( 100 - (new * 100 / old) ))
    echo "  $name ($((old/1024)) Ko) → $(basename "$webp") ($((new/1024)) Ko)  -${ratio}%"
    rm "$f"
  else
    echo "  FAIL $name (WebP not created)"
  fi
done

echo ""
echo "Done."
