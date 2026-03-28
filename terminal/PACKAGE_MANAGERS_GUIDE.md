# Package Managers Guide: Mastering the Gatekeepers

Package managers are the primary tools for installing, updating, and maintaining software in a Unix-like environment. This guide covers OS-native managers, cross-platform tools like Homebrew, and the declarative power of Nix.

## 1. The Rosetta Stone (Universal Syntax)
Most package managers follow similar patterns. Use this table to translate commands between systems.

| Action          | `apt` (Debian/Ubuntu) | `pacman` (Arch) | `brew` (macOS/Linux) | `nix-env` (Nix) |
| :-------------- | :-------------------- | :-------------- | :------------------- | :-------------- |
| **Search**      | `apt search <pkg>`    | `pacman -Ss`    | `brew search`        | `nix-env -qa`   |
| **Install**     | `sudo apt install`    | `sudo pacman -S`| `brew install`       | `nix-env -iA`   |
| **Update List** | `sudo apt update`     | `sudo pacman -Sy`| `brew update`        | (Automatic)     |
| **Upgrade All** | `sudo apt upgrade`    | `sudo pacman -Su`| `brew upgrade`       | `nix-env -u`    |
| **Remove**      | `sudo apt remove`     | `sudo pacman -Rs`| `brew uninstall`     | `nix-env -e`    |
| **Cleanup**     | `sudo apt autoremove` | `sudo pacman -Rns $(...)| `brew cleanup`       | `nix-collect-garbage`|

## 2. Homebrew: The Cross-Platform Choice
Originally for macOS, "Linuxbrew" is now integrated into Homebrew, making it a great way to get modern tools on older Linux servers without `sudo`.

- **Install Location:** `/opt/homebrew` (macOS Apple Silicon) or `/home/linuxbrew/.linuxbrew` (Linux).
- **The "Taps" System:** Use `brew tap <user/repo>` to add third-party repositories (e.g., `brew tap d12frosted/emacs-plus`).
- **Brew Bundle:** Use a `Brewfile` to declare your entire system state:
  ```bash
  brew bundle dump    # Create a Brewfile from current installs
  brew bundle install # Install everything listed in a Brewfile
  ```

## 3. Nix: Reproducible Environments
Nix is a functional package manager that ensures your environment is exactly the same every time you install it.

### The Nix Philosophy
- **Isolation:** Packages are installed in `/nix/store/` with unique hashes. Multiple versions of the same app can coexist without conflict.
- **Rollbacks:** If an update breaks your system, you can instantly roll back to a previous "generation."
- **Shells on the Fly:** Test a tool without installing it globally:
  ```bash
  nix-shell -p htop # Drops you into a shell with htop available
  ```

### Nix Flakes (Modern Nix)
Flakes are the new standard for managing Nix projects with locked dependencies.
- `nix flake update`: Update all dependencies to their latest locked versions.
- `nix run github:user/repo`: Run an application directly from a GitHub repository.

## 4. Language-Specific Managers
While OS managers handle binaries, these tools handle libraries for specific languages.

| Language | Manager | Key Command |
| :------- | :------ | :---------- |
| **Node.js** | `npm` / `pnpm` | `pnpm install` |
| **Python** | `pip` / `uv` | `uv pip install` |
| **Rust** | `cargo` | `cargo install` |
| **Go** | `go` | `go install` |

## 5. Pro Tips & Gotchas
- **Avoid `sudo` with Brew:** Never run `sudo brew`. It is designed to run as a standard user.
- **The "Doctor" Command:** Both `brew doctor` and `doom doctor` (for Emacs) are your first line of defense when something goes wrong.
- **Nix Garbage Collection:** Nix doesn't delete old versions automatically. Run `nix-collect-garbage -d` periodically to free up disk space.
- **PPA vs. Taps:** In `apt`, you use `add-apt-repository` (PPAs). In `brew`, you use `tap`. Both can be security risks; check the source before adding.

---

## 🔗 See Also
- [Shell Basics](../terminal/SHELL_GUIDE.md): Master the shell environment where these managers live.
- [Dotfiles Management](../development/DOTFILES_GUIDE.md): Using Brew or Nix to sync your environment.
- [Doom Emacs](../editors/EMACS_DOOM_GUIDE.md): Examples of using `apt` and `brew` for setup.
