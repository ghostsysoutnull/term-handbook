# Developer Tool Guides

A curated collection of practical, concise guides for essential terminal and development tools.

## 🚀 Quick Start
Welcome! This repository contains high-quality Markdown guides designed for quick reference and deep learning. Whether you're a Vim power user or just getting started with Git, you'll find what you need here.

---

## 🛠️ The Guides

### 1. Text Editors
| Guide                     | Focus                                            |
| :------------------------ | :----------------------------------------------- |
| [Vim Basics](editors/VIM_GUIDE.md) | Opening, saving, splits, and essential settings. |
| [Vim Advanced](editors/VIM_ADVANCED.md) | Markers, macros, visual block mode, and more. |
| [Emacs Guide](editors/EMACS_GUIDE.md) | Tiered reference for the extendable text editor. |
| [Neovim](editors/NEOVIM_GUIDE.md) | Modern config (Lua), LSP, and plugin ecosystem. |
| [nano](editors/NANO_GUIDE.md)     | Simple, fast text editing for quick tasks.       |

### 2. Shell & Terminal Environment
| Guide                     | Focus                                            |
| :------------------------ | :----------------------------------------------- |
| [Shell Basics](terminal/SHELL_GUIDE.md) | Bash and Zsh navigation, aliases, and logic. |
| [Power User Toolkit](terminal/POWER_USER_TOOLKIT.md) | `fzf`, `ripgrep`, `fd`, and `jq` essentials. |
| [SSH & Networking](terminal/SSH_GUIDE.md) | Secure remote access, keys, and tunnels.     |
| [Modern Alternatives](terminal/MODERN_ALTERNATIVES.md) | `bat`, `eza`, `zoxide`, `btop`, `zellij`, and `yazi`. |
| [Docker Essentials](development/DOCKER_GUIDE.md) | Container management, images, and Compose.   |
| [SysAdmin Essentials](terminal/SYSADMIN_GUIDE.md) | `systemd`, `journalctl`, `cron`, and `ufw`.  |
| [Web Browsers](terminal/WEB_BROWSERS_GUIDE.md) | Browsing without a GUI with `lynx`, `w3m`, and `elinks`. |
| [htop Guide](terminal/HTOP_GUIDE.md) | Interactive process monitoring and management. |
| [GNU Screen](terminal/SCREEN_GUIDE.md) | Session and window management for Screen.    |
| [tmux](terminal/TMUX_GUIDE.md)     | Advanced session, pane, and layout management.   |
| [Screen vs. tmux](terminal/SCREEN_VS_TMUX.md) | A deep dive into the architectural differences. |

### 3. Source Control & Documentation
| Guide                     | Focus                                            |
| :------------------------ | :----------------------------------------------- |
| [Git Guide](development/GIT_GUIDE.md) | Branching, merging, stashing, and remotes.       |
| [GitHub CLI](development/GH_GUIDE.md) | Terminal-based GitHub repository management.   |
| [Regex Master](development/REGEX_GUIDE.md) | The universal language of pattern matching.    |
| [awk Guide](development/AWK_GUIDE.md) | Pattern scanning and text-processing language. |
| [CI/CD Basics](development/CICD_GUIDE.md) | Automating workflows with GitHub Actions.    |
| [Dotfiles Management](development/DOTFILES_GUIDE.md) | Syncing configs with Bare Git or GNU Stow. |
| [Markdown Best Practices](development/MARKDOWN_GUIDE.md) | Styling and structuring documentation. |

---

## 🛠️ Repository Tools
- **[Search Script](bin/guide-find.sh):** Quickly search for a command across all guides.
  - **Usage:** `./bin/guide-find.sh <search_term>`
- **[Linting Script](bin/lint-docs.sh):** Check all guides for styling and consistency.
  - **Usage:** `./bin/lint-docs.sh` (Requires `markdownlint-cli`).

---

## 📜 Repository Meta
- [Project Plan](PROGRESS_PLAN.md): Track the current progress and future tasks.
- [Project Mandates](GEMINI.md): Standards for all documentation.
- **Goal:** Provide distraction-free, terminal-friendly documentation.

---

## 📝 Contributions
Feel free to suggest new topics or refinements to existing guides!
