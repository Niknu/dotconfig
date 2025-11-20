#!/usr/bin/env bash

if [ "$USER" = "root" ]; then
    echo "Do not run this script as root"
    exit 1
fi

directory="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

ln -s  "$directory"/.gitconfig /home/"$USER"/.gitconfig 

