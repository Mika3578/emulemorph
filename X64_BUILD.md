# x64 Build Configuration

This repository now includes x64 (64-bit) platform configurations for all projects in addition to the existing Win32 (32-bit) configurations.

## What Was Added

### Main Projects with x64 Support
The following projects now have full x64 configurations:
- **emule** - Main eMule application (Beta|x64, Debug|x64, Release|x64)
- **ResizableLib** - Resizable window library (Debug|x64, Release|x64)
- **ReplaceVistaIcon** - Icon replacement utility (Debug|x64, Release|x64)
- **CxImage** - Image processing library (Debug|x64, Release|x64)

### Submodule Projects with x64 Support
The following submodule projects already have x64 support:
- **cryptlib** - Cryptography library
- **zlibstat** - zlib compression library
- **libupnp** - UPnP library
- **ixml** - XML parsing library  
- **threadutil** - Threading utilities

### New Project Files Created
To enable building with x64, the following Visual Studio project files were created:
- **id3lib/libprj/id3lib.vcxproj** - ID3 tag library project with x64 configurations
- **pthreads/pthread.vcxproj** - POSIX threads library project with x64 configurations

These files are located in Git submodules and provide x64 build configurations for libraries that previously only had old .dsp (Visual Studio 6.0) project files.

### Submodule with Modified Project File
- **png/projects/vstudio/libpng/libpng.vcxproj** - Modified to add x64 configurations (this file is in a submodule and the changes need to be maintained locally)

## Building for x64

### Prerequisites
- Visual Studio 2019 or later (with v142 platform toolset)
- Windows SDK 10.0

### Build Instructions

1. **Initialize submodules** (if not already done):
   ```
   git submodule init
   git submodule update
   ```

2. **Open the solution**:
   Open `srchybrid\emule.sln` in Visual Studio

3. **Select x64 platform**:
   - In Visual Studio, select the desired configuration (Debug, Release, or Beta)
   - Select "x64" as the platform from the platform dropdown

4. **Build the solution**:
   - Build → Build Solution (or press F7)

### Available x64 Configurations
- **Debug|x64** - Debug build with full debugging information
- **Release|x64** - Optimized release build
- **Beta|x64** - Beta release build with additional features

## Technical Changes

### Platform-Specific Settings for x64
The following changes were made for x64 compatibility:
- Changed `TargetMachine` from `MachineX86` to `MachineX64`
- Changed `processorArchitecture` from `X86` to `AMD64` in application manifests
- Removed `/safeseh` linker flag (not supported on x64)
- Removed `UseSafeExceptionHandlers` setting (not applicable to x64)

### Output Directories
x64 builds use the following output structure:
- Binary output: `build\x64\Binary\`
- Intermediate files: `build\x64\<Configuration>\<ProjectName>\`

## Notes for Submodule Projects

### id3lib and pthreads
The `.vcxproj` files created for id3lib and pthreads are minimal project files that should work for building static libraries. They may need additional configuration depending on specific build requirements.

### libpng
The libpng project file was modified in the submodule to add x64 support. Since this is a submodule, you may need to maintain this change locally or fork the submodule repository.

## Troubleshooting

### Missing Project Files
If Visual Studio reports missing project files for id3lib or pthread, ensure that:
1. Submodules are properly initialized (`git submodule init && git submodule update`)
2. The `.vcxproj` files exist in the submodule directories
3. The files are not being ignored by .gitignore

### Build Errors
If you encounter build errors specific to x64:
1. Verify you have the Windows 10 SDK installed
2. Check that the v142 platform toolset is installed
3. Ensure all submodule projects have x64 configurations

### Submodule Changes
The modifications to submodule files (id3lib, pthreads, libpng) are necessary for the x64 build but are not committed to the upstream repositories. You may need to:
1. Maintain these changes locally
2. Fork the submodule repositories and commit the changes there
3. Update the .gitmodules file to point to your forks

## Compatibility

### Win32 (32-bit) Builds
All existing Win32 configurations remain unchanged and should continue to work as before:
- Debug|Win32
- Release|Win32  
- Beta|Win32

### Visual Studio Versions
The project files use:
- **PlatformToolset**: v142 (Visual Studio 2019)
- **WindowsTargetPlatformVersion**: 10.0

For other Visual Studio versions, you may need to retarget the projects.
