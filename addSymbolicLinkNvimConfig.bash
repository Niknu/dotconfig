#!/usr/bin/env bash

if [ "$USER" = "root" ]; then
    echo "Do not run this script as root"
    exit 1
fi

directory="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

configFilePath="/nvim/lua/config/options.lua"

target_path="/home/$USER/.config$configFilePath"

ln -sf ""$directory$configFilePath "$target_path"
