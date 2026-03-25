#!/bin/bash

# Prompt Picker: Interactive PS1 Selector
# Usage: source bin/prompt-picker.sh

# Check if script is being sourced
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    echo "ERROR: This script must be SOURCED to affect your current shell."
    echo "Usage: source $0"
    exit 1
fi

echo "--- Modern Shell Prompt Picker ---"
echo "Select a sleek prompt style for your current session:"

options=("Sleek Symbol" "Cyberpunk" "Ghost" "Minimalist" "Neon Path")
select opt in "${options[@]}" "Exit"; do
    case $opt in
        "Sleek Symbol")
            # Green path with a Blue chevron
            export PS1='\[\e[32m\]\w \[\e[34m\]❯ \[\e[0m\]'
            break
            ;;
        "Cyberpunk")
            # Magenta user, Cyan host, Yellow path, Green arrow
            export PS1='\[\e[35m\]\u\[\e[0m\]@\[\e[36m\]\h\[\e[0m\] \[\e[33m\]\w\[\e[0m\] \[\e[32m\]➜ \[\e[0m\]'
            break
            ;;
        "Ghost")
            # Dark gray path/host with a Magenta bolt
            export PS1='\[\e[1;30m\]\w \[\e[1;37m\]\h \[\e[35m\]⚡ \[\e[0m\]'
            break
            ;;
        "Minimalist")
            # Directory name only (basename), Green $
            export PS1='\[\e[1;34m\]\W \[\e[1;32m\]$ \[\e[0m\]'
            break
            ;;
        "Neon Path")
            # High-intensity Cyan path on a new line
            export PS1='\[\e[1;36m\]\w\[\e[0m\]\n\[\e[1;32m\]❯ \[\e[0m\]'
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
