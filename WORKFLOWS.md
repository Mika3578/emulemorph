# CI/CD and Security Workflows

This repository now includes comprehensive GitHub Actions workflows for automated building, testing, and security scanning.

## Overview

Five workflows have been added to ensure code quality, security, and reliable builds:

| Workflow | Purpose | Trigger |
|----------|---------|---------|
| **Build** | Compile project for Debug/Release | Push, PR, Manual |
| **CodeQL** | Deep security code analysis | Push, PR, Weekly, Manual |
| **Dependency Review** | Check dependencies for vulnerabilities | PR only |
| **Code Quality** | Static analysis & metrics | Push, PR, Manual |
| **Security Scan** | Trivy vulnerability scanning | Push, PR, Weekly, Manual |

## Quick Start

### Viewing Workflow Status

1. Navigate to the **Actions** tab in the GitHub repository
2. Select a workflow to see its runs and results
3. Click on a specific run to view detailed logs

### Downloading Build Artifacts

After a successful build:
1. Go to **Actions** → **Build** workflow
2. Select a completed workflow run
3. Scroll to **Artifacts** section
4. Download `emule-Win32-Release` (or Debug)

### Security Alerts

Security issues are reported in:
- **Security** tab → **Code scanning alerts**
- Workflow run summaries
- Pull request comments

## Workflows in Detail

### 🔨 Build Workflow
- **File**: `.github/workflows/build.yml`
- **Runs on**: Windows latest
- **Configurations**: Debug, Release
- **Platform**: Win32
- **Output**: Executable, DLLs, PDB files

The build workflow:
1. Checks out code with all submodules
2. Sets up MSBuild and Visual Studio environment
3. Restores NuGet packages
4. Builds the solution
5. Uploads artifacts for Release builds

### 🔒 CodeQL Security Scan
- **File**: `.github/workflows/codeql.yml`
- **Runs on**: Windows latest
- **Language**: C++
- **Schedule**: Weekly (Mondays at 00:00 UTC)

CodeQL performs deep static analysis to find:
- Security vulnerabilities
- Memory safety issues
- Common coding errors
- Best practice violations

### 📦 Dependency Review
- **File**: `.github/workflows/dependency-review.yml`
- **Runs on**: Ubuntu latest
- **Trigger**: Pull requests only
- **Severity**: Fails on moderate or higher

Checks all dependencies (including submodules) for known vulnerabilities.

### ✅ Code Quality Check
- **File**: `.github/workflows/code-quality.yml`
- **Runs on**: Windows latest

Performs:
- Visual Studio Code Analysis
- Source code metrics
- TODO/FIXME detection
- Hardcoded path detection
- Submodule health check

### 🛡️ Security Scan
- **File**: `.github/workflows/security-scan.yml`
- **Runs on**: Ubuntu latest
- **Schedule**: Weekly (Sundays at 00:00 UTC)

Uses Trivy to scan for:
- Dependency vulnerabilities
- Configuration issues
- License compliance

## Manual Workflow Execution

To manually trigger a workflow:

1. Go to **Actions** tab
2. Select the workflow from the left sidebar
3. Click **Run workflow** button
4. Select the branch
5. Click **Run workflow**

## Build Requirements

The project requires:
- Windows environment
- Visual Studio 2019 or later (Platform Toolset v142)
- MSBuild
- Git with submodule support

All dependencies are managed via git submodules:
- cryptopp (Crypto++)
- zlib
- libpng
- id3lib
- pupnp
- pthreads

## Configuration

### Branch Protection

Consider enabling these branch protection rules:
- Require status checks to pass before merging
- Require Build workflow to pass
- Require CodeQL scan to pass (for main/master)

### Scheduled Scans

Security scans run automatically:
- **CodeQL**: Mondays at 00:00 UTC
- **Trivy**: Sundays at 00:00 UTC

### Customization

To modify workflows, edit files in `.github/workflows/`:
- Adjust build configurations in `build.yml`
- Change scan schedules in `codeql.yml` and `security-scan.yml`
- Modify severity thresholds in `dependency-review.yml`

## Troubleshooting

### Build Failures

Common issues:
1. **Submodules not initialized**: Workflows automatically handle this
2. **Missing dependencies**: Check NuGet restore step
3. **Platform toolset**: Verify Visual Studio version compatibility

### Security Scan False Positives

If security scans report false positives:
1. Review the alert in the Security tab
2. If confirmed as false positive, dismiss with explanation
3. Consider adding to CodeQL query filters if needed

### Workflow Not Triggering

Ensure:
- Branch name matches trigger configuration (main/master/develop)
- Workflow file is committed to the branch
- Repository has Actions enabled in Settings

## Resources

For detailed documentation, see:
- [Workflow README](.github/workflows/README.md)
- [GitHub Actions Documentation](https://docs.github.com/en/actions)
- [CodeQL Documentation](https://codeql.github.com/docs/)

## Support

For issues with workflows:
1. Check workflow run logs in Actions tab
2. Review this documentation
3. Check GitHub Actions status page
4. Open an issue if problem persists
