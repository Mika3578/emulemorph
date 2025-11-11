# Contributing to eMule MorphXT

Thank you for your interest in contributing to eMule MorphXT! This document provides guidelines and instructions for contributing to the project.

## Getting Started

1. **Fork the repository** on GitHub
2. **Clone your fork** locally:
   ```bash
   git clone --recursive https://github.com/YOUR_USERNAME/emulemorph.git
   cd emulemorph
   ```
3. **Set up your development environment** following the [build instructions](WINDOWS_BUILD_WORKFLOW.md)

## Development Workflow

### Before Making Changes

1. Create a new branch for your feature or bugfix:
   ```bash
   git checkout -b feature/your-feature-name
   ```
   or
   ```bash
   git checkout -b bugfix/issue-description
   ```

2. Ensure you can build the project successfully in Release configuration

### Making Changes

1. **Follow the existing code style**:
   - Use tabs for indentation (project standard)
   - Follow the naming conventions used in the codebase
   - Keep lines reasonably short (under 120 characters when possible)
   - Add comments for complex logic or non-obvious code

2. **Keep changes focused**:
   - One feature or fix per pull request
   - Avoid mixing refactoring with functional changes
   - Split large changes into smaller, reviewable commits

3. **Test your changes**:
   - Build in both Debug and Release configurations
   - Test the functionality you've changed
   - Verify no new warnings are introduced
   - Check that existing features still work

4. **Update documentation**:
   - Update README.md if you add new features
   - Add entries to CHANGELOG.md
   - Update code comments as needed

### Code Quality

- Ensure your code compiles without warnings in Release configuration
- Use Visual Studio's Code Analysis (already configured in the project)
- Avoid introducing new dependencies unless absolutely necessary
- Check for memory leaks in Debug builds
- Ensure thread-safety for multi-threaded code

### Commit Messages

Write clear, descriptive commit messages:

```
Short (50 chars or less) summary

More detailed explanatory text, if necessary. Wrap it to about 72
characters. The blank line separating the summary from the body is
critical.

- Bullet points are okay
- Use imperative mood: "Add feature" not "Added feature"
- Reference issues: "Fixes #123" or "Relates to #456"
```

## Submitting Changes

1. **Push your changes** to your fork:
   ```bash
   git push origin feature/your-feature-name
   ```

2. **Create a Pull Request**:
   - Go to the original repository on GitHub
   - Click "New Pull Request"
   - Select your fork and branch
   - Fill in the PR template with:
     - Clear description of changes
     - Motivation for the changes
     - Testing performed
     - Any breaking changes

3. **Respond to feedback**:
   - Be open to suggestions and constructive criticism
   - Make requested changes promptly
   - Push additional commits to update the PR

## Areas for Contribution

### Priority Areas

- Bug fixes (especially crashes or data loss issues)
- Performance improvements
- Memory leak fixes
- Compatibility with newer Windows versions
- Security improvements
- Code modernization (C++11/14/17 features where appropriate)

### Documentation

- Improve build instructions
- Add code documentation
- Create tutorials or guides
- Update README with missing information

### Testing

- Report bugs with detailed reproduction steps
- Test on different Windows versions
- Verify fixes for reported issues

## Reporting Issues

### Bug Reports

When reporting bugs, include:
- **Version**: eMule MorphXT version (e.g., v12.8 Beta)
- **Operating System**: Windows version and architecture
- **Steps to reproduce**: Clear, numbered steps
- **Expected behavior**: What should happen
- **Actual behavior**: What actually happens
- **Screenshots**: If applicable
- **Logs**: Relevant log files or error messages

### Feature Requests

For feature requests, describe:
- **Use case**: Why the feature is needed
- **Proposed solution**: How it might work
- **Alternatives**: Other approaches considered
- **Impact**: Who would benefit from this feature

## Code Review Process

All contributions go through code review:

1. Automated checks (build, CodeQL) must pass
2. Code is reviewed by maintainers
3. Requested changes must be addressed
4. Once approved, changes are merged

## License

By contributing, you agree that your contributions will be licensed under the GNU General Public License v2.0, the same license as the project.

## Questions?

If you have questions about contributing:
- Open an issue with the "question" label
- Refer to existing code for examples
- Check the documentation in the repository

Thank you for contributing to eMule MorphXT!
