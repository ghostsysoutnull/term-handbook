# Core Utilities Guide: Essential Unix Programs

A comprehensive reference for the standard programs and shell builtins used for file manipulation, environment management, and system interaction.

## 1. File & Directory Management
These tools are used to organize and manipulate the filesystem.

| Command        | Description                                      | Example                                           |
| :------------- | :----------------------------------------------- | :------------------------------------------------ |
| **`cp`**       | Copy files or directories.                       | `cp -r src/ dest/` (Recursive copy)               |
| **`mv`**       | Move or rename files/directories.                | `mv old_name.txt new_name.txt`                    |
| **`rm`**       | Remove files or directories.                     | `rm -rf tmp/` (Force recursive remove)            |
| **`ln`**       | Create links (hard or symbolic).                 | `ln -s target link_name` (Symbolic link)          |
| **`mkdir`**    | Create a new directory.                          | `mkdir -p a/b/c` (Create parent dirs as needed)   |
| **`touch`**    | Create an empty file or update timestamps.       | `touch index.js`                                  |

## 2. Shell Environment & Builtins
Unlike binaries, "builtins" are commands that run directly inside the shell process.

| Command        | Description                                      | Example                                           |
| :------------- | :----------------------------------------------- | :------------------------------------------------ |
| **`source`**   | Execute commands from a file in current shell.   | `source ~/.bashrc` (or `. ~/.bashrc`)             |
| **`export`**   | Set an environment variable for child processes. | `export NODE_ENV=production`                      |
| **`alias`**    | Create a shortcut for a command.                 | `alias gs='git status'`                           |
| **`unalias`**  | Remove an existing alias.                        | `unalias gs`                                      |
| **`env`**      | Run a program in a modified environment.         | `env -i bash` (Start bash with empty environment) |
| **`printenv`** | Print all or part of the environment.            | `printenv PATH`                                   |

## 3. Location & Discovery
Find where programs and files are located on your system.

| Command        | Description                                      | Example                                           |
| :------------- | :----------------------------------------------- | :------------------------------------------------ |
| **`which`**    | Locate a command in the user's `PATH`.           | `which python3`                                   |
| **`whereis`**  | Locate binary, source, and manual page files.    | `whereis ls`                                      |
| **`type`**     | Identify how a name would be interpreted.        | `type -a ls` (Shows if it's an alias or builtin)  |
| **`find`**     | Search for files in a directory hierarchy.       | `find . -name "*.log"`                            |

## 4. Permissions & Ownership
Manage who can read, write, or execute files.

| Command        | Description                                      | Example                                           |
| :------------- | :----------------------------------------------- | :------------------------------------------------ |
| **`chmod`**    | Change file mode (permissions).                  | `chmod +x script.sh` (Make executable)            |
| **`chown`**    | Change file owner and group.                     | `chown user:group file.txt`                       |
| **`umask`**    | Set default file creation permissions.           | `umask 022`                                       |

## 5. Output & Redirection Utilities
| Command        | Description                                      | Example                                           |
| :------------- | :----------------------------------------------- | :------------------------------------------------ |
| **`echo`**     | Display a line of text.                          | `echo "Hello World"`                              |
| **`cat`**      | Concatenate and print files.                     | `cat file1 file2 > combined`                      |
| **`tee`**      | Read from stdin and write to stdout AND files.   | `ls | tee output.txt`                             |
| **`xargs`**    | Build and execute commands from standard input.  | `find . -name "*.tmp" | xargs rm`                 |

## 6. Pro Tips & Gotchas
- **`source` vs Execute:** Running `./script.sh` starts a **new** shell process. Running `source ./script.sh` runs it in the **current** shell (allowing it to change your variables).
- **`cp -a`:** Use the "archive" flag (`-a`) to preserve permissions, timestamps, and symbolic links during a copy.
- **`rm` is Permanent:** There is no "Trash" in the terminal. Once you `rm` a file, it is gone. Always double-check your `rm -rf` targets.
- **`xargs` and Spaces:** If your filenames have spaces, use `find -print0 | xargs -0` to prevent errors.

---

## 🔗 See Also
- [Shell Basics](SHELL_GUIDE.md): Navigation and basic command-line concepts.
- [Linux Filesystem](FILESYSTEM_GUIDE.md): Understand the structure where you use these tools.
- [Power User Toolkit](POWER_USER_TOOLKIT.md): Modern alternatives like `fd` (for `find`).
