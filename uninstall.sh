#!/usr/bin/env bash

set -e

TARGET="/usr/local/bin/timelapse"

if [ -f "$TARGET" ]; then
    sudo rm "$TARGET"
    echo "timelapse removed."
else
    echo "timelapse is not installed."
fi