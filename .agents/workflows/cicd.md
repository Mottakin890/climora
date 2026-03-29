---
description: CI/CD Workflow for Climora
---

# CI/CD Workflow 🚀

This workflow explains how the Climora project handles Continuous Integration and Automation.

## Overview

Climora uses **GitHub Actions** for automated testing and building. The workflow is located at `.github/workflows/main.yml`.

### Automated Steps

Whenever you push to `main` or open a PR:

1.  **Checkout**: Pulls the latest code from the repository.
2.  **Flutter Setup**: Installs the specified Flutter SDK version.
3.  **Dependency Get**: Runs `flutter pub get` to fetch all project packages.
4.  **Static Analysis**: Runs `flutter analyze` to ensure code follows Dart guidelines and has no syntax errors.
5.  **Tests**: If a `test/` directory exists, it runs `flutter test`.
6.  **Build Verification**: Runs `flutter build apk --release` to verify the production compilation.

### Local Quality Control

Before pushing code, you should manually run these commands to ensure the CI passes:

```bash
# 1. Check for linting issues
flutter analyze

# 2. Run unit and widget tests
flutter test

# 3. Verify release build
flutter build apk --release
```

## Troubleshooting

- **Build Failures**: If the build fails on CI but works locally, verify that your `.env` flags or any ignored files are handled in the CI environment (e.g., using GitHub Secrets).
- **Test Failures**: Ensure you are not relying on local file paths that aren't committed to Git.
- **Flutter Version**: The CI uses Flutter SDK version `3.11.4` as specified in `pubspec.yaml`.
