#!/usr/bin/env bash
set -uo pipefail

# Inputs
ENV_NAME=${1:-"dev"}
BASE_URL=${2:-"https://api.example.com"}
API_KEY=${3:-"dummy_api_key"}
ENCRYPTION_KEY=${4:-"dummy_encryption_key"}

TEMPLATE="lib/core/env/env_ci.dart"
OUT="lib/core/env/env_ci.g.dart"

echo "⚙️ Generating config for environment: $ENV_NAME"

# Check if required values are missing and warn
if [ -z "${2:-}" ] || [ -z "${3:-}" ]; then
    echo "⚠️ WARNING: BASE_URL or API_KEY is empty. Build might fail if these are required."
fi

# Ensure output directory exists
mkdir -p "$(dirname "$OUT")"

# Perform substitutions
sed -e "s|<<ENV_NAME>>|$ENV_NAME|g" \
    -e "s|<<BASE_URL>>|$BASE_URL|g" \
    -e "s|<<API_KEY>>|$API_KEY|g" \
    -e "s|<<ENCRYPTION_KEY>>|$ENCRYPTION_KEY|g" \
    "$TEMPLATE" > "$OUT"

echo "✅ Config successfully generated at $OUT"
