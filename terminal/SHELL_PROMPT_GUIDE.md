# Shell Prompt Guide: Customizing PS1

A reference for understanding and customizing the bash command prompt (`PS1`).

## 1. The Prompt Variable
The bash prompt is controlled primarily by the `PS1` environment variable.

### 1.1 Prompt Structure Diagram
```text
[ \u ] @ [ \h ] : [ \w ] [ \$ ]
  |        |        |      |
 User     Host     Path   Sign ($ or #)
```

## 2. Common Escape Sequences
| Sequence | Description                                      |
| :------- | :----------------------------------------------- |
| `\u`     | Current username.                                |
| `\h`     | Hostname up to the first `.`.                    |
| `\H`     | Full hostname.                                   |
| `\w`     | Current working directory (full path).           |
| `\W`     | Current working directory (basename only).       |
| `\d`     | Current date (Weekday Month Day).                |
| `\t`     | Current time (HH:MM:SS).                         |
| `\$`     | `#` if UID is 0 (root), otherwise `$`.           |
| `\n`     | Newline character.                               |

## 3. Adding Color
Colors use ANSI escape codes. They must be wrapped in `\[` and `\]` so bash correctly calculates the prompt's length.

| Color   | Escape Code      |
| :------ | :--------------- |
| Reset   | `\[\e[0m\]`      |
| Red     | `\[\e[31m\]`     |
| Green   | `\[\e[32m\]`     |
| Yellow  | `\[\e[33m\]`     |
| Blue    | `\[\e[34m\]`     |

**Example:** `PS1="\[\e[32m\]\u@\h\[\e[0m\]:\w\$ "`

## 4. Configuration
To make your prompt changes permanent, add the `export PS1` command to your shell's configuration file.

- **File Location:** `~/.bashrc` (Linux) or `~/.bash_profile` (macOS).
- **Applying Changes:** Run `source ~/.bashrc` after editing.

## 5. Pro Tips & Gotchas
- **Sourcing is Key:** Scripts that change environment variables must be **sourced** (e.g., `source script.sh`) to affect the current shell. Running them directly (e.g., `./script.sh`) only affects the subshell.
- **Escape Wrapping:** Always wrap non-printing characters (like colors) in `\[ ... \]`. Failure to do so will cause the cursor to drift and line wrapping to break.
- **Complexity vs Speed:** Overly complex prompts (e.g., those that run git commands or network checks) can introduce noticeable lag between commands.

---

## 🔗 See Also
- [Shell Guide](SHELL_GUIDE.md): General bash and zsh essentials.
- [Vim Guide](../editors/VIM_GUIDE.md): Efficiently edit your `.bashrc`.
- [Git Guide](../development/GIT_GUIDE.md): Use your prompt to show the current git branch.
