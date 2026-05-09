#!/usr/bin/env bash
# =============================================================
# ลงทุนไดอารี่ · AI 101 Welcome Pack rebuild
# Renders welcome.html into ../Welcome.pdf using Playwright (Chromium).
# Run from anywhere; uses script-relative paths.
# =============================================================
set -euo pipefail

HERE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
HTML="$HERE/welcome.html"
OUT="$HERE/../Welcome.pdf"

if [ ! -f "$HTML" ]; then
  echo "ERROR: $HTML not found" >&2
  exit 1
fi

# Make Playwright resolvable from globally-installed npm modules.
if command -v npm >/dev/null 2>&1; then
  NPM_GLOBAL_ROOT="$(npm root -g 2>/dev/null || true)"
  if [ -n "$NPM_GLOBAL_ROOT" ]; then
    export NODE_PATH="${NODE_PATH:-}${NODE_PATH:+:}$NPM_GLOBAL_ROOT"
  fi
fi

# Try Playwright first (best Thai/webfont support).
if node -e "require('playwright')" >/dev/null 2>&1; then
  echo "[build] Rendering with Playwright Chromium..."
  node "$HERE/render.js" "$HTML" "$OUT"
elif [ -x "/Applications/Google Chrome.app/Contents/MacOS/Google Chrome" ]; then
  echo "[build] Rendering with headless Chrome (fallback)..."
  "/Applications/Google Chrome.app/Contents/MacOS/Google Chrome" \
    --headless \
    --disable-gpu \
    --no-pdf-header-footer \
    --print-to-pdf="$OUT" \
    --print-to-pdf-no-header \
    --virtual-time-budget=10000 \
    "file://$HTML"
else
  echo "ERROR: no renderer available (install playwright globally or Google Chrome)" >&2
  exit 1
fi

echo "[build] Done -> $OUT"
ls -lh "$OUT"
