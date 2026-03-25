# Dotfiles Management Guide: Sync Your Configs

A quick reference for managing and syncing your configuration files (dotfiles) across multiple machines.

## 1. Why Manage Dotfiles?
- **Sync:** Keep your Vim, Zsh, and tmux configs the same everywhere.
- **Backup:** Never lose your carefully crafted settings again.
- **Onboarding:** Set up a new machine in minutes, not hours.

## 2. Method 1: The Git "Bare" Repository
This is the most modern and "native" way to manage dotfiles without using extra tools or symlinks.

| Step           | Command                                          | Description                                      |
| :------------- | :----------------------------------------------- | :----------------------------------------------- |
| **Initialize** | `git init --bare $HOME/.cfg`                     | Create a bare repo in a hidden folder.           |
| **Alias**      | `alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'` | Create a custom git command. |
| **Config**     | `config config --local status.showUntrackedFiles no`| Hide all files in $HOME by default.          |
| **Add File**   | `config add .vimrc`                              | Stage a dotfile.                                 |
| **Commit**     | `config commit -m "add vimrc"`                   | Commit the change.                               |
| **Push**       | `config push origin main`                        | Push to your remote (e.g., GitHub).              |

## 3. Method 2: GNU Stow (Symlink Manager)
Stow is a symlink farm manager which takes distinct packages of software and installs them into a single directory tree.

| Step           | Command                                          | Description                                      |
| :------------- | :----------------------------------------------- | :----------------------------------------------- |
| **Structure**  | `mkdir -p ~/dotfiles/vim`                        | Create a folder for each "package".              |
| **Move File**  | `mv ~/.vimrc ~/dotfiles/vim/`                    | Move your config into the dotfiles folder.       |
| **Symlink**    | `cd ~/dotfiles && stow vim`                      | Stow creates the symlink at `~/.vimrc`.          |
| **Remove**     | `stow -D vim`                                    | Remove the symlinks.                             |

## 4. Best Practices
- **Separate Secrets:** NEVER commit API keys or passwords. Use a `.env.local` or a secret manager.
- **Bootstrap Script:** Create a `setup.sh` that installs your packages and runs `stow` or the bare repo alias.
- **Platform Specifics:** Use logic in your configs to handle macOS vs Linux differences (e.g., `if [[ "$OSTYPE" == "darwin"* ]]; then ...`).

## 5. Pro Tips & Gotchas
- **Alias Persistence:** Add your `config` alias to your `.bashrc` or `.zshrc` immediately, or you'll lose access to your "config" command.
- **Bare Repo Safety:** The bare repo method is powerful but can be dangerous if you run `git clean` by mistake. Always double-check your commands.
- **Stow Folder Nesting:** Stow mimics the folder structure. If you want to stow `~/.config/nvim/init.lua`, your folder should be `~/dotfiles/nvim/.config/nvim/init.lua`.
- **Git Ignore:** Even with `showUntrackedFiles no`, it's good practice to have a `.gitignore` in your dotfiles repo.

---

## 🔗 See Also
- [Git Guide](../development/GIT_GUIDE.md): Master the tool behind dotfile syncing.
- [Shell Basics](../terminal/SHELL_GUIDE.md): Essential for writing your bootstrap scripts.
- [Neovim](../editors/NEOVIM_GUIDE.md): A common candidate for advanced dotfile management.
