# Agent Instructions
- Keep GitHub Actions workflows readable with descriptive step names and avoid removing existing matrix configurations without discussion.
- Prefer minimal, focused changes that preserve the current build targets unless broader refactors are required.
- When updating dependency installation steps, include guards to skip work if the dependency is already present.

## Project context
- This repository hosts the eMule Morph Windows client; the primary solution lives at `srchybrid/emule.sln` and targets Win32 Debug/Release configurations.
- The build depends on Visual Studio components such as the Windows 10 SDK (10.0.22621.0) and ATLMFC; prefer detecting existing installations before adding new ones.
- Submodules provide bundled third-party libraries (e.g., `cryptopp`, `pupnp`, `pthreads`); ensure they are initialized when workflows or build scripts need them.
- Source lives primarily in `srchybrid/` (MFC/ATL C++ with resources under `srchybrid/res/`), while third-party libraries are kept at the repository root for static linkage.
- Legacy build notes are in `How-To-Compile.txt`; keep guidance aligned with the current Visual Studio toolset and SDK expectations reflected in CI.

## Contribution preferences
- Preserve the existing solution structure and Win32 platform unless there is a strong reason to broaden platform coverage.
- When changing CI or tooling, keep steps scoped to the minimal directories needed (for example, run Windows builds from `srchybrid/`).
- Align documentation and comments with the current build expectations, especially around SDK/MFC prerequisites.
- Prefer incremental adjustments that respect the original MorphXT code style (MFC message maps, `stdafx.*`, `.rc` resource organization) and avoid sweeping refactors.

## Build and testing guidance
- Use `git submodule update --init --recursive` before building locally or in automation that starts from a fresh checkout.
- For MSBuild invocations, use `/p:Platform=Win32` and respect both Debug and Release configurations to mirror CI coverage.
- Prefer fast, targeted checks over long-running suites, and document any required environment setup (e.g., specific SDK or MFC components) in workflow steps or accompanying notes.
- When editing project files (`*.vcxproj`, `.sln`), keep the WindowsTargetPlatformVersion in sync with the CI-installed SDK to avoid mismatches.
