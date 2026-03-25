# Scenario: The Nomad Coder

**The Crisis:** You're at a tech conference, and your primary laptop's motherboard fries itself during a live demo. A generous organizer lends you a fresh "clean" laptop with only a basic Linux install and a terminal. You have 10 minutes before your next session, and you need your custom Vim mappings, Zsh aliases, and tmux configuration to be productive.

## 1. The Investigation: Where are my keys?
You don't have time to manually copy files or install complex management tools. Fortunately, you follow the "Bare Git Repo" strategy for your dotfiles, and they are hosted on a public GitHub repository.

## 2. The Solution: The Bootstrap Command
You run a few precise commands to pull your entire environment onto this new machine.

```bash
# 1. Define the alias for this session
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# 2. Clone your bare repo
git clone --bare https://github.com/bpfurtado/dotfiles.git $HOME/.cfg

# 3. Checkout the actual files into your $HOME
config checkout
```

## 3. The Resolution: Handling Overwrites
Git warns you that some default files (like `.bashrc`) already exist. You move them out of the way and finish the setup.

```bash
# Move existing files to a backup folder
mkdir -p .dotfiles-backup
config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .dotfiles-backup/{}

# Try checkout again
config checkout

# Hide untracked files to keep your $HOME clean
config config --local status.showUntrackedFiles no
```

## 4. The Aftermath: Instant Familiarity
You source your `.zshrc`, and suddenly:
- Your custom prompt appears.
- Your `vi` opens with all your plugins.
- Your `tmux` session is ready with your favorite status bar.

You walk onto the stage with a borrowed laptop that feels exactly like your own.

### Senior Engineer's Retrospective
- **Tool Choice:** The "Bare Git" method requires zero dependencies other than Git itself, making it perfect for "nomad" scenarios.
- **Workflow:** Using `awk` and `xargs` to bulk-move conflicting files saved precious minutes.
- **Resilience:** Your environment is no longer a physical object (your laptop); it's a portable data structure.
- **Lesson:** Always keep your dotfiles version-controlled and public (or easily accessible). Your terminal is your home, no matter which machine you're using.

---

## 🔗 Related Guides
- [Dotfiles Management Guide](../development/DOTFILES_GUIDE.md)
- [Shell Basics](../terminal/SHELL_GUIDE.md): Master the `awk` and `xargs` pipes used here.
- [Git Guide](../development/GIT_GUIDE.md): The core technology behind the "Bare Repo" method.
