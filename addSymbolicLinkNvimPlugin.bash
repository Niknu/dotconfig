#!/usr/bin/env bash

if [ "$USER" = "root" ]; then
  echo "Do not run this script as root"
  exit 1
fi

directory="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

pluginsPath="nvim/lua/plugins"

for plugin_file in "$directory/$pluginsPath"/*.lua; do
  base_name=$(basename "$plugin_file")
  target_path="/home/$USER/.config/$pluginsPath/$base_name"
  ln -sf "$plugin_file" "$target_path"
done
