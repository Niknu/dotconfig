#!/usr/bin/env bash

if [ "$USER" = "root" ]; then
    echo "Do not run this script as root"
    exit 1
fi

directory="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

configPath="nvim/lua/plugins"

for config_file in "$directory/$configPath"/*.lua; do
    base_name=$(basename "$config_file")
    target_path="/home/$USER/.config/$configPath/$base_name"
    ln -sf "$config_file" "$target_path"
done
