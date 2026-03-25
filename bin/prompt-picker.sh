#!/bin/bash

# Prompt Picker: Interactive PS1 Selector
# Usage: source bin/prompt-picker.sh

# Check if script is being sourced
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    echo "ERROR: This script must be SOURCED to affect your current shell."
    echo "Usage: source $0"
    exit 1
fi

echo "--- Shell Prompt Picker ---"
echo "Select a prompt style to apply to your current session:"

options=("Default" "Minimal" "Colorful" "Informative" "Power User")
select opt in "${options[@]}" "Exit"; do
    case $opt in
        "Default")
            export PS1='\u@\h:\w\$ '
            break
            ;;
        "Minimal")
            export PS1='\w\$ '
            break
            ;;
        "Colorful")
            # Green user@host, Blue path
            export PS1='\[\e[32m\]\u@\h\[\e[0m\]:\[\e[34m\]\w\[\e[0m\]\$ '
            break
            ;;
        "Informative")
            # Date, Time, User@Host, Path
            export PS1='[\d \t] \u@\h:\w\$ '
            break
            ;;
        "Power User")
            # Multiline: Date/Time/User@Host/Path on top, prompt on bottom
            export PS1='--- [\d \t] \u@\h ---\n\w\$ '
            break
            ;;
        "Exit")
            echo "Exiting."
            return 0
            ;;
        *) 
            echo "Invalid option $REPLY"
            ;;
    esac
done

echo "Prompt applied. To make this permanent, add the following to your ~/.bashrc:"
echo "export PS1='$PS1'"
