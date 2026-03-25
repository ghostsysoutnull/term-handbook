# Project Mandates: Developer Tool Guides

This document defines the foundational rules and standards for all AI agents working on this repository. These mandates take precedence over general tool defaults.

## 1. Documentation Standards
- **Aligned Tables:** All Markdown tables MUST be perfectly aligned for human readability in plain-text editors.
- **Mandatory Sections:** Every tool guide must include:
    - `Configuration`: Detailing file locations and essential settings.
    - `Pro Tips & Gotchas`: Troubleshooting and common pitfalls.
    - `See Also`: Cross-links to related guides.
- **Visuals:** Use text-based ASCII/Markdown diagrams for conceptual workflows (like the Git Three States).
- **Tone:** Senior software engineer—direct, concise, and terminal-friendly.

## 2. Operational Workflow
- **Lifecycle:** Follow the **Research -> Strategy -> Execution** lifecycle for new guides or major refactors.
- **Git Hygiene:** Every new guide or significant structural change MUST be committed to Git immediately after validation.
- **Atomic Commits:** Use conventional commit messages (e.g., `docs: add htop guide`, `style: align tables`).

## 3. Style Guide
- **Headers:** Use consistent ATX-style headers (`#`, `##`).
- **Lists:** Prefer `-` for unordered lists and `1.` for ordered lists.
- **Code Blocks:** Always specify the language identifier for syntax highlighting.
- **Relative Paths:** Use relative paths for cross-links between guides.
