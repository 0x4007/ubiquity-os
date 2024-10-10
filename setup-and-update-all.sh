#!/bin/bash

# Set the GitHub organization name
ORG_NAME="ubiquity-os-marketplace"

# Function to check if repositories have been cloned
check_cloned() {
    if [ -d "$ORG_NAME" ] && [ "$(ls -A $ORG_NAME)" ]; then
        return 0
    else
        return 1
    fi
}

echo "Welcome to the Ubiquity OS Marketplace Setup and Update Script!"

echo "Select an option:"
echo "1) First-Time Setup (Clone, Install Dependencies)"
echo "2) Update All Repositories"
echo "3) Install Dependencies Only"
echo "4) Exit"

read -p "Enter your choice [1-4]: " choice

case $choice in
    1)
        echo "Starting first-time setup..."

        # Clone repositories
        ./setup/clone-all-marketplace.sh

        # Install dependencies
        ./setup/yarn-install-all.sh

        echo "First-time setup completed."
        ;;
    2)
        if check_cloned; then
            echo "Updating all repositories..."

            # Update repositories
            ./setup/git-pull-all.sh

            echo "Update completed."
        else
            echo "Repositories have not been cloned yet. Please run the first-time setup."
        fi
        ;;
    3)
        if check_cloned; then
            echo "Installing dependencies for all repositories..."

            # Install dependencies
            ./setup/yarn-install-all.sh

            echo "Dependencies installation completed."
        else
            echo "Repositories have not been cloned yet. Please run the first-time setup."
        fi
        ;;
    4)
        echo "Exiting."
        ;;
    *)
        echo "Invalid choice. Exiting."
        ;;
esac