#!/bin/bash

clear

# Stylish welcome message
echo "╔═════════════════════════════════════════════════════════════╗"
echo "║                                                             ║"
echo "║         WELCOME TO THE LEGENDARY REGISTRATION PORTAL        ║"
echo "║                                                             ║"
echo "║     Create your account to unlock access to secret realms!  ║"
echo "║                                                             ║"
echo "╚═════════════════════════════════════════════════════════════╝"
echo ""

# Ask for user information
read -p " Please enter your full name: " name
read -p " Please enter your email address: " email

# Secure password input
read -s -p " Create your password: " password
echo ""
read -s -p " Confirm your password: " confirm
echo ""

echo ""
echo "═══════════════════════════════════════════════════════════════"

# Password verification
if [ "$password" == "$confirm" ]; then
    echo " Registration Successful!"
    echo " Name: $name"
    echo " Email: $email"

    # Save to file
    echo "$name | $email" >> users.txt
    echo " Your information has been saved to users.txt"
else
    echo " Passwords do not match. Please try again."
fi
