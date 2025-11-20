#!/usr/bin/env bash

if [ "$USER" = "root" ]; then
    echo "Do not run this script as root"
    exit 1
fi

directory="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

ln -sf "$directory"/hypr/bindings.conf /home/"$USER"/.config/hypr/bindings.conf
ln -sf "$directory"/hypr/input.conf /home/"$USER"/.config/hypr/input.conf
ln -sf "$directory"/hypr/monitors.conf /home/"$USER"/.config/hypr/monitors.conf