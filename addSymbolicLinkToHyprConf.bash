#!/usr/bin/env bash

if [ "$USER" = "root" ]; then
    echo "Do not run this script as root"
    exit 1
fi

directory="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

for config_file in "$directory"/hypr/*.conf; do
    base_name=$(basename "$config_file")
    target_path="/home/$USER/.config/hypr/$base_name"
    ln -sf "$config_file" "$target_path"
done
