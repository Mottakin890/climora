#!/usr/bin/env bash
set -euo pipefail

ENV_NAME=${1:-}
BASE_URL=${2:-}
ENCRYPTION_KEY=${3:-}

TEMPLATE="lib/core/env/env_ci.dart"
OUT="lib/core/env/env_ci.g.dart"

if [ -z "$ENV_NAME" ] || [ -z "$BASE_URL" ] || [ -z "$ENCRYPTION_KEY" ]; then
    echo "Usage: $0 <env-name> <base-url> <encryption-key>"
    exit 2
fi

# Ensure output directory exists (though it should)
mkdir -p "$(dirname "$OUT")"

# Perform substitutions
sed -e "s|<<BASE_URL>>|$BASE_URL|g" \
    -e "s|<<ENCRYPTION_KEY>>|$ENCRYPTION_KEY|g" \
    -e "s|<<ENV_NAME>>|$ENV_NAME|g" \
    "$TEMPLATE" > "$OUT"

echo "Generated config for $ENV_NAME"
