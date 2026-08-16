#!/bin/bash
set -e

ROOT=$(pwd)

# Build wavedrom.min.js from the git dependency source.
# esbuild is hoisted to the top-level node_modules/.bin, so add it to PATH
# for the child process that wavedrom's dist.min script spawns.
export PATH="$ROOT/node_modules/.bin:$PATH"
cd node_modules/wavedrom
bun run dist.min
cd "$ROOT"

# Copy artifacts to site root
cp node_modules/wavedrom/wavedrom.min.js .
mkdir -p skins
cp node_modules/wavedrom/skins/*.js skins/
