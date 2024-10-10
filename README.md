###### Last updated on 10 October 2024
# UbiquityOS Marketplace Developer Tools

This repository provides a set of scripts to streamline the development workflow for the **UbiquityOS Marketplace**. These scripts allow developers to:

- Clone all repositories from the `ubiquity-os-marketplace` GitHub organization.
- Install dependencies for all cloned repositories using `yarn`.
- Update all repositories by pulling the latest changes.

## Usage Instructions

### Prerequisites

- **Git** must be installed and configured on your machine.
- **Yarn** should be installed globally.
- **GitHub Personal Access Token**: To authenticate with GitHub API, set the environment variable `GITHUB_TOKEN` with a token that has access to the organization's repositories.

### Using `setup-and-update-all.sh`


```bash
./setup-and-update-all.sh
```

This script provides an interactive menu to guide you through the setup and update processes.

## Notes

- Ensure that the `GITHUB_TOKEN` environment variable is set in your shell before running these scripts.
- The scripts assume that you're using `yarn` as your package manager.
- The scripts are designed to be idempotent; running them multiple times should not cause issues.
- Avoid using `require()` statements in your code; prefer `import` statements as per project guidelines.

## Contributing

Contributions are welcome! If you have improvements or additional scripts that can enhance the developer experience, feel free to open a pull request.

## License

This project is licensed under the MIT License.