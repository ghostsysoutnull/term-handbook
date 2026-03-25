# Modern Terminal Alternatives: Classic Tools Reimagined

A quick reference for modern, high-performance, and feature-rich alternatives to traditional Unix commands.

## 1. bat (`cat` / `less` alternative)
`bat` is a `cat` clone with syntax highlighting, git integration, and automatic paging.

| Command                | Description                                      |
| :--------------------- | :----------------------------------------------- |
| `bat <file>`           | View a file with syntax highlighting and line numbers. |
| `bat -A <file>`        | Show all non-printable characters (tabs, spaces, etc.). |
| `bat -l <lang> <f>`    | Manually set the language for syntax highlighting. |
| `bat --list-themes`    | List all available color themes.                 |
| `bat --theme <name>`   | Preview a file with a specific theme.           |

### Configuration
- **File Location:** `~/.config/bat/config`
- **Settings:**
  - `--theme="TwoDark"`: Set your default theme.
  - `--style="numbers,changes"`: Customize the decorations.

### Pro Tips & Gotchas
- **Paging:** `bat` automatically pipes output to `less` if it doesn't fit on one screen.
- **Git Integration:** `bat` shows `+`, `-`, and `~` in the sidebar to indicate changes since your last commit.
- **Tail Replacement:** Use `tail -f file | bat --paging=never -l log` for live log monitoring with syntax highlighting.
- **Alias cat:** Many users add `alias cat='bat'` to their `.bashrc` or `.zshrc`.

## 2. eza (`ls` / `tree` alternative)
`eza` is a successor to `exa`. It features icons, color-coded file types, and a much better tree view.

| Command                | Description                                      |
| :--------------------- | :----------------------------------------------- |
| `eza`                  | Basic listing with color coding.                 |
| `eza -l --icons`       | Long listing with icons.                         |
| `eza -T`               | Recurse into directories (Tree view).            |
| `eza --git`            | Show Git status for each file.                   |
| `eza --header`         | Add a header line to each column.                |

### Configuration
- **Environment Variables:**
  - `EZA_ICONS_AUTO=1`: Automatically enable icons.
  - `EZA_STRICT=1`: Treat warnings as errors.

### Pro Tips & Gotchas
- **Tree Depth:** Use `eza -T -L 2` to see two levels of directory nesting.
- **Git State:** `eza --git` is incredibly helpful to see which files are modified or untracked directly in your `ls` output.
- **Sorting:** Use `eza --sort=size` or `eza --sort=modified` for quick analysis.
- **Icons:** You MUST have a **Nerd Font** installed in your terminal to see the icons correctly.

## 3. zoxide (`cd` alternative)
`zoxide` is a smarter `cd` command that learns which directories you visit most frequently.

| Command                | Description                                      |
| :--------------------- | :----------------------------------------------- |
| `z <path>`             | Jump to a directory matching the path.            |
| `zi <path>`            | Interactive jump using a fuzzy finder (like `fzf`).|
| `z -`                  | Jump to the previous directory.                  |
| `zoxide query -l`      | List all directories in the database.            |
| `zoxide remove <p>`    | Remove a directory from the database.            |

### Configuration
- **Shell Integration:** You must initialize `zoxide` in your shell config:
  - Bash: `eval "$(zoxide init bash)"`
  - Zsh: `eval "$(zoxide init zsh)"`

### Pro Tips & Gotchas
- **Frecency:** `zoxide` uses a "frecency" algorithm (frequency + recency). The more you visit a directory, the easier it is to "z" to it.
- **Shortcuts:** You don't need the full path. `z term` will likely jump you to `~/projects/term-handbook`.
- **Interactive Mode:** `zi` is incredibly powerful when combined with `fzf`. It lets you pick from a list of your most common directories.
- **Initial Setup:** It won't work for directories you haven't visited yet since installing it. Once you `cd` into them once, `zoxide` will remember them.

---

## 🔗 See Also
- [Shell Basics](SHELL_GUIDE.md): Master the pipes and redirections these tools use.
- [Power User Toolkit](POWER_USER_TOOLKIT.md): Modern search tools like `ripgrep` and `fd`.
