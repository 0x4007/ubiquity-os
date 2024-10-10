#!/bin/bash

# Set the GitHub organization name
ORG_NAME="ubiquity-os-marketplace"

# Create a directory to store the cloned repositories
mkdir -p "$ORG_NAME"
cd "$ORG_NAME"

# Get the list of repositories
REPOS=$(curl -s -H "Authorization: token $GITHUB_TOKEN" "https://api.github.com/orgs/$ORG_NAME/repos" | grep -o '"clone_url": "[^"]*' | sed 's/"clone_url": "//')

# Clone each repository
for repo in $REPOS; do
    repo_name=$(basename "$repo" .git)
    if [ -d "$repo_name" ]; then
        echo "Repository $repo_name already exists. Skipping..."
    else
        git clone "$repo" || echo "Failed to clone $repo. Continuing..."
    fi
done

echo "All repositories have been cloned or attempted to clone."
