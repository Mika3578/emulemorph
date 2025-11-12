# eMule Morph 0.70b Migration Guide

## Executive Summary
Upgrading eMule Morph from 0.50b to 0.70b is a **major migration project**, not a simple upgrade. This document outlines the scope, challenges, and recommended approach.

## Scope Analysis

### Current State
- **Base:** eMule 0.50a with MorphXT modifications
- **Version:** 0.50b (0.50.1) 
- **Morph Modifications:** ~4,000+ code blocks across 227 files
- **Unique Morph Files:** 107 files not in upstream eMule
- **Modified Shared Files:** 120 files that exist in both but have MORPH modifications

### Target State
- **Base:** eMule Community 0.70b
- **Changes from 0.50 to 0.70:** 20 minor versions of evolution
- **Major Architectural Changes:**
  - New threading model for uploads/downloads
  - mbedTLS instead of older crypto libraries
  - Improved security and protocol handling
  - Performance optimizations
  - Bug fixes accumulated over years

### Git Merge Analysis
- Direct git merge results in **512 conflicting files**
- Repositories have **completely unrelated histories**
- Using merge strategy "ours" keeps old code (defeats purpose)
- Using merge strategy "theirs" loses all Morph features

## Major Morph Features to Preserve

### Core Features
1. **Smart Upload Control v2 (SUC)** [lovelace] - Advanced upload management
2. **Import Parts** [SR13] - Import partial downloads
3. **Source Cache** [Xman] - Improved source handling
4. **Downloaded History** [Monki/Xman] - Track download history
5. **Fakealyzer** [netfinity] - Detect fake files

### Network Features
6. **UPnPNAT Support** - Universal Plug and Play NAT traversal
7. **Random Ports** - Dynamic port assignment
8. **Improved ICS-Firewall Support** - Better firewall compatibility
9. **IP Filter White List** [Stulle] - Advanced IP filtering
10. **Static IP Filter** [Stulle] - Additional IP filtering options

### Web Interface
11. **Advanced WebInterface Account Management** [ionix] - Multi-user web interface
12. **WapServer** [emulEspaña] - WAP/mobile interface
13. **Cookie Settings** [Aireoreion] - Enhanced web auth

### File Management
14. **RAR File Download Decompress** [official] - Auto-extract archives
15. **SharedView Ed2kType** [Avi3k] - Enhanced shared file views
16. **Custom Incoming/Temp Folder Icons** [emulEspaña] - UI customization

### Additional Features
17. **FriendLinks** [emulEspaña] - Enhanced friend management
18. **Run as NT Service** [leuk_he] - Windows service mode
19. **Multiple Preference Pages** - PPgMorph, PPgMorph2, PPgMorphShare, PPgIonixWebServer
20. **Extended Statistics and Monitoring**
21. **Custom Logging and Debug Options**

## Migration Approaches

### Approach 1: File-by-File Manual Migration (RECOMMENDED)
**Time Estimate:** 4-6 weeks of full-time development
**Risk:** Medium
**Quality:** High

#### Steps:
1. **Phase 1: Setup** (1-2 days)
   - Create detailed inventory of all Morph features
   - Set up 0.70b development environment
   - Document all MORPH code blocks with their purposes
   - Create automated tests where possible

2. **Phase 2: Core Infrastructure** (1 week)
   - Port Morph-specific preference pages (PPgMorph*)
   - Port core Morph infrastructure files
   - Update resource files and build configuration
   - Ensure basic compilation

3. **Phase 3: Feature Migration** (2-3 weeks)
   - Port features in priority order:
     a. Smart Upload Control (SUC)
     b. Source Cache and Management
     c. Network features (UPnP, Random Ports, Firewall)
     d. Web interface enhancements
     e. File management features
     f. Statistics and monitoring
   - Test each feature as it's ported
   - Document any features that can't be ported

4. **Phase 4: Integration & Testing** (1 week)
   - Resolve integration issues
   - Comprehensive testing of all features
   - Performance testing
   - Security audit

