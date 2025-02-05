#!/bin/bash

# Prompt for required environment variables
echo "Enter the number of MetaTrader profiles (default: 1):"
read METATRADER_NB_PROFILES
METATRADER_NB_PROFILES=${METATRADER_NB_PROFILES:-1}

echo "Enter the MetaTrader username (default: metatrader):"
read METATRADER_USER
METATRADER_USER=${METATRADER_USER:-metatrader}

echo "Enter the MetaTrader password (default: metatrader):"
read -s METATRADER_PASSWORD
METATRADER_PASSWORD=${METATRADER_PASSWORD:-metatrader}

# Prompt for SSH connection details
echo "Enter the target host (e.g., user@hostname or 'localhost' for local execution you must have exchanged ssh key):"
read TARGET_HOST

# Export variables so Ansible can access them
export METATRADER_NB_PROFILES
export METATRADER_USER
export METATRADER_PASSWORD

# Run the Ansible playbook
if [[ "$TARGET_HOST" == "localhost" ]]; then
    ansible-playbook -i localhost, -c local install_metatrader.yml
else
    ansible-playbook -i "$TARGET_HOST," install_metatrader.yml --ask-pass
fi
