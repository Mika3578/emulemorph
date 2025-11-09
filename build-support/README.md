# Build Support Files

This directory contains build-related files that are needed for the project but are not part of the external submodules.

## pthread.vcxproj

This Visual Studio project file is used to build the pthreads library from the pthreads4w submodule. The file is based on the GerHobbelt/pthread-win32 VS2019 project configuration and has been adapted for the jwinarske/pthreads4w repository structure.

During the GitHub Actions build workflow, this file is automatically copied to the `pthreads/` directory after submodule initialization.

**Project Configuration:**
- Project GUID: {98A1AD27-110A-4C3E-AF0C-4F967E536517}
- Configuration Type: StaticLibrary
- Platform Toolset: v142
- Character Set: Unicode

**Note:** This file is necessary because the upstream jwinarske/pthreads4w repository does not provide Visual Studio project files.
