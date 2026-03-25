#!/usr/bin/env bash

# Interactive Search Script for Developer Tool Guides
# Usage: ./bin/guide-find.sh <search_term>

SEARCH_TERM=$1

if [ -z "$SEARCH_TERM" ]; then
    echo "Usage: $0 <search_term>"
    exit 1
fi

# Check if ripgrep is installed for better performance
if command -v rg &> /dev/null; then
    rg -i -C 2 "$SEARCH_TERM" editors/ terminal/ development/
else
    # Fallback to standard grep
    grep -r -i -C 2 "$SEARCH_TERM" editors/ terminal/ development/
fi
