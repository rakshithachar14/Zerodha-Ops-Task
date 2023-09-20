#!/bin/bash

# Check if Vagrant is installed
if ! command -v vagrant &> /dev/null; then
    echo "Vagrant is not installed. Please install Vagrant before running this script."
    exit 1
fi

# Check if the Vagrant box exists, if not, add it
if ! vagrant box list | grep -q "ubuntu/bionic64"; then
    vagrant box add ubuntu/bionic64
fi

# Initialize the Vagrant environment
vagrant init ubuntu/bionic64

# Ensure that the Vagrantfile exists
if [ ! -f Vagrantfile ]; then
    echo "Vagrantfile not found. Something went wrong."
    exit 1
fi

# Start the VM
vagrant up

# Display information about SSH access
vagrant ssh-config

# Done
echo "Vagrant box 'ubuntu/bionic64' is set up and running."
