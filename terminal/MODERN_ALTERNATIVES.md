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

---

## 🔗 See Also
- [Shell Basics](SHELL_GUIDE.md): Master the pipes and redirections these tools use.
- [Power User Toolkit](POWER_USER_TOOLKIT.md): Modern search tools like `ripgrep` and `fd`.