5. **Phase 5: Documentation & Release** (2-3 days)
   - Update all documentation
   - Create migration notes for users
   - Prepare release notes

### Approach 2: Hybrid Automated + Manual (EXPERIMENTAL)
**Time Estimate:** 3-4 weeks
**Risk:** High
**Quality:** Medium

Use automated tools to extract and port MORPH blocks, then manually fix issues.

### Approach 3: Gradual Feature Port (STAGED)
**Time Estimate:** 2-3 months
**Risk:** Low
**Quality:** High

Port features incrementally over multiple releases:
- v0.70b-alpha: Base upgrade, no Morph features
- v0.70b-beta1: Core Morph features (SUC, Source Cache)
- v0.70b-beta2: Network features
- v0.70b-rc: All features, testing phase
- v0.70b-final: Production release

## Technical Challenges

### 1. Threading Model Changes
- 0.70b uses new upload/download threading
- Morph's SUC must be adapted to new threading
- May require redesign of some Morph features

### 2. Library Changes
- mbedTLS replaces older crypto
- Updated networking libraries
- May affect some low-level Morph features

### 3. API Changes
- Many eMule internal APIs changed
- MORPH code blocks use old APIs
- Require API translation layer or code updates

### 4. Build System
- 0.70b may have different build requirements
- Visual Studio version differences
- Dependency management changes

### 5. Testing
- No automated test suite exists
- Manual testing required for all features
- Risk of regressions

## Files Requiring Attention

### Pure Morph Files (Copy + Update)
These files are unique to Morph and need to be copied and adapted:
```
srchybrid/PPgMorph.cpp/h
srchybrid/PPgMorph2.cpp/h
srchybrid/PPgMorphShare.cpp/h
srchybrid/PPgIonixWebServer.cpp/h
srchybrid/WapServer/* (entire directory)
srchybrid/IP2Country.cpp/h
srchybrid/MMServer.cpp/h
srchybrid/NTService.cpp/h
srchybrid/ModVersion.cpp/h
... (107 files total)
```

### Modified Shared Files (Merge MORPH blocks)
These files exist in both codebases but have Morph modifications:
```
srchybrid/emule.cpp
srchybrid/emuleDlg.cpp
srchybrid/Preferences.cpp
srchybrid/WebServer.cpp
srchybrid/UploadQueue.cpp
srchybrid/DownloadQueue.cpp
srchybrid/ClientList.cpp
srchybrid/SharedFileList.cpp
... (120 files total)
```

## Recommended Next Steps

1. **Decision Point:** Confirm project scope and timeline with stakeholders
2. **Resource Allocation:** Assign experienced C++ developer(s) familiar with eMule codebase
3. **Environment Setup:** Set up development and testing environments
4. **Pilot Migration:** Start with one feature (e.g., UPnP) as a proof-of-concept
5. **Create Detailed Plan:** Based on pilot, create detailed migration schedule
6. **Execute Migration:** Follow phased approach with regular checkpoints

## Alternative: Version Number Update Only

If a full migration is not feasible, an alternative is to:
1. Keep the 0.50b codebase with all Morph features
2. Update version number to indicate "0.70b-compat" or similar
3. Cherry-pick specific security fixes from 0.70b
4. Document that this is not a full 0.70b upgrade

**However, this is NOT recommended as it:**
- Doesn't provide 0.70b benefits
- May cause compatibility issues
- Could mislead users about feature set
- Leaves known security/stability issues unfixed

## Conclusion

Upgrading eMule Morph to 0.70b is a substantial software engineering project requiring significant time and resources. It cannot be done with "minimal changes" or automated tooling alone. A proper upgrade requires systematic feature migration, extensive testing, and careful integration work.

**Estimated Total Effort:** 160-320 hours of development time
**Recommended Team:** 2-3 experienced C++ developers
**Timeline:** 1-3 months depending on approach

---
*Document created: 2025-11-12*
*Repository: Mika3578/emulemorph*
*Current Version: 0.50b*
*Target Version: 0.70b*
