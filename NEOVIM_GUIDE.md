# Neovim Guide: Modern Vim-based Editing

A quick reference for getting started with Neovim, its modern configuration, and the built-in ecosystem.

## 1. What is Neovim (nvim)?
Neovim is a fork of Vim focused on extensibility and usability.

| Feature                | Neovim Advantage                                 |
| :--------------------- | :----------------------------------------------- |
| **Lua Support**        | Faster, more powerful configuration (Lua vs VimScript). |
| **LSP**                | Built-in Language Server Protocol support.        |
| **Tree-sitter**        | Built-in incremental parser for better syntax highlighting. |
| **API**                | Modern API for external tools and plugins.       |
| **Saner Defaults**     | Many modern features are enabled by default.     |

## 2. Configuration (`init.lua`)
Neovim's modern configuration is written in Lua.

- **File Location:** `~/.config/nvim/init.lua`
- **Essential Lua Settings:**
  - `vim.opt.number = true`: Show line numbers.
  - `vim.opt.relativenumber = true`: Show relative line numbers.
  - `vim.opt.shiftwidth = 4`: Size of an indent.
  - `vim.opt.ignorecase = true`: Ignore case in search patterns.
  - `vim.g.mapleader = " "`: Set the "Leader" key to Space.

## 3. Plugin Management (lazy.nvim)
The most popular modern plugin manager for Neovim.

- **Installation:** Usually requires bootstrapping in your `init.lua`.
- `:Lazy`: Open the Lazy.nvim dashboard.
- `:Lazy sync`: Update all plugins.
- `:Lazy check`: Check for plugin updates.
- `:Lazy clean`: Remove unused plugins.

## 4. LSP and Tree-sitter
Modern Neovim relies on these two core features for an IDE-like experience.

| Component              | Description                                      |
| :--------------------- | :----------------------------------------------- |
| **LSP**                | Handles auto-completion, definitions, and linting. |
| **Mason.nvim**         | A portable package manager for LSP servers/linters. |
| **nvim-treesitter**    | High-performance syntax highlighting and selection. |
| `:LspInfo`             | Check active language servers.                   |
| `:TSUpdate`            | Update Tree-sitter parsers.                      |

## 5. Built-in Terminal
Neovim has a powerful built-in terminal.

- `:terminal` (or `:term`): Open a new terminal buffer.
- `i` (in terminal buffer): Enter **Terminal Mode**.
- `Ctrl-\ Ctrl-n`: Exit **Terminal Mode** to **Normal Mode**.
- `:set shell=/bin/zsh`: Change the default shell used by the terminal.

## 7. Pro Tips & Gotchas
- **Config Path:** Remember that Neovim uses `~/.config/nvim/init.lua` NOT `.vimrc`.
- **Health Check:** If things feel broken, run `:checkhealth` to diagnose.
- **LSP Issues:** If you're not getting completion, check `:LspInfo` to see if your language server is even active.
- **Plugin Management:** Using `lazy.nvim` makes it easy to add plugins. Just add them to your `lua/plugins/` directory.
- **Copying to System Clipboard:** Use `"+y` to yank to the system clipboard (if your Neovim is compiled with clipboard support).
- **Smooth Scrolling:** Use a plugin like `neoscroll.nvim` for a more modern scrolling experience.

---

## 🔗 See Also
- [Vim Basics](VIM_GUIDE.md): The core concepts shared with Neovim.
- [Vim Advanced](VIM_ADVANCED.md): Power-user techniques like macros and marks.
