#!/bin/bash

# Prompt Picker: Interactive PS1 Selector
# Usage: source bin/prompt-picker.sh

# Check if script is being sourced
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    echo "ERROR: This script must be SOURCED to affect your current shell."
    echo "Usage: source $0"
    exit 1
fi

echo "--- Ultimate Shell Prompt Picker ---"
echo "Select a sleek prompt style for your current session:"

options=(
    "Sleek Symbol" 
    "Cyberpunk" 
    "Ghost" 
    "Minimalist" 
    "Neon Path"
    "Zen Dot"
    "Dracula"
    "Nordic"
    "Matrix"
    "Solarized"
)

select opt in "${options[@]}" "Exit"; do
    case $opt in
        "Sleek Symbol")
            export PS1='\[\e[32m\]\w \[\e[34m\]❯ \[\e[0m\]'
            break
            ;;
        "Cyberpunk")
            export PS1='\[\e[35m\]\u\[\e[0m\]@\[\e[36m\]\h\[\e[0m\] \[\e[33m\]\w\[\e[0m\] \[\e[32m\]➜ \[\e[0m\]'
            break
            ;;
        "Ghost")
            export PS1='\[\e[1;30m\]\w \[\e[1;37m\]\h \[\e[35m\]⚡ \[\e[0m\]'
            break
            ;;
        "Minimalist")
            export PS1='\[\e[1;34m\]\W \[\e[1;32m\]$ \[\e[0m\]'
            break
            ;;
        "Neon Path")
            export PS1='\[\e[1;36m\]\w\[\e[0m\]\n\[\e[1;32m\]❯ \[\e[0m\]'
            break
            ;;
        "Zen Dot")
            # Just a green dot, very clean
            export PS1='\[\e[1;32m\]● \[\e[0m\]'
            break
            ;;
        "Dracula")
            # Purple/Pink/Yellow theme
            export PS1='\[\e[1;35m\]\u \[\e[33m\]in \[\e[1;36m\]\w \[\e[1;32m\]λ \[\e[0m\]'
            break
            ;;
        "Nordic")
            # Frosty Blue/White theme
            export PS1='\[\e[34m\]\u\[\e[37m\]@\[\e[36m\]\h \[\e[34m\]\w \[\e[36m\]» \[\e[0m\]'
            break
            ;;
        "Matrix")
            # Classic Green on Black
            export PS1='\[\e[32m\][\u@\h \W]\$ \[\e[0m\]'
            break
            ;;
        "Solarized")
            # Yellow/Orange/Green theme
            export PS1='\[\e[33m\]\u \[\e[31m\]\w \[\e[32m\]$ \[\e[0m\]'
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
