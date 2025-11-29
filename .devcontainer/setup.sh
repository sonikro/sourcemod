#!/usr/bin/env bash

set -e

echo "=== SourceMod Development Container Setup ==="

echo "Initializing git submodules..."
cd /workspaces/sourcemod || cd "${WORKSPACE_FOLDER}" || cd "$(pwd)"
git submodule update --init --recursive

echo "Checking out dependencies..."
if [ -f "tools/checkout-deps.sh" ]; then
    echo "Running checkout-deps.sh to download Metamod:Source and HL2SDKs..."
    # checkout-deps.sh needs to be run from the parent directory
    cd /workspaces
    bash sourcemod/tools/checkout-deps.sh -s csgo,css,tf2,l4d2
    cd sourcemod
else
    echo "Warning: checkout-deps.sh not found, skipping dependency checkout"
fi

echo ""
echo "=== Setup Complete ==="
echo ""
echo "To build SourceMod:"
echo "  1. Create a build directory: mkdir build && cd build"
echo "  2. Configure the project: python3 ../configure.py --enable-optimize"
echo "  3. Build: ambuild"
echo ""
echo "Additional configure options:"
echo "  --hl2sdk-root=PATH     Root search folder for HL2SDKs"
echo "  --mms-path=PATH        Path to Metamod:Source"
echo "  --mysql-path=PATH      Path to MySQL 5 (32-bit)"
echo "  --mysql64-path=PATH    Path to 64-bit MySQL 5"
echo "  --no-mysql             Disable building MySQL extension"
echo "  --enable-debug         Enable debugging symbols"
echo "  --enable-optimize      Enable optimization"
echo "  -s, --sdks             Build against specified SDKs"
echo ""
