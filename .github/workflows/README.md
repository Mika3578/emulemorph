# GitHub Actions Workflows

This directory contains GitHub Actions workflows for automated building, testing, and security scanning of the eMule MorphXT project.

## Workflows

### 🔨 Build (`build.yml`)
**Triggers:** Push to main/master/develop, Pull Requests, Manual dispatch

Builds the eMule project using MSBuild on Windows runners.

**Features:**
- Builds both Debug and Release configurations
- Supports Win32 platform
- Automatically checks out and initializes git submodules
- Uploads Release build artifacts (executables, DLLs, PDBs)
- Provides build summary with file sizes

**Matrix Strategy:**
- Configuration: `Release`, `Debug`
- Platform: `Win32`

### 🔒 CodeQL Security Scan (`codeql.yml`)
**Triggers:** Push to main/master/develop, Pull Requests, Weekly schedule (Mondays), Manual dispatch

Performs deep security analysis on C++ code using GitHub's CodeQL.

**Features:**
- Analyzes C++ code for security vulnerabilities
- Uses extended security queries
- Excludes test and build directories
- Results appear in the Security tab
- Builds the project to ensure comprehensive analysis

**Configuration:**
- Language: C++
- Queries: Security Extended + Security and Quality
- Schedule: Weekly on Mondays at midnight UTC

### 📦 Dependency Review (`dependency-review.yml`)
**Triggers:** Pull Requests only

Reviews dependencies for known security vulnerabilities.

**Features:**
- Scans for vulnerable dependencies
- Fails on moderate severity or higher
- Posts summary comments on pull requests
- Checks all git submodules

**Configuration:**
- Severity threshold: Moderate
- Includes submodule dependencies

### ✅ Code Quality Check (`code-quality.yml`)
**Triggers:** Push to main/master/develop, Pull Requests, Manual dispatch

Performs static analysis and code quality checks.

**Features:**
- Runs Visual Studio Code Analysis with NativeRecommendedRules
- Counts source files and generates statistics
- Checks for TODO/FIXME/HACK comments
- Detects hardcoded paths
- Validates git submodule configuration
- Posts detailed summary to workflow run

**Analysis Includes:**
- Static code analysis
- Code metrics and statistics
- Common code smell detection
- Submodule health check

### 🛡️ Security Scan (`security-scan.yml`)
**Triggers:** Push to main/master/develop, Pull Requests, Weekly schedule (Sundays), Manual dispatch

Comprehensive security vulnerability scanning using Trivy.

**Features:**
- Filesystem-based security scanning
- Detects vulnerabilities in dependencies
- Uploads results to GitHub Security tab
- License compliance check
- Lists all project dependencies

**Configuration:**
- Scanner: Trivy
- Severity levels: Critical, High, Medium
- Schedule: Weekly on Sundays at midnight UTC
- Includes license file detection

## Dependencies

The project uses the following git submodules as dependencies:

- **cryptopp** - Crypto++ cryptographic library
- **zlib** - Data compression library
- **libpng** - PNG image library
- **id3lib** - ID3 tag manipulation library
- **pupnp** - Portable UPnP library
- **pthreads** - POSIX threads implementation for Windows

All workflows automatically initialize and update these submodules.

## Build Requirements

### Windows Build Environment
- Windows Server (latest)
- MSBuild (via microsoft/setup-msbuild)
- Visual Studio Developer Command Prompt
- NuGet package manager
- Platform Toolset: v142 (Visual Studio 2019+)

### Configuration Options
- **Debug**: Development build with debugging symbols
- **Release**: Optimized production build
- **Beta**: Pre-release build configuration

## Workflow Permissions

Workflows require the following permissions:

- **actions**: read - To access workflow artifacts
- **contents**: read - To checkout repository code
- **security-events**: write - To upload security scan results
- **pull-requests**: write - To post PR comments (dependency review)

## Viewing Results

### Build Artifacts
Build artifacts (executables, DLLs, debug symbols) are available:
1. Navigate to the Actions tab
2. Select the Build workflow run
3. Download artifacts from the Artifacts section

### Security Scan Results
Security vulnerabilities are reported in:
1. **Security Tab** → Code scanning alerts
2. Workflow run summaries
3. Pull request comments (for dependency issues)

### Code Quality Reports
Code quality metrics appear in:
1. Workflow run summaries
2. Job step outputs
3. Build logs

## Customization

### Adjusting Build Configuration

To modify build settings, edit `build.yml`:
```yaml
matrix:
  configuration: [Release, Debug, Beta]  # Add or remove configurations
  platform: [Win32, x64]                  # Add x64 if needed
```

### Changing Scan Schedules

To adjust security scan frequency, modify the cron expressions:
```yaml
schedule:
  - cron: '0 0 * * 1'  # Change day/time as needed
```

### Security Severity Levels

To adjust security thresholds, edit the respective workflow:
```yaml
severity: 'CRITICAL,HIGH,MEDIUM,LOW'  # Add/remove levels
fail-on-severity: moderate             # Change threshold
```

## Troubleshooting

### Build Failures
1. Check that all submodules are properly initialized
2. Verify Visual Studio platform toolset version
3. Review MSBuild error messages in workflow logs

### CodeQL Timeout
If CodeQL analysis times out:
1. Increase timeout in workflow (default: 360 minutes)
2. Reduce code analysis scope if needed

### Missing Dependencies
If builds fail due to missing dependencies:
1. Ensure submodules are properly configured in `.gitmodules`
2. Verify NuGet packages are restored correctly

## Manual Workflow Execution

All workflows support manual dispatch via the GitHub Actions UI:
1. Go to Actions tab
2. Select the desired workflow
3. Click "Run workflow"
4. Choose branch and click "Run workflow"

## Contributing

When adding new workflow files:
1. Validate YAML syntax before committing
2. Test workflows on a feature branch first
3. Document any new configurations in this README
4. Follow existing naming conventions

## Additional Resources

- [GitHub Actions Documentation](https://docs.github.com/en/actions)
- [MSBuild Reference](https://docs.microsoft.com/en-us/visualstudio/msbuild/)
- [CodeQL Documentation](https://codeql.github.com/docs/)
- [Trivy Documentation](https://aquasecurity.github.io/trivy/)
