#!/usr/bin/env bash

# Check for Homebrew, install if we don't have it
if ! command -v brew &>/dev/null; then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"\
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

echo "Updating Homebrew..."
brew update

echo "Installing Ansible..."
brew install ansible

echo "Installing Ansible Galaxy collections..."
ansible-galaxy collection install community.general

echo "Installing 1Password..."
brew install --cask 1password

echo "Installing 1Password CLI..."
brew install 1password-cli

# Open 1Password GUI for the user to sign in
echo "Opening 1Password for you to sign in. Please sign in to 1Password and then return here."
open -a 1Password

# Wait for the user to press Enter after signing into 1Password
read -p "Press Enter after you've signed into 1Password to continue with the setup..."

# Need this to allow Git to pull from private repositories
export SSH_AUTH_SOCK=~/Library/Group\ Containers/2BUA8C4S2C.com.1password/t/agent.sock

echo "Installing Running Playbook."
ansible-playbook local.yml --core

# Reminder for manual security configurations
echo "----------------------------------------------"
echo "IMPORTANT: Manual Security Configurations Needed"
echo "----------------------------------------------"
echo "Please ensure the following security settings are configured manually:"
echo "1. Turn on the Firewall:"
echo "   - Open System Preferences > Security & Privacy > Firewall."
echo "   - Click the lock to make changes, enter your password, and click 'Turn On Firewall'."
read -p "Press Enter to continue after you have completed this step..."
echo ""
echo "2. Turn on FileVault:"
echo "   - Open System Preferences > Security & Privacy > FileVault."
echo "   - Click the lock to make changes, enter your password, and click 'Turn On FileVault'."
read -p "Press Enter to continue after you have completed this step..."
echo ""
echo "3. Require a password immediately after sleep or screen saver begins:"
echo "   - Open System Preferences > Security & Privacy > General."
echo "   - Click the lock to make changes, set 'Require password' to 'immediately' after sleep or screen saver begins."
read -p "Press Enter to continue after you have completed this step..."
echo ""
echo "4. Privacy - Analytics & Improvements:"
echo "   - Open System Preferences > Security & Privacy > Privacy."
echo "   - Select Analytics & Improvements and ensure that the options are not enabled."
read -p "Press Enter to continue after you have completed this step..."
echo ""
echo "5. Require an administrator password to access system-wide preferences:"
echo "   - Open System Preferences > Security & Privacy > Advanced."
echo "   - Check 'Require an administrator password to access system-wide preferences'."
echo "----------------------------------------------"
read -p "Press Enter to continue after you have completed this step..."
echo ""
# Font setup reminder
echo "Please remember to set up your preferred font in iterm"
read -p "Press Enter to continue after you have set up the fonts..."

echo "Setup is complete!"