#!/usr/bin/env bash
set -euo pipefail

#devcontainer build --config .devcontainer/devcontainer.json --workspace-folder . -- bash &&
#    devcontainer up --config .devcontainer/devcontainer.json --workspace-folder . -- bash &&
#    devcontainer exec --config .devcontainer/devcontainer.json --workspace-folder . -- bash

if [[ -z "${1:-}" ]]; then
    CONFIG=".devcontainer/devcontainer.json"
else
    NAME="$1"
    CONFIG=".devcontainer/${NAME}/devcontainer.json"
fi

if [[ ! -f "$CONFIG" ]]; then
    echo "Error: config not found: $CONFIG" >&2
    exit 1
fi

echo "Using config:   $CONFIG"

devcontainer build \
    --config "$CONFIG" \
    --workspace-folder .

devcontainer up \
    --config "$CONFIG" \
    --workspace-folder .

devcontainer exec \
    --config "$CONFIG" \
    --workspace-folder . \
    -- bash
