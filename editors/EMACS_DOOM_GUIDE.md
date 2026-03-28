# Doom Emacs Guide: The Faster, "Vim-First" Emacs

Doom Emacs is a configuration framework for Emacs focused on performance, a modular design, and an "opinionated" Vim-first experience (via Evil-mode).

## 1. The `doom` CLI
Unlike vanilla Emacs, Doom relies on a terminal-based tool for management. These commands are essential for maintaining your environment.

| Command        | Action                                                  |
| :------------- | :------------------------------------------------------ |
| `doom sync`    | **Synchronize** config: installs packages and clears caches. |
| `doom doctor`  | **Diagnose** issues with your installation and environment. |
| `doom upgrade` | **Update** Doom Emacs and all installed packages.       |
| `doom purge`   | **Cleanup** orphaned packages and optimize the cache.   |
| `doom env`     | **Dump** shell environment to a file for GUI Emacs use. |

## 2. Navigation & General Commands
Doom uses `SPC` (Space) as its primary **Leader** key. Most sequences follow a logical mnemonic.

| Keybinding | Action                                           |
| :--------- | :----------------------------------------------- |
| `SPC .`    | **Find** file (in current directory).            |
| `SPC ,`    | **Switch** to another open buffer.               |
| `SPC SPC`  | **Find** file anywhere in the current project.   |
| `SPC :`    | **Execute** an Emacs command (M-x).              |
| `SPC f s`  | **Save** the current file.                       |
| `SPC q q`  | **Quit** Emacs.                                  |
| `SPC h r r`| **Reload** your configuration without restarting.|

## 3. Buffers, Windows, and Projects
Managing your workspace efficiently.

### Windows and Buffers
| Keybinding      | Action                                          |
| :-------------- | :---------------------------------------------- |
| `SPC w v / s`   | Split window **Vertically** / **Symmetrically**.|
| `SPC w h/j/k/l` | Move focus **Left/Down/Up/Right**.              |
| `SPC w c`       | **Close** current window.                       |
| `SPC b k`       | **Kill** (close) the current buffer.            |
| `SPC b B`       | List **all** open buffers.                      |

### Project Management (Projectile)
| Keybinding | Action                                           |
| :--------- | :----------------------------------------------- |
| `SPC p p`  | **Switch** to a different project.               |
| `SPC p t`  | Toggle the **Project Tree** (File Explorer).     |
| `SPC s p`  | **Search** (Grep/Ripgrep) across the project.    |
| `SPC p i`  | **Invalidate** project cache (force re-index).   |

## 4. Configuration
Doom's configuration is split into three main files, typically located in `~/.config/doom/` or `~/.doom.d/`.

| File          | Purpose                                                     |
| :------------ | :---------------------------------------------------------- |
| `init.el`     | Enable/disable Doom **Modules** (LSP, UI, Languages).       |
| `config.el`   | Your personal **Customization** (keybindings, themes, UI).  |
| `packages.el` | Declare **External Packages** not included in modules.      |

### Applying Changes
After modifying any of these files, you **MUST** run the following in your terminal:
```bash
doom sync
```

## 5. Pro Tips & Gotchas
- **The "Sync" Rule:** If you add a package in `packages.el` or toggle a module in `init.el`, it won't work until you run `doom sync`.
- **Doctor's Orders:** If things feel slow or broken, run `doom doctor`. It catches 90% of environment and dependency issues.
- **Environment Variables:** GUI Emacs doesn't always inherit your shell's `$PATH`. Run `doom env` after changing your `.zshrc` or `.bashrc` to fix this.
- **Vim Power:** Since Doom uses `evil-mode`, all standard Vim commands (like `:%s/find/replace/g` or `dd`) work natively.

---

## 🔗 See Also
- [Emacs Guide](EMACS_GUIDE.md): Understanding the underlying Emacs Lisp and Org-mode.
- [Vim Basics](VIM_GUIDE.md): Core navigation concepts for Evil-mode.
- [Neovim](NEOVIM_GUIDE.md): Modern Vim features that inspired Doom's modularity.
