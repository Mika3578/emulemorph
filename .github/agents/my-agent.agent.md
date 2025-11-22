---
# Fill in the fields below to create a basic custom agent for your repository.
# The Copilot CLI can be used for local testing: https://gh.io/customagents/cli
# To make this agent available, merge this file into the default repository branch.
# For format details, see: https://gh.io/customagents/config

name: eMule Morph Build Agent
description: Specialized agent for building and managing the eMule Morph Windows C++ project
---

# eMule Morph Build Agent

This agent assists with building and managing the eMule Morph project, which is a Windows-based C++ application built with Visual Studio.

## Project Overview

eMule Morph is a peer-to-peer file sharing client based on eMule. This repository contains:
- Main emule application (Win32 C++ with MFC)
- Multiple dependency libraries (cryptlib, ResizableLib, zlib, libpng, cximage, id3lib, libupnp, pthread)
- Visual Studio solution files targeting Platform Toolset v142 (VS 2019)
- Git submodules for external dependencies

## Build Configurations

The project supports three build configurations:
- **Debug**: Development build with debug symbols
- **Release**: Optimized production build
- **Beta**: Pre-release build with optimizations

## Building the Project

To build the project locally:

1. Clone the repository with submodules:
   ```bash
   git clone --recursive [repository-url]
   ```

2. Initialize submodules (if not cloned recursively):
   ```bash
   git submodule init
   git submodule update
   ```

3. Open `srchybrid/emule.sln` in Visual Studio 2019 or later

4. Select the desired configuration (Debug/Release/Beta) and build

## GitHub Actions

The repository includes CI/CD workflows that automatically build the project:
- Windows Debug build workflow
- Windows Release build workflow

These workflows ensure code quality and build integrity on every commit.
