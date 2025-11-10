# AI Agents Documentation

This document describes the AI agents and their capabilities available for the eMule Morph project.

## Overview

AI agents can assist with various development tasks in the eMule Morph project, including code review, testing, documentation, and more. This document provides guidance on how to effectively work with AI assistants on this C++ Windows application.

## Project Context

eMule Morph is a P2P file-sharing client based on eMulePlus. The project:
- Written primarily in C++
- Uses Visual Studio solution files (.sln)
- Targets Windows platform
- Includes multiple submodules for dependencies
- Contains various components: GUI, networking, cryptography, image processing

## Available Agent Capabilities

### Code Development

**C++ Development**
- Code analysis and review for C++ codebase
- Refactoring suggestions
- Memory management and performance optimization
- Windows API and MFC framework assistance
- Modern C++ standards recommendations

**Build System**
- Visual Studio solution and project file management
- Dependency management with Git submodules
- Build configuration optimization
- Compilation troubleshooting

### Code Quality

**Code Review**
- Static code analysis
- Security vulnerability detection
- Code style and best practices
- Performance optimization suggestions
- Memory leak detection

**Testing**
- Unit test suggestions
- Integration test scenarios
- Test coverage analysis
- Bug reproduction assistance

### Documentation

**Code Documentation**
- Inline code comments
- API documentation
- Technical documentation updates
- README and guide improvements

**Knowledge Transfer**
- Explaining complex code sections
- Architecture documentation
- Setup and compilation guides

### Security

**Security Analysis**
- Vulnerability scanning
- Cryptographic implementation review
- Network security considerations
- Input validation checks
- Buffer overflow detection

### Project Management

**Issue Tracking**
- Bug report analysis
- Feature request evaluation
- Task prioritization assistance
- Technical specification drafting

## Working with AI Agents

### Best Practices

1. **Provide Context**: Always provide relevant context about the specific component or feature you're working on.

2. **Be Specific**: Clearly describe the task, problem, or question. Include file paths, function names, or error messages when relevant.

3. **Incremental Changes**: Request small, focused changes rather than large-scale refactoring.

4. **Review AI Suggestions**: Always review and test AI-generated code before committing.

5. **Security First**: Be especially careful with security-related code, cryptography, and network communication.

### Example Use Cases

**Code Review Request**
- Request: "Review the encryption implementation in `AICHSyncThread.cpp` for security vulnerabilities"
- Agent provides analysis of cryptographic practices and potential issues

**Refactoring Assistance**
- Request: "Suggest modern C++ improvements for the file download manager"
- Agent provides recommendations for using smart pointers, RAII, and standard library features

**Bug Investigation**
- Request: "Help debug memory leak in the client detail dialog"
- Agent analyzes code patterns and suggests investigation approaches

**Documentation Update**
- Request: "Update documentation for the new UPnP implementation"
- Agent helps write clear, comprehensive documentation

### Limitations

AI agents have certain limitations when working with this project:

1. **Windows-Specific Code**: May need additional context for Windows API and MFC framework specifics
2. **Legacy Code**: The codebase includes legacy patterns that may differ from modern recommendations
3. **Binary Dependencies**: Cannot directly test compiled binaries or interact with the running application
4. **External Dependencies**: Limited knowledge of specific library versions in use

### Tips for Effective Collaboration

- **Compile Often**: Always compile and test after applying AI suggestions
- **Understand Changes**: Don't blindly accept code without understanding it
- **Version Control**: Commit working code before applying major AI-suggested changes
- **Test Thoroughly**: Test changes in actual eMule Morph runtime environment
- **Security Review**: Have security-critical code reviewed by human experts

## Project-Specific Guidelines

### Code Style
- Follow existing code style in the project
- Maintain consistency with surrounding code
- Preserve existing naming conventions

### Testing
- Test builds with Visual Studio
- Verify changes don't break existing functionality
- Test on actual Windows environment when possible

### Dependencies
- Be cautious when suggesting new dependencies
- Consider the impact on the existing build system
- Respect the submodule structure

### Documentation
- Update relevant documentation when making changes
- Keep README and How-To-Compile guides current
- Document significant architectural changes

## Security Considerations

When working with AI agents on security-sensitive code:

1. **Never share sensitive data**: Don't include private keys, credentials, or user data in prompts
2. **Review security code carefully**: Especially cryptography, authentication, and network protocols
3. **Validate input handling**: Ensure proper validation of all external inputs
4. **Check buffer operations**: Verify bounds checking and memory safety
5. **Audit generated code**: Security-critical code should undergo human review

## Support and Feedback

If you encounter issues or have suggestions for improving AI agent collaboration:

- Document your experience in the project issue tracker
- Share effective prompts and use cases with the team
- Report any AI-generated code that causes issues

## Version History

- 2025-11-10: Initial AGENTS.md documentation created
