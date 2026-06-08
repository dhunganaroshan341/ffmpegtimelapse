#!/usr/bin/env bash

set -e

INSTALL_DIR="/usr/local/bin"
TARGET="$INSTALL_DIR/timelapse"

echo "Installing timelapse..."

if ! command -v ffmpeg >/dev/null 2>&1; then
    echo ""
    echo "Warning: FFmpeg is not installed."
    echo "Install it with:"
    echo "sudo apt install ffmpeg"
    echo ""
fi

sudo mkdir -p "$INSTALL_DIR"
sudo cp bin/timelapse "$TARGET"
sudo chmod +x "$TARGET"

echo ""
echo "Installation complete."
echo ""
echo "Run:"
echo "timelapse"