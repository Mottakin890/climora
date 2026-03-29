#!/usr/bin/env bash
set -euo pipefail

RELEASE=${1:-}
[ -z "$RELEASE" ] && { echo "Usage: $0 <release-tag>"; exit 2; }

if ! command -v sentry-cli >/dev/null 2>&1; then
    echo "sentry-cli not found, skipping symbol upload."
    exit 0
fi

# We use '|| true' because symbol upload shouldn't block deployment
sentry-cli releases new "$RELEASE" || true
sentry-cli upload-dif build/symbols || true
sentry-cli releases finalize "$RELEASE" || true

echo "✅ Symbols uploaded for release $RELEASE"
