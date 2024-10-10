#!/bin/bash

# Set the GitHub organization name
ORG_NAME="ubiquity-os-marketplace"

# Change to the directory containing the cloned repositories
cd "$ORG_NAME" || exit

# Get the list of directories (repositories)
REPOS=$(ls -d */)

# Run git stash and git pull in each repository
for repo in $REPOS; do
    echo "Updating repository: $repo"
    (
        cd "$repo" || continue
        if [ -d ".git" ]; then
            git stash
            git pull || echo "Failed to update $repo. Continuing..."
        else
            echo "Not a git repository: $repo. Skipping..."
        fi
    )
done

echo "All repositories have been updated or attempted to update."
