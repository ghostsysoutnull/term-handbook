# Zsh Guide: The Z Shell

A quick reference for `Zsh`, the modern, highly customizable shell that builds on Bash with advanced features.

## 1. Key Features
| Feature                | Description                                      |
| :--------------------- | :----------------------------------------------- |
| **Spelling Correction**| Automatically suggests corrections for typos.    |
| **Advanced Globbing**  | Powerful recursive patterns (e.g., `**/file.txt`).|
| **Shared History**     | Sync history across all open terminal windows.   |
| **Menu Completion**    | Interactive, arrow-key based tab completion.     |
| **Theming**            | Native support for sophisticated prompts.        |

## 2. Navigation & Globbing
Zsh makes file manipulation much faster with extended globbing.

| Pattern                | Description                                      |
| :--------------------- | :----------------------------------------------- |
| `**/*.js`              | Find all `.js` files in current and subdirs.     |
| `file.(txt|md)`        | Match `file.txt` OR `file.md`.                   |
| `^config.json`         | Match all files EXCEPT `config.json`.            |
| `*(/)`                 | Match only directories.                          |
| `*(@)`                 | Match only symbolic links.                       |

## 3. Plugin Ecosystems
Most Zsh users use a framework to manage plugins and themes.

### Oh My Zsh
The most popular framework.
- **Install:** `sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"`
- **Plugins:** `git`, `docker`, `python`, `zsh-autosuggestions`.
- **Themes:** `robbyrussell`, `agnoster`.

### Antidote / Zinit
Faster, more modern alternatives for performance-oriented users.

## 4. Customization
Zsh is configured via the `.zshrc` file in your home directory.

- **File Location:** `~/.zshrc`
- **Essential Options:**
  ```zsh
  # Enable advanced tab completion
  autoload -Uz compinit && compinit
  zstyle ':completion:*' menu select

  # Share history across sessions
  setopt SHARE_HISTORY

  # Case-insensitive completion
  zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
  ```

## 5. Built-in Utilities
- **`vared`**: Edit an environment variable in-place (e.g., `vared PATH`).
- **`zcalc`**: A built-in calculator (`autoload -Uz zcalc && zcalc`).
- **`zmv`**: Batch rename files using patterns (e.g., `zmv '(*).js' '$1.ts'`).

## 6. Pro Tips & Gotchas
- **Suffix Aliases:** You can map file extensions to programs: `alias -s pdf=zathura`. Now typing `file.pdf` opens the viewer!
- **History Search:** Press `Ctrl-r` for standard search, but many Zsh themes allow you to type part of a command and hit `Up` to find matches.
- **Performance:** If Zsh feels slow, check your plugins. Some heavy themes or large history files can cause lag.
- **Default Shell:** Change your default to Zsh with `chsh -s $(which zsh)`.

---

## 🔗 See Also
- [Shell Basics](SHELL_GUIDE.md): Foundational commands common to Bash and Zsh.
- [Dotfiles Management](../development/DOTFILES_GUIDE.md): Best practices for syncing your `.zshrc`.
- [Modern Alternatives](MODERN_ALTERNATIVES.md): Tools like `zoxide` that integrate perfectly with Zsh.
