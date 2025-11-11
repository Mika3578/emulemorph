# Windows 11 + Visual Studio Workflow for eMule MorphXT

This document summarizes the recommended setup and daily workflow for building the eMule MorphXT client on a modern Windows 11 machine with the latest Visual Studio.

## 1. Install prerequisites
- Install Visual Studio 2022 (or newer) with the **Desktop development with C++** workload.
- Ensure the following individual components are added:
  - MSVC v143 (or v142 for compatibility).
  - Latest Windows 10/11 SDK.
  - **MFC and ATL support for C++** (required because the project links MFC statically).

## 2. Obtain the sources
- Clone the repository.
- Initialize bundled submodules so that all third-party dependencies are available:
  ```powershell
  git submodule init
  git submodule update
  ```

## 3. Open the solution
- Open `srchybrid/emule.sln` in Visual Studio.
- Select the desired configuration (**Debug**, **Release**, or **Beta**) while keeping the platform target at **Win32**.

## 4. Verify project settings
- **Toolset / SDK**: Upgrade the `PlatformToolset` to the installed MSVC version (typically v143) when prompted. Keep the Windows Target Platform set to version 10.0.
- **MFC / ATL**: Ensure `Use of MFC` remains **Static**. `Use of ATL` should stay disabled in Release/Beta configurations.
- **Include directories**: Confirm additional include directories cover bundled dependencies, such as `..\id3lib\include`, `..\pthreads`, `..\pupnp`, and `ATLServer\include`.
- **Linker inputs**: Verify libraries like `unicows.lib`, `ws2_32.lib`, `gdiplus.lib`, and `crypt32.lib` remain in the linker command line for all configurations.

## 5. Build and post-build steps
- Build the project. Binaries are written to `build\Win32\Binary`.
- Release/Beta configurations execute the `ReplaceVistaIcon` post-build step. Build `ReplaceVistaIcon` first (`ReplaceVistaIcon\ReplaceVistaIcon.vcxproj`) so the tool exists when the main build runs.

## 6. Optional adjustments
- To experiment with x64, clone an existing Win32 configuration and update include/library paths for each dependency. Additional porting may be required for third-party code.
- Use Visual Studio's built-in C++ Code Analysis (`AllRules.ruleset`) already configured per build for extra validation.

## 7. Daily workflow checklist
1. Sync the repository and submodules.
2. Open `srchybrid/emule.sln` and confirm configuration/platform.
3. Build the `ReplaceVistaIcon` utility if Release/Beta icons are required.
4. Build the desired configuration and inspect output under `build\Win32\Binary`.
5. Run smoke tests under Windows 11, optionally using the debugger in Debug builds.

Following these steps keeps the project aligned with its existing dependencies and build expectations while leveraging the latest Visual Studio toolchain on Windows 11.
