#!/bin/bash

# Set the GitHub organization name
ORG_NAME="ubiquity-os-marketplace"

# Change to the directory containing the cloned repositories
cd "$ORG_NAME" || exit

# Get the list of directories (repositories)
REPOS=$(ls -d */)

# Run yarn install in each repository
for repo in $REPOS; do
    echo "Installing dependencies for $repo"
    (
        cd "$repo" || continue
        if [ -f "package.json" ]; then
            yarn install || echo "Failed to install dependencies for $repo. Continuing..."
        else
            echo "No package.json found in $repo. Skipping..."
        fi
    )
done

echo "Dependency installation process completed for all repositories."
