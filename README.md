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

### First-Time Setup

Follow these steps when setting up your development environment for the first time:

1. **Clone All Repositories**

   Run the `clone-all-marketplace.sh` script to clone all repositories from the organization.

   ```bash
   ./clone-all-marketplace.sh
   ```

2. **Install Dependencies**

   After cloning, install all dependencies by running:

   ```bash
   ./yarn-install-all.sh
   ```

### Active Development Workflow

While actively working on the projects, it's important to keep your local repositories up-to-date:

1. **Update All Repositories**

   Before starting your work session, pull the latest changes:

   ```bash
   ./git-pull-all.sh
   ```

2. **Regularly Pull Updates**

   If you've been away or after other developers have pushed significant changes, it's recommended to run the update script again:

   ```bash
   ./git-pull-all.sh
   ```

## Enhanced Developer Experience `setup-and-update-all.sh`

To streamline the workflow further, we've provided a new script that combines the above scripts and offers an interactive interface.

### Using the Combined Script

Ensure all individual scripts (`clone-all-marketplace.sh`, `yarn-install-all.sh`, `git-pull-all.sh`) are in the same directory and have execute permissions.

Run the combined script:

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