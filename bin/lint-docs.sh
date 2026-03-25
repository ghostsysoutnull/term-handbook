#!/usr/bin/env bash

# Markdown Linting Script for Developer Tool Guides
# Requirement: markdownlint-cli (npm install -g markdownlint-cli)

if ! command -v markdownlint &> /dev/null; then
    echo "Error: markdownlint is not installed."
    echo "Please install it with: npm install -g markdownlint-cli"
    exit 1
fi

echo "--- Linting Markdown Guides ---"
markdownlint --config .markdownlint.json editors/ terminal/ development/ README.md PROGRESS_PLAN.md GEMINI.md

if [ $? -eq 0 ]; then
    echo "--- All guides passed linting! ---"
else
    echo "--- Linting failed. Please fix the errors above. ---"
    exit 1
fi
