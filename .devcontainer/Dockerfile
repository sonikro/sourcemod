FROM mcr.microsoft.com/devcontainers/cpp:1-ubuntu-22.04

# Enable i386 architecture for 32-bit support
RUN dpkg --add-architecture i386

RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get install -y \
    build-essential \
    g++-multilib \
    gcc-multilib \
    libstdc++6:i386 \
    lib32z1-dev \
    libc6-dev-i386 \
    linux-libc-dev:i386 \
    wget \
    curl \
    git \
    python3-pip \
    vim \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN pip3 install --no-cache-dir git+https://github.com/alliedmodders/ambuild.git

USER vscode

WORKDIR /workspaces/sourcemod
