# SourceMod Development Container

This devcontainer provides a complete development environment for building SourceMod.

## What's Included

- **Ubuntu 22.04** base image with C++ development tools
- **GCC 11** (supports C++17 required by SourceMod)
- **Python 3.11** with pip
- **AMBuild 2.2+** (automatically installed)
- **32-bit and 64-bit build support** (multilib)
- **VS Code extensions** for C++, Python, and Git

## Getting Started

### Prerequisites

- Docker Desktop or Docker Engine
- Visual Studio Code with Dev Containers extension

### Opening the Project

1. Open the SourceMod folder in VS Code
2. When prompted, click "Reopen in Container" or run the command "Dev Containers: Reopen in Container"
3. Wait for the container to build and setup to complete (first time may take several minutes)

### Building SourceMod

Once the container is ready:

```bash
mkdir build
cd build
python3 ../configure.py --enable-optimize
ambuild
```

### Build Configuration Options

Configure the build with various options:

```bash
python3 ../configure.py [options]
```

**Common options:**
- `--enable-optimize` - Enable optimization (recommended for releases)
- `--enable-debug` - Enable debugging symbols
- `--no-mysql` - Disable building MySQL extension
- `--sdks=csgo,css,tf2` - Build against specific Source engine SDKs
- `--hl2sdk-root=PATH` - Specify HL2SDK root directory
- `--mms-path=PATH` - Specify Metamod:Source path

### Dependencies

The setup script automatically:
1. Initializes all git submodules (amtl, sourcepawn, hl2sdk-manifests, safetyhook, libaddrz)
2. Downloads Metamod:Source
3. Downloads HL2SDKs for common games (CS:GO, CS:S, TF2, L4D2)

To download additional SDKs, run:

```bash
bash tools/checkout-deps.sh -s sdk1,sdk2,sdk3
```

Available SDKs: csgo, hl2dm, nucleardawn, l4d2, dods, l4d, css, tf2, insurgency, sdk2013, doi, orangebox, blade, episode1, bms, pvkii, darkm, swarm, bgt, eye, contagion

### MySQL Support

By default, the setup script downloads MySQL 5.7 libraries. To disable MySQL extension building:

```bash
python3 ../configure.py --no-mysql --enable-optimize
```

## Troubleshooting

### Submodules not initialized
```bash
git submodule update --init --recursive
```

### Missing dependencies
```bash
bash tools/checkout-deps.sh
```

### Clean build
```bash
rm -rf build
mkdir build
cd build
python3 ../configure.py --enable-optimize
ambuild
```

## Project Structure

- `core/` - SourceMod core implementation
- `extensions/` - SourceMod extensions (MySQL, cURL, etc.)
- `sourcepawn/` - SourcePawn compiler and VM (submodule)
- `public/amtl/` - AlliedModders Template Library (submodule)
- `public/safetyhook/` - SafetyHook library (submodule)
- `hl2sdk-manifests/` - HL2SDK manifests (submodule)
- `plugins/` - Example SourcePawn plugins
- `gamedata/` - Game-specific data files

## Resources

- [SourceMod Website](http://www.sourcemod.net)
- [Building SourceMod Wiki](https://wiki.alliedmods.net/Building_SourceMod)
- [Forum](https://forums.alliedmods.net/forumdisplay.php?f=52)
- [GitHub Repository](https://github.com/alliedmodders/sourcemod)
