# Shell Guide: Bash & Zsh Essentials

A quick reference for navigating and managing your system through the command line.

## 1. Basic Navigation
| Command        | Description                                      |
| :------------- | :----------------------------------------------- |
| `pwd`          | Print Working Directory (where am I?).           |
| `ls`           | List files in the current directory.             |
| `ls -la`       | List all files, including hidden ones, with details. |
| `cd <dir>`     | Change directory.                                |
| `cd ..`        | Move up one directory level.                     |
| `cd ~`         | Move to your home directory.                     |
| `clear`        | Clear the terminal screen (or use `Ctrl-l`).     |

## 2. File and Directory Operations
| Command        | Description                                      |
| :------------- | :----------------------------------------------- |
| `mkdir <dir>`  | Create a new directory.                          |
| `touch <file>` | Create an empty file.                            |
| `cp <src> <dest>`| Copy a file or directory.                      |
| `mv <src> <dest>`| Move or rename a file or directory.            |
| `rm <file>`    | Remove (delete) a file.                          |
| `rm -rf <dir>` | Remove a directory and all its contents (careful!). |

## 3. Viewing and Searching Text
| Command        | Description                                      |
| :------------- | :----------------------------------------------- |
| `cat <file>`   | Display the entire contents of a file.           |
| `less <file>`  | View a file with pagination (use `q` to exit).   |
| `head -n 10`   | Show the first 10 lines of a file.               |
| `tail -n 10`   | Show the last 10 lines of a file.                |
| `grep "pattern"`| Search for a specific pattern in text or files. |
| `history`      | Show a list of recently used commands.           |

## 4. Permissions and Ownership
| Command        | Description                                      |
| :------------- | :----------------------------------------------- |
| `chmod +x <f>` | Make a file executable.                          |
| `chmod 644 <f>`| Set standard file permissions (rw-r--r--).       |
| `chown user:grp`| Change the owner and group of a file.           |
| `sudo <cmd>`   | Execute a command with superuser privileges.     |

## 5. Aliases and Customization
Aliases allow you to create shortcuts for long or frequent commands.

- `alias ll='ls -la'`: Create a shortcut for `ls -la`.
- `alias ..='cd ..'`: Quickly move up a directory.
- To make these permanent, add them to your shell configuration file.

## 6. Configuration
The shell's behavior is defined by its configuration file in your home directory.

- **Bash Config:** `~/.bashrc` (or `~/.bash_profile` on macOS).
- **Zsh Config:** `~/.zshrc`.
- **Common Settings:**
  - `export PATH=$PATH:/your/custom/bin`: Add a directory to your executable path.
  - `export EDITOR=vim`: Set your default text editor.
  - `PROMPT='%n@%m %~ %# '`: Customize your command prompt (Zsh example).

## 7. Pro Tips & Gotchas
- **Tab Completion:** Always hit `Tab` to autocomplete file names and commands. It saves time and prevents typos.
- **Reverse Search:** Press `Ctrl-r` and start typing to search through your command history.
- **Job Control:** Use `Ctrl-z` to suspend a process and `fg` to bring it back to the foreground.
- **Redirection:** 
  - `>`: Overwrite a file with output.
  - `>>`: Append output to a file.
  - `|`: Pipe output from one command as input to another.

---

## 🔗 See Also
- [Vim Basics](VIM_GUIDE.md): Edit configuration files efficiently.
- [Git Guide](GIT_GUIDE.md): Version control your config files (dotfiles).
