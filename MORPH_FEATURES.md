# eMule Morph Features Inventory

This document catalogs all Morph-specific features found in the 0.50b codebase that need to be preserved during the 0.70b upgrade.

## Feature Categories

### Upload Management
- **Smart Upload Control v2 (SUC)** [lovelace/SiRoB]
  - Files: UploadQueue.cpp, ClientList.cpp
  - Advanced upload slot management and prioritization
  - Dynamic bandwidth allocation

### Source Management  
- **Source Cache** [Xman/Stulle]
  - Files: PartFile.cpp, DownloadQueue.cpp
  - Caches sources for faster resume
  - Reduces server load

- **Source Loader Saver (SLS)** [SiRoB]
  - Persistent source storage

### Network & Connectivity
- **UPnPNAT Support** [MoNKi/SiRoB]
  - Files: emule.cpp, Preferences.cpp
  - Automatic port forwarding via UPnP
  - Uses pupnp library

- **Random Ports** [MoNKi/SiRoB]
  - Dynamic port assignment for security
  - Prevents port-based blocking

- **Improved ICS-Firewall Support** [MoNKi/SiRoB]
  - Better Windows Firewall integration

- **IP Filter White List** [Stulle]
  - Files: IPFilter.cpp
  - Whitelist for IP filtering

- **Static IP Filter** [Stulle/leuk_he]
  - Additional IP filtering capabilities

### Web & Remote Access
- **Advanced WebInterface Account Management** [ionix]
  - Files: WebServer.cpp, PPgIonixWebServer.cpp/h
  - Multi-user authentication
  - Role-based access control
  - Cookie-based sessions

- **WapServer** [SiRoB/Commander/emulEspaña]
  - Files: WapServer/* directory
  - WAP/mobile interface
  - Remote access from mobile devices

### File Management
- **Import Parts** [SR13/SiRoB]
  - Files: ImportParts.cpp/h
  - Import partial downloads from other clients
  - Merge part files

- **RAR File Download Decompress** [official/Stulle]
  - Auto-extract RAR archives after download
  - Integrated decompression

- **SharedView Ed2kType** [Avi3k]
  - Enhanced shared file categorization

- **Custom Incoming/Temp Folder Icons** [emulEspaña/Commander]
  - Files: emule.cpp, Ini2.cpp/h
  - Custom folder icons in Windows

### Download Management
- **Downloaded History** [Monki/Xman]
  - Files: HistoryListCtrl.cpp/h
  - Track completed downloads
  - Prevent re-downloading

### Security & Anti-Fake
- **Fakealyzer** [netfinity/Stulle]
  - Files: fakecheck.cpp/h
  - Detect fake files
  - Hash-based verification

- **Bad Shareaza Detection** [zz_fly]
  - Detect modified/bad clients

- **eMCrypt Detection** [Xman/leuk_he]
  - Identify encrypted clients

### Statistics & Monitoring
- **Extended Statistics** [Various]
  - Files: StatisticsDlg.cpp, StatisticsTree.cpp
  - Additional stat tracking
  - Enhanced graphs and displays

- **Improved Upload State Sorting** [Stulle]
  - Better upload queue visualization

### User Interface
- **Preference Pages**
  - PPgMorph.cpp/h - Main Morph settings
  - PPgMorph2.cpp/h - Additional Morph settings  
  - PPgMorphShare.cpp/h - Share-related settings
  - PPgIonixWebServer.cpp/h - Web interface settings
  - PPgBackup.cpp/h - Backup settings
  - PPgEmulespana.cpp/h - emulEspaña features
  - PPgEastShare.cpp/h - EastShare features

- **Custom UI Controls**
  - ColorFrameCtrl - Custom color pickers
  - HyperTextCtrl - Hyperlink controls
  - LogEditCtrl - Enhanced logging display
  - ButtonVE - Vista-enhanced buttons
  - KCSideBannerWnd - Side banner

### System Integration
- **Run as NT Service** [leuk_he]
  - Files: NTService.cpp/h
  - Run eMule as Windows service
  - Background operation without UI

- **Scheduler** [Stulle]
  - Scheduled operations
  - Bandwidth scheduling

### Friends & Community
- **FriendLinks** [emulEspaña/Commander]
  - Enhanced friend management
  - Friend ed2k links

### Miscellaneous
- **IP2Country** 
  - Files: IP2Country.cpp/h
  - Show country flags for IPs
  - GeoIP database integration

- **ModVersion**
  - Files: ModVersion.cpp/h
  - Mod version identification

- **MMServer** (Messaging/MiniMule)
  - Files: MMServer.cpp/h, MMSocket.cpp/h
  - Lightweight protocol server

- **CRC32 Tag Support**
  - Files: AddCRC32TagDialog.cpp/h
  - Add CRC32 tags to files

- **Mass Rename**
  - Files: MassRename.cpp/h  
  - Bulk file renaming

- **File Processing**
  - Files: FileProcessing.cpp/h
  - Advanced file operations

## Code Markers

Morph features are marked in code with:
```cpp
//MORPH START - Added by [Author], [Feature] [Mod]
// ... Morph-specific code ...
//MORPH END   - Added by [Author], [Feature] [Mod]
```

Common authors:
- SiRoB - Major contributor
- Stulle - Major contributor  
- Xman - Many features ported from Xtreme
- leuk_he - NT Service and other features
- Commander/emulEspaña - Spanish community features
- ionix - Web interface enhancements
- MoNKi - Network features
- netfinity - Fakealyzer
- Avi3k - UI enhancements

## File Statistics

- **Total files with MORPH markers:** 227
- **Pure Morph files (not in vanilla):** 107
- **Modified shared files:** 120
- **Total MORPH code blocks:** ~4,000+

## Dependencies

### External Libraries Used by Morph
- pupnp (UPnP support) - Updated to 1.14.0
- CxImage (Image processing)
- GeoIP/MaxMind (IP to Country)
- Custom UI libraries

### Submodules
- cryptopp
- id3lib
- png
- pthreads
- zlib
- ResizableLib
- ReplaceVistaIcon

## Priority for Migration

### Critical (Must Have)
1. Smart Upload Control (SUC) - Core feature
2. Source Cache - Performance critical
3. UPnPNAT Support - User-facing networking
4. Web Interface enhancements - Remote access
5. Downloaded History - Prevents redownloads

### High Priority  
6. Fakealyzer - Security
7. IP Filter White List - Security
8. Random Ports - Security
9. Import Parts - User convenience
10. Run as NT Service - Enterprise use

### Medium Priority
11. WapServer - Mobile access
12. RAR decompress - Convenience
13. Extended Statistics - Monitoring
14. Custom folder icons - UI polish
15. FriendLinks - Community features

### Low Priority (Nice to Have)
16. Mass Rename - Utility
17. CRC32 tags - Niche feature
18. Various UI enhancements
19. Additional preference pages

## Testing Requirements

Each feature should be tested for:
1. **Compilation** - Does it build?
2. **Basic Function** - Does it work?
3. **Integration** - Does it play well with 0.70b changes?
4. **Performance** - Any regressions?
5. **Security** - Any new vulnerabilities?

## Notes

- Some features may be obsolete in 0.70b (e.g., if upstream implemented similar)
- Some features may conflict with 0.70b architecture changes
- Some features may need complete redesign for new threading model
- Documentation for many features is limited to code comments

---
*Last Updated: 2025-11-12*
