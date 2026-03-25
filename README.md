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
| [Core Utilities](terminal/CORE_UTILITIES.md) | Standard programs like `cp`, `mv`, `source`, `export`. |
| [Compression](terminal/COMPRESSION_GUIDE.md) | Archiving and zipping with `tar`, `gzip`, `zip`. |
| [Zsh Guide](terminal/ZSH_GUIDE.md) | Advanced features, plugins, and Oh My Zsh.   |
| [Linux Filesystem](terminal/FILESYSTEM_GUIDE.md) | Understanding `/etc`, `/usr`, `/var`, and more. |
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
| [sed Guide](development/SED_GUIDE.md)     | Stream editor for bulk text manipulation.      |
| [Makefile Guide](development/MAKEFILE_GUIDE.md) | Task automation and build management.          |
| [Java JDK Guide](development/JAVA_JDK_GUIDE.md) | Essential tools in the modern Java SDK bin.   |
| [awk Guide](development/AWK_GUIDE.md)     | Pattern scanning and text-processing language. |
| [CI/CD Basics](development/CICD_GUIDE.md) | Automating workflows with GitHub Actions.    |
| [GCC Guide](development/GCC_GUIDE.md)     | Compiling C and C++ programs with GCC/G++.     |
| [Compilation Stages](development/COMPILATION_STAGES_GUIDE.md) | Deep dive into the preprocessing, compilation, and linking. |
| [Dotfiles Management](development/DOTFILES_GUIDE.md) | Syncing configs with Bare Git or GNU Stow. |
| [Markdown Best Practices](development/MARKDOWN_GUIDE.md) | Styling and structuring documentation. |

### 🤖 AI Terminal Agents
Level up your workflow with AI-powered terminal assistants.
| Guide                     | Focus                                            |
| :------------------------ | :----------------------------------------------- |
| [Copilot CLI](ai-agents/COPILOT_CLI_GUIDE.md) | Agentic terminal development environment. |
| [Local LLMs](ai-agents/LOCAL_LLM_GUIDE.md) | Running Ollama, vLLM, and LM Studio locally. |
| [Gemini CLI](ai-agents/GEMINI_CLI_GUIDE.md) | AI-powered terminal automation and assistance. |
| [Claude CLI](ai-agents/CLAUDE_CLI_GUIDE.md) | Terminal interaction with Anthropic models.    |
| [codex-cli](ai-agents/CODEX_CLI_GUIDE.md) | OpenAI's conversational terminal coding agent. |

### 🎭 Battle Stories (Real-world Scenarios)
Learn how these tools combine to solve real engineering crises.
- [The 2 AM Log Safari](scenarios/LOG_SAFARI.md): Finding a needle in a 15GB log haystack using `rg`, `awk`, and `sed`.
- [The Firewall Wall](scenarios/FIREWALL_WALL.md): Accessing a private database through an SSH tunnel.
- [The Merge Conflict from Hell](scenarios/MERGE_CONFLICT.md): Resolving complex code conflicts surgically with `vimdiff`.
- [The Nomad Coder](scenarios/NOMAD_CODER.md): Instant environment setup on a fresh machine using Bare Git.
- [The Zombie Process Hunter](scenarios/ZOMBIE_HUNTER.md): Debugging resource leaks with `htop`, `lsof`, and `flock`.
- [The Server that Suffocated](scenarios/SERVER_SUFFOCATED.md): Recovering from 100% disk usage using `find` and `truncate`.
- [The Git Time Traveler](scenarios/GIT_TIME_TRAVELER.md): Recovering lost commits after a `reset --hard` with `reflog`.
- [Scenario Roadmap](PROGRESS_PLAN_SCENARIOS.md): Upcoming stories.

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
ng guides!
