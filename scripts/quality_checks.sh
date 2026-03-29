#!/usr/bin/env bash
set -euo pipefail

echo "Running quality checks"

dart format --output=none --set-exit-if-changed .
flutter analyze
flutter test --no-pub --coverage

if command -v dart_code_metrics >/dev/null 2>&1; then
    dart_code_metrics analyze lib --reporter=console || true
fi

echo "✅ Quality checks passed"
