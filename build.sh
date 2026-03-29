#!/bin/bash
# Build DOOM for MAGI
# Usage: ./build.sh [path/to/DOOM1.WAD]

set -e

cat \
  doom/math.magi \
  doom/constants.magi \
  doom/wad.magi \
  doom/map.magi \
  doom/texture.magi \
  doom/bsp.magi \
  doom/render.magi \
  doom/player.magi \
  doom/things.magi \
  doom/enemy.magi \
  doom/weapon.magi \
  doom/doors.magi \
  doom/sound.magi \
  doom/hud.magi \
  doom/tables.magi \
  doom/main.magi \
  > doom_combined.magi

echo "Combined: $(wc -l < doom_combined.magi) lines"

if command -v magi &> /dev/null; then
    echo "Running with magi interpreter..."
    magi run doom_combined.magi "${1:-DOOM1.WAD}"
else
    echo "magi not found. Install MAGI first."
    exit 1
fi
