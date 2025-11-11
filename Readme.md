# eMule MorphXT

[![Build Status](https://github.com/Mika3578/emulemorph/workflows/Build%20eMule%20MorphXT/badge.svg)](https://github.com/Mika3578/emulemorph/actions)
[![CodeQL](https://github.com/Mika3578/emulemorph/workflows/CodeQL%20Advanced/badge.svg)](https://github.com/Mika3578/emulemorph/security/code-scanning)
[![License: GPL v2](https://img.shields.io/badge/License-GPL%20v2-blue.svg)](https://www.gnu.org/licenses/old-licenses/gpl-2.0.en.html)

**Current Version: MorphXT v12.8 Beta**

## Introduction 

eMule MorphXT is an enhanced version of the eMule file-sharing client, featuring advanced functionality, improved performance, and additional customization options.

This repository is a merge of the original CVS repository and the Git repository which was used between MorphXT v11.3 and v12.6. While it contains all history, the history of individual files breaks at the point when the original CVS was left behind for Git.

This repository is not directly linked to the [official eMule Git](https://github.com/SomeSupport/eMule) repository or the [community fork](https://github.com/irwir/eMule) that followed up on its development. Merges from either are made manually.

## Features

MorphXT includes all features of the official eMule client plus:
- Enhanced upload/download management
- Advanced statistics and monitoring
- Improved web interface
- PowerShare functionality
- Extended customization options
- Support for modern Windows platforms (Windows 7/8/10/11)

## Getting Started

### Prerequisites

To compile eMule MorphXT, you need:
- Windows 7 or later (Windows 11 recommended for development)
- Visual Studio 2019 or later (Visual Studio 2022 recommended)
- Visual C++ Desktop Development workload
- MFC and ATL support for C++ (required)
- Windows 10/11 SDK

### Cloning the Repository

The project uses Git submodules for third-party dependencies. Clone with submodules:

```bash
git clone --recursive https://github.com/Mika3578/emulemorph.git
```

Or, if you've already cloned the repository:

```bash
git submodule init
git submodule update
```

## Building from Source

### Quick Start

1. Open `srchybrid/emule.sln` in Visual Studio
2. Select your desired configuration:
   - **Debug** - For development with debugging symbols
   - **Release** - Optimized production build
   - **Beta** - Pre-release testing build
3. Ensure platform is set to **Win32**
4. Build the solution (F7 or Build > Build Solution)

The compiled binaries will be located in `build/Win32/Binary/`.

### Detailed Build Instructions

For comprehensive build instructions and troubleshooting, see:
- [Windows Build Workflow](WINDOWS_BUILD_WORKFLOW.md) - Detailed setup guide for Windows 11 + Visual Studio
- [How-To-Compile.txt](How-To-Compile.txt) - Quick reference guide

## Documentation

- [CHANGELOG.md](CHANGELOG.md) - Version history and changes
- [WINDOWS_BUILD_WORKFLOW.md](WINDOWS_BUILD_WORKFLOW.md) - Detailed compilation guide

## Contributing

Contributions are welcome! Please ensure your code:
- Follows the existing code style
- Compiles without warnings in Release configuration
- Doesn't break existing functionality
- Includes appropriate comments for complex logic

## License

This project is licensed under the GNU General Public License v2.0 - see the source files for details.

## Support

For issues, questions, or contributions, please use the GitHub issue tracker.

## Acknowledgments

eMule MorphXT builds upon the work of:
- The original eMule team
- Various eMule mod developers
- Contributors to the MorphXT project